# Information on datasets

Repository contains 3 datasets

  + kzis-hierarchy-2023.tsv -- hierarchy of the KZiS 2023 classification (tab separated)
  + train-data-2024.tar.gz -- 142,729 rows and 3 columns (CSV)
  + test-data-2024.tar.gz --  58,104 rows and 3 columns (CSV)

Each row is a textual data (in Polish) associated with a given code. It may be part of the official definition of a given code, a few synonyms or a job description taken from online services.

Each dataset contains 3 columns:

  + class -- 6-digit code according to the Polish Classification of Professions and Specialisations 2024 (https://psz.praca.gov.pl/rynek-pracy/bazy-danych/klasyfikacja-zawodow-i-specjalnosci),
  + desc -- textual data associated with a given code (in Polish),
  + source -- information on the source of the data set:
      + official -- official description of occupations taken from the official dictionary (https://psz.praca.gov.pl/rynek-pracy/bazy-danych/klasyfikacja-zawodow-i-specjalnosci/wyszukiwarka-opisow-zawodow),
      + info -- official description taken from INFOdoradca+ (https://psz.praca.gov.pl/rynek-pracy/bazy-danych/infodoradca),
      + gus -- thesaurus prepared by the Polish Statistical Office (https://stat.gov.pl/Klasyfikacje/doc/kzs/slownik.html).
      + esco -- selected codes related to ESCO (https://esco.ec.europa.eu/pl),
      + cbop -- job offers from CBOP (https://oferty.praca.gov.pl/portal/index.cbop#/dlaInt),
      + hand -- 10k hand coded offers from online job advertisement services (coded by 3 experts),
      + hand1k -- additional 1k hand coded offers from online job advertisement services (coded by 1 expert),
      + kprm -- selected job offers from KPRM (https://nabory.kprm.gov.pl),
      

Information about codes and sources:

  + codes: 2,911 unique codes in train, 2,625 unique codes in test data.
  
  + sources -- train
  
|source   |       N|
|:--------|-------:|
|cbop     | 116,879|
|official |   9,200|
|hand     |   6,720|
|info     |   4,999|
|kprm     |   2,058|
|esco     |   1,531|
|gus      |   1,342|
  
  + source -- test
  
|source |      N|
|:------|------:|
|cbop   | 50,365|
|hand   |  3,272|
|info   |  2,001|
|hand1k |  1,000|
|kprm   |    883|
|esco   |    583|

Detailed information about the data can be found here: https://github.com/OJALAB/job-ads-datasets
