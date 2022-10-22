# Datasets for job ads classification

Datasets for training and testing (folder `data/`)

1. `ksiz-official-2022.csv` -- official KSiZ structure ([link](https://psz.praca.gov.pl/rynek-pracy/bazy-danych/klasyfikacja-zawodow-i-specjalnosci))
2. `ksiz-occup-dictionary.csv` -- official KSiZ description of occupations (6 digits)
3. `ksiz-occup-infodoradca.csv` -- official, additional description of 1000 selected KSiz codes ([link](https://psz.praca.gov.pl/rynek-pracy/bazy-danych/infodoradca))
4. `ksiz-desc-level2.csv`, `ksiz-desc-level3.csv` and `ksiz-desc-level4.csv` -- official description of 2, 3 and 4 digits codes (hierarchy)
5. `gus-thesaurus.csv` -- thesaurus of KSiZ codes created by Statistics Poland
6. `esco-ksiz-selected.csv` -- selected ESCO codes that match 1-1 KSiZ codes (based on IBE file `data-raw/ksiz_esco_crosswalk.csv`)


## Coverage of codes

+ As of 2021-10-21 *519* codes did not have official description, in particular *158* codes that did not end with `90` ("Pozostali ...")


| dict|  esco|  thes|  info| kprm|  hand|  cbop|   all|
|----:|-----:|-----:|-----:|----:|-----:|-----:|-----:|
|  100| 19.16| 46.03| 34.16| 0.41| 35.71| 78.91| 90.95|


Codes that are not covered in datasets


