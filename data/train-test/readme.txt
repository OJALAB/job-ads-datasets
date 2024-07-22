# Information on datasets

Repository contains 4 datasets

 + train-data-2024.tar.gz -- 140,985 rows and 3 columns
 + test-data-2024.tar.gz --  56,989 rows and 3 columns
 + train-data-whole-2024.tar.gz -- 602,307 rows and 3 columns
 + test-data-whole-2024.tar.gz -- 254,698 and 3 columns

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
      + hand -- hand coded offers from online job advertisement services (coded by 3 experts),
      + kprm -- selected job offers from KPRM (https://nabory.kprm.gov.pl),
      
Detailed information about the data can be found here: https://github.com/OJALAB/job-ads-datasets
