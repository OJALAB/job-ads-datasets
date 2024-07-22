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
10. `cbop-for-train-test.-whole-{1,2,3,4}.tar.gz` -- ads from CBOP coded by Public Employment Offices staff (whole dataset)

Datasets for training and testing (folder `data/train-test`):

-   `train-data-2024.tar.gz` -- file with train data for 2024 model
-   `test-data-2024.tar.gz` -- file with test data for 2024 model
-   `train-data-whole-2024-{1,2}.tar.gz` -- file with train data for 2024 model (whole CBOP dataset)
-   `test-data-whole-2024.tar.gz` -- file with test data for 2024 model (whole CBOP dataset)

Rest of the repository:

-   `data-raw` -- folder with input datasets
-   `codes` -- codes to web-scrape and process the data for training and test

## Coverage of codes (as of 2024-07-19)

Overall coverage of 6 digit codes

|  info |   gus |  esco | kprm |  hand | hand1k |  cbop |   all |
|------:|------:|------:|-----:|------:|-------:|------:|------:|
| 34.22 | 45.96 | 19.13 | 0.41 | 35.69 |   7.63 | 84.78 | 93.61 |

Overall coverage of 6 digit codes aggregated at 1 digit groups

| Main groups (1 digit)                                             |  info |    gus |  esco | kprm |  hand | hand1k |   cbop |    all |
|:-------|-------:|-------:|-------:|-------:|-------:|-------:|-------:|-------:|
| 0 Siły zbrojne                                                    |  0.00 | 100.00 | 33.33 | 0.00 |  0.00 |   0.00 | 100.00 | 100.00 |
| 1 Przedstawiciele władz publicznych, wyżsi urzędnicy i kierownicy |  6.44 |  85.64 | 19.80 | 0.99 | 42.08 |  14.85 |  79.70 |  95.54 |
| 2 Specjaliści                                                     | 23.83 |  25.98 | 20.66 | 0.63 | 39.29 |  14.45 |  77.06 |  89.35 |
| 3 Technicy i inny średni personel                                 | 35.74 |  48.03 | 20.00 | 0.66 | 29.67 |   4.43 |  83.61 |  92.46 |
| 4 Pracownicy biurowi                                              | 53.93 |  21.35 | 20.22 | 1.12 | 53.93 |   8.99 |  95.51 |  98.88 |
| 5 Pracownicy usług i sprzedawcy                                   | 61.45 |  28.92 | 27.11 | 0.00 | 37.95 |   6.63 |  89.16 |  96.99 |
| 6 Rolnicy, ogrodnicy, leśnicy i rybacy                            | 69.84 |  57.14 | 12.70 | 0.00 | 11.11 |   0.00 |  85.71 |  98.41 |
| 7 Robotnicy przemysłowi i rzemieślnicy                            | 46.22 |  46.64 | 16.81 | 0.00 | 39.29 |   4.62 |  89.50 |  94.33 |
| 8 Operatorzy i monterzy maszyn i urządzeń                         | 40.83 |  82.43 | 15.25 | 0.00 | 25.32 |   2.07 |  90.96 |  97.93 |
| 9 Pracownicy wykonujący prace proste                              |  3.97 |  15.87 | 16.67 | 0.00 | 47.62 |   1.59 |  96.03 |  96.03 |

# How to cite

If you plan to use the datasets prepared for training we kindly you ask to cite the following repository (<https://repod.icm.edu.pl/dataverse/uep>)

```         
TBA
```

# Funding

Maciej Beręsewicz work was funded by the Polish National Agency for Academic Exchange (NAWA) under The Bekker NAWA Programme, grant number BPN/BEK/2023/1/00099/U/00001 (visit at University of Manchester between 01.06 and 31.08.2024).

[![](https://raw.githubusercontent.com/OJALAB/CBOP-datasets/main/docs/logo-nawa.png)](https://nawa.gov.pl/en/)
