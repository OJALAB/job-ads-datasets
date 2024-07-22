# Datasets for job ads classification

Datasets for training and testing (folder `data/`)

1.  `kzis-hierarchy-2023.tsv` -- official hierarchy for 2023
2.  `kzis-occup-dictionary-long-2024.csv` -- official definitions of occupations (`dict`)
3.  `kzis-occup-infodoradca-2024-updated.csv` -- official definitions of 1,000 occupations from INFOdoradca+ (`info`)
4.  `kprm-selected.csv` -- selected occupations from KPRM (nabory.kprm.gov.pl, `kprm`)
5.  `hand-coded.csv` -- 10k ads hand-coded by 3 experts (`hand`)
6.  `hand-coded-1k.csv` -- additional 1k ads hand-codes by 1 expert
7.  `gus-thesaurus.csv` -- official thesaurus from GUS (`thes`)
8.  `esco-kzis-selected.csv` -- selected occupations connected with ESCO (`esco`)
9.  `cbop-for-train-test.tar.gz` -- ads from CBOP coded by Public Employment Offices staff (20% sample of `cbop-train-2020-2022-no-employer.tar.gz` and `cbop-train-2022-2023-no-employer.tar.gz`, `cbop`)
10.  `cbop-for-train-test.-whole-{1,2,3,4}.tar.gz` -- ads from CBOP coded by Public Employment Offices staff (whole dataset)


Datasets for training and testing (folder `data/train-test`):

-   `train-data-2024.tar.gz` -- file with train data for 2024 model
-   `test-data-2024.tar.gz` -- file with test data for 2024 model
-   `train-data-whole-2024-{1,2}.tar.gz` -- file with train data for 2024 model (whole CBOP dataset)
-   `test-data-whole-2024.tar.gz` -- file with test data for 2024 model (whole CBOP dataset)

Rest of the repository:

+ `data-raw` -- folder with input datasets 
+ `codes` -- codes to web-scrape and process the data for training and test


## Coverage of codes (as of 2024-07-19)

Overall coverage of 6 digit codes

| dict |  esco |  thes |  info | kprm |  hand | cbop |  all |
|-----:|------:|------:|------:|-----:|------:|-----:|-----:|
|  100 | 19.13 | 45.96 | 34.22 | 0.41 | 35.69 | 78.8 | 90.9 |

Overall coverage of 6 digit codes aggregated at 1 digit groups

| Main groups (1 digit)                                             | dict |  esco |   thes |  info | kprm |  hand |  cbop |    all |
|:-------|-------:|-------:|-------:|-------:|-------:|-------:|-------:|-------:|
| 0 Siły zbrojne                                                    |  100 | 33.33 | 100.00 |  0.00 | 0.00 |  0.00 | 33.33 | 100.00 |
| 1 Przedstawiciele władz publicznych, wyżsi urzędnicy i kierownicy |  100 | 19.80 |  85.64 |  6.44 | 0.99 | 42.08 | 74.26 |  93.56 |
| 2 Specjaliści                                                     |  100 | 20.66 |  25.98 | 23.83 | 0.63 | 39.29 | 69.07 |  84.54 |
| 3 Technicy i inny średni personel                                 |  100 | 20.00 |  48.03 | 35.74 | 0.66 | 29.67 | 75.08 |  90.00 |
| 4 Pracownicy biurowi                                              |  100 | 20.22 |  21.35 | 53.93 | 1.12 | 53.93 | 92.13 |  96.63 |
| 5 Pracownicy usług i sprzedawcy                                   |  100 | 27.11 |  28.92 | 61.45 | 0.00 | 37.95 | 83.13 |  95.18 |
| 6 Rolnicy, ogrodnicy, leśnicy i rybacy                            |  100 | 12.70 |  57.14 | 69.84 | 0.00 | 11.11 | 80.95 |  98.41 |
| 7 Robotnicy przemysłowi i rzemieślnicy                            |  100 | 16.81 |  46.64 | 46.22 | 0.00 | 39.29 | 87.18 |  92.86 |
| 8 Operatorzy i monterzy maszyn i urządzeń                         |  100 | 15.25 |  82.43 | 40.83 | 0.00 | 25.32 | 86.82 |  96.12 |
| 9 Pracownicy wykonujący prace proste                              |  100 | 16.67 |  15.87 |  3.97 | 0.00 | 47.62 | 93.65 |  93.65 |

# How to cite

If you plan to use the datasets prepared for training we kindly you ask to cite the following doi

# Funding

Maciej Beręsewicz work was funded by the Polish National Agency for Academic Exchange (NAWA) under The Bekker NAWA Programme, grant number BPN/BEK/2023/1/00099/U/00001 (visit at University of Manchester between 01.06 and 31.08.2024).

[![](https://raw.githubusercontent.com/OJALAB/CBOP-datasets/main/docs/logo-nawa.png)](https://nawa.gov.pl/en/)

