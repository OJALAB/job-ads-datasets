## libraries

library(rvest)
library(dplyr)
library(data.table)
library(janitor)
library(stringr)


# official dictionary -----------------------------------------------------

## letters
base_url <- "https://psz.praca.gov.pl/rynek-pracy/bazy-danych/klasyfikacja-zawodow-i-specjalnosci/wyszukiwarka-opisow-zawodow//-/klasyfikacja_zawodow/litera/A"
litery <- read_html(base_url) %>% 
  html_nodes("div.job-classification_letter-navigation > span > a") %>%
  html_attr("href")

## links to specific occupancies

opisy_linki <- lapply(litery, function(x) {
  x %>%
    read_html() %>%
    html_nodes("table.job-classification_search-results.results-grid") %>%
    html_nodes("a") %>%
    html_attr("href")
})

opisy_linki <- unlist(opisy_linki)

## scraping descriptions

opisy_zawodow <- list()
k <- 1
for (z in opisy_linki) {
  if (k %% 50 == 0) {
    print(k)
  }
  opisy_zawodow[[k]] <- z %>%
    read_html() %>%
    html_table() %>%
    .[[1]] %>%
    rename(koluma = X1, opis = X2)
  k <- k + 1
}

## transforming

opisy_zawodow <- bind_rows(opisy_zawodow, .id = "strona")
opisy_zawodow <- setDT(opisy_zawodow)
opisy_zawodow[, koluma:=tolower(koluma)]
opisy_zawodow[, koluma:=gsub("\\:", "", koluma)]
opisy_zawodow[, koluma:=gsub(" ", "_", koluma)]
opisy_zawodow <- opisy_zawodow[str_detect(koluma, "^(nazwa|kod|liczba_odwiedzin|synteza|zadania_zawodowe|dodatkowe_zadania_zawodowe)$")]
opisy_zawodow[strona %in% opisy_zawodow[opis == "Opis w opracowaniu"]$strona & koluma == "nazwa", ]
opisy_zawodow[koluma == "kod", zawod:=opis]
opisy_zawodow[, zawod := na.omit(unique(zawod)), by=strona]
opisy_zawodow_wide <- dcast(opisy_zawodow, zawod ~ koluma, value.var = "opis")
opisy_zawodow_wide <- opisy_zawodow_wide[,.(code=zawod, name=nazwa, synthesis=synteza, tasks1=zadania_zawodowe, tasks2=dodatkowe_zadania_zawodowe)]
opisy_zawodow_wide <- opisy_zawodow_wide[order(code)]

klucz <- read_excel("data-raw/ksiz_kody_2014_2022_klucz.xls", 
                    col_names = c("zawod_old", "nazwa_old", "zawod_new", "nazwa_new"), skip = 1, col_types = "text")
klucz <- setDT(klucz)

opisy_zawodow_wide <- merge(x = opisy_zawodow_wide, 
                            y = klucz[zawod_old != zawod_new][, .(code = zawod_old,  code_new = zawod_new)],
                            all.x=T)

opisy_zawodow_wide[is.na(code_new), code_new:=code]
opisy_zawodow_wide[synthesis == "Opis w opracowaniu", synthesis:=""]
opisy_zawodow_wide[tasks1 == "Opis w opracowaniu", tasks1:=""]
opisy_zawodow_wide[tasks2 == "Opis w opracowaniu", tasks2:=""]

setnames(opisy_zawodow_wide, "code", "code_old")
setnames(opisy_zawodow_wide, "code_new", "code")

opisy_zawodow_wide[, desc:= paste(name, synthesis)]
opisy_zawodow_wide[nchar(tasks2) < 10, tasks2:=""]

fwrite(opisy_zawodow_wide, "data/kzis-occup-dictionary.csv")

opisy_zawodow_long <- melt(opisy_zawodow_wide[,.(code, desc, tasks1, tasks2)], id.vars = "code", value.name = "desc")
opisy_zawodow_long <- opisy_zawodow_long[desc!=""] 

fwrite(opisy_zawodow_long, "data/kzis-occup-dictionary-long.csv")

## add old colde
# more info from infodoradca+ ---------------------------------------------


## get links to infodoradca

more_info <- sapply(1:length(opisy_linki), function(x) {
  print(x)
  opisy_linki[x]  %>%
    read_html() %>%
    html_node("div.read-more > a" ) %>%
    html_attr("href") 
})

more_info_full <- na.omit(more_info)
more_info_full <- paste0("https://psz.praca.gov.pl",more_info_full)


opisy_1000 <- list()

k <- 1
for (i in more_info_full) {
  opisy_1000[[k]] <- read_html(i) %>%
    html_nodes("div.occupation-details") %>%
    html_nodes("div.characteristic") %>%
    html_nodes("div.description > blok > sekcja") %>%
    html_text() %>%
    str_replace_all("\\n|\\t", " ") %>%
    .[c(1, 2, 5, 6, 9, 12, 13:15)] %>%
    trimws()
  k <- k + 1
  if (k %% 10 ==0) print(k)
  
}


opisy_1000_df <- do.call('rbind',opisy_1000)
opisy_1000_df <- as.data.frame(opisy_1000_df)
opisy_1000_df <- setDT(opisy_1000_df)



setnames(opisy_1000_df, 
         names(opisy_1000_df),
         c("kod_zawodu", "synonimy", "synteza", "opis_pracy", "wyksztalcenie", 
           "zadania", "kompetencja1", "kompetencja2", "kompetencja3"))

opisy_1000_df[, kod_zawodu:=str_extract(kod_zawodu, "\\d{6}")]
opisy_1000_df[, opis_pracy:=str_replace(opis_pracy, "Opis pracy ", "")]

opisy_1000_df[, wyksztalcenie:=str_remove(wyksztalcenie, "Wykształcenie niezbędne do podjęcia pracy w zawodzie ")]
opisy_1000_df[, wyksztalcenie:=str_remove(wyksztalcenie, "Obecnie \\(\\d{4} r\\.\\) ")]
opisy_1000_df[, zadania:=str_remove(zadania, "Pracownik w ")]
opisy_1000_df[, kompetencja1:=str_remove(kompetencja1, "Kompetencja zawodowa Kz\\d{1}\\: ")]
opisy_1000_df[, kompetencja2:=str_remove(kompetencja2, "Kompetencja zawodowa Kz\\d{1}\\: ")]
opisy_1000_df[, kompetencja3:=str_remove(kompetencja3, "Kompetencja zawodowa Kz\\d{1}\\: ")]

opisy_1000_df[str_detect(synonimy, "Nie wyst"), synonimy:=""]

opisy_1000_df[, desc1 := paste(synonimy, synteza)]
opisy_1000_df[, desc2 := opis_pracy]
opisy_1000_df[, desc3 := wyksztalcenie]
opisy_1000_df[, desc4 := zadania]
opisy_1000_df[, desc5 := kompetencja1]
opisy_1000_df[, desc6 := kompetencja2]
opisy_1000_df[, desc7 := kompetencja3]


opisy_1000_long <- melt(data = opisy_1000_df[,.(kod_zawodu, desc1,desc2,desc3,desc4,desc5,desc6,desc7)],
                        id.vars = "kod_zawodu",
                        measure.vars = paste0("desc", 1:7),
                        value.name = "desc")
setnames(opisy_1000_long, "kod_zawodu", "class")

