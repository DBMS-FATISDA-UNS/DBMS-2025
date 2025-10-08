-- Buat database
IF DB_ID('mondial_ujian') IS NULL
    CREATE DATABASE mondial_ujian;
GO

USE mondial_ujian;
GO

-- Menambahkan data ke tabel continents
INSERT INTO continents (name) 
VALUES 
('Africa'),
('Asia'),
('Europe'),
('North America'),
('South America'),
('Oceania'),
('Antarctica'),
('Eurasia'),
('Middle East'),
('Central America'),
('Caribbean'),
('Scandinavia'),
('Arabian Peninsula'),
('Northern Africa'),
('Southern Europe'),
('Southeast Asia'),
('Central Asia'),
('East Asia'),
('West Africa'),
('South Asia');
GO


-- Menambahkan data ke tabel countries
INSERT INTO countries (country_code, name, population, area)
VALUES 
('USA', 'United States', 331002651, 9833517),
('CAN', 'Canada', 37742154, 9984670),
('IND', 'India', 1380004385, 3287263),
('BRA', 'Brazil', 212559417, 8515767),
('FRA', 'France', 67081000, 551695),
('DEU', 'Germany', 83149300, 357022),
('CHN', 'China', 1439323776, 9596961),
('RUS', 'Russia', 146748590, 17098242),
('JPN', 'Japan', 125800000, 377975),
('AUS', 'Australia', 25687041, 7692024),
('ZAF', 'South Africa', 59308690, 1221037),
('EGY', 'Egypt', 102334404, 1002450),
('MEX', 'Mexico', 128932753, 1964375),
('ARG', 'Argentina', 45195774, 2780400),
('KOR', 'South Korea', 51780579, 100210),
('SAU', 'Saudi Arabia', 34813871, 2149690),
('IRN', 'Iran', 83992949, 1648195),
('THA', 'Thailand', 69830779, 513120),
('PHL', 'Philippines', 109581078, 300000),
('IDN', 'Indonesia', 273523615, 1904569),
('ESP', 'Spain', 46754778, 505990),
('ITA', 'Italy', 60244639, 301340),
('GBR', 'United Kingdom', 67886011, 243610),
('PAK', 'Pakistan', 220892340, 881913),
('NGA', 'Nigeria', 206139589, 923768),
('KEN', 'Kenya', 53771296, 580367),
('COL', 'Colombia', 50882891, 1141748),
('VNM', 'Vietnam', 97338579, 331212),
('TUR', 'Turkey', 84339067, 783562),
('UKR', 'Ukraine', 44134693, 603628);
GO


-- Menambahkan data ke tabel cities
INSERT INTO cities (name, population, country_code)
VALUES 
('New York', 8175133, 'USA'),
('Toronto', 2731571, 'CAN'),
('Mumbai', 12478447, 'IND'),
('Sao Paulo', 12325232, 'BRA'),
('Paris', 2148327, 'FRA'),
('Berlin', 3769495, 'DEU'),
('Beijing', 21516000, 'CHN'),
('Moscow', 11920000, 'RUS'),
('Tokyo', 13960000, 'JPN'),
('Sydney', 5312163, 'AUS'),
('Cape Town', 433688, 'ZAF'),
('Cairo', 10230350, 'EGY'),
('Mexico City', 8918653, 'MEX'),
('Buenos Aires', 2891082, 'ARG'),
('Seoul', 9776000, 'KOR'),
('Riyadh', 7600000, 'SAU'),
('Tehran', 8846782, 'IRN'),
('Bangkok', 8281000, 'THA'),
('Manila', 1780148, 'PHL'),
('Jakarta', 10770487, 'IDN'),
('Madrid', 6661949, 'ESP'),
('Rome', 2873000, 'ITA'),
('London', 8982000, 'GBR'),
('Karachi', 14910352, 'PAK'),
('Lagos', 14000000, 'NGA'),
('Nairobi', 4397073, 'KEN'),
('Bogota', 7743955, 'COL'),
('Hanoi', 8000000, 'VNM'),
('Istanbul', 15029231, 'TUR'),
('Kyiv', 2967360, 'UKR');
GO


-- Menambahkan data ke tabel country_continent
-- Asumsikan urutan continent_id sesuai urutan insert
INSERT INTO country_continent (country_code, continent_id)
VALUES
('USA', 4), ('CAN', 4), ('MEX', 4),
('BRA', 5), ('ARG', 5), ('COL', 5),
('FRA', 3), ('DEU', 3), ('ESP', 3), ('ITA', 3), ('GBR', 3), ('UKR', 3),
('IND', 2), ('CHN', 2), ('JPN', 2), ('RUS', 2), ('KOR', 2), ('THA', 2), ('PHL', 2), ('IDN', 2), ('VNM', 2), ('PAK', 2),
('ZAF', 1), ('EGY', 1), ('NGA', 1), ('KEN', 1),
('AUS', 6),
('SAU', 9), ('IRN', 9), ('TUR', 9);
GO


-- Menambahkan data ke tabel languages
INSERT INTO languages (language_code, name)
VALUES
('ENG', 'English'),
('FRA', 'French'),
('SPA', 'Spanish'),
('HIN', 'Hindi'),
('POR', 'Portuguese'),
('GER', 'German'),
('ZHO', 'Chinese'),
('RUS', 'Russian'),
('JPN', 'Japanese'),
('ARA', 'Arabic'),
('KOR', 'Korean'),
('ITA', 'Italian'),
('NLD', 'Dutch'),
('TUR', 'Turkish'),
('UKR', 'Ukrainian'),
('VIE', 'Vietnamese'),
('THA', 'Thai'),
('URD', 'Urdu'),
('IND', 'Bahasa Indonesia'),
('MAL', 'Malay'),
('POL', 'Polish'),
('SWE', 'Swedish'),
('ROH', 'Romansh'),
('AFR', 'Afrikaans'),
('GRC', 'Greek'),
('HEB', 'Hebrew'),
('FAO', 'Faroese'),
('CES', 'Czech'),
('NOR', 'Norwegian'),
('DAN', 'Danish');
GO


-- Menambahkan data ke tabel country_language
INSERT INTO country_language (country_code, language_code, is_official, percentage)
VALUES
('USA', 'ENG', 1, 80.0),
('CAN', 'ENG', 1, 75.0),
('CAN', 'FRA', 1, 23.0),
('BRA', 'POR', 1, 98.0),
('FRA', 'FRA', 1, 100.0),
('DEU', 'GER', 1, 99.0),
('CHN', 'ZHO', 1, 99.5),
('RUS', 'RUS', 1, 98.5),
('JPN', 'JPN', 1, 100.0),
('AUS', 'ENG', 1, 97.0),
('ZAF', 'ENG', 1, 10.0),
('ZAF', 'AFR', 1, 13.0),
('EGY', 'ARA', 1, 98.0),
('MEX', 'SPA', 1, 99.0),
('ARG', 'SPA', 1, 98.0),
('KOR', 'KOR', 1, 99.0),
('SAU', 'ARA', 1, 100.0),
('IRN', 'FRA', 0, 10.0),
('THA', 'THA', 1, 99.0),
('PHL', 'ENG', 1, 63.0),
('IDN', 'IND', 1, 95.0),
('ESP', 'SPA', 1, 100.0),
('ITA', 'ITA', 1, 100.0),
('GBR', 'ENG', 1, 100.0),
('PAK', 'URD', 1, 90.0),
('NGA', 'ENG', 1, 53.0),
('KEN', 'ENG', 1, 60.0),
('COL', 'SPA', 1, 99.0),
('VNM', 'VIE', 1, 99.0),
('TUR', 'TUR', 1, 95.0),
('UKR', 'UKR', 1, 85.0);
GO


-- Menambahkan data ke tabel religions
INSERT INTO religions (name)
VALUES
('Christianity'),
('Islam'),
('Hinduism'),
('Buddhism'),
('Judaism'),
('Atheism'),
('Sikhism'),
('Jainism'),
('Shinto'),
('Taoism'),
('Baháʼí Faith'),
('Zoroastrianism'),
('Confucianism'),
('Animism'),
('Spiritualism'),
('Agnosticism'),
('Rastafari'),
('Tenrikyo'),
('Cao Dai'),
('Scientology'),
('Druze'),
('Gnosticism'),
('Unitarianism'),
('Paganism'),
('Deism'),
('Universalism'),
('Shamanism'),
('No Religion'),
('Eastern Orthodoxy'),
('Protestantism');
GO


-- Menambahkan data ke tabel country_religion
INSERT INTO country_religion (country_code, religion_id, percentage)
VALUES
('USA', 1, 70.0),
('CAN', 1, 67.0),
('IND', 3, 79.8),
('BRA', 1, 87.0),
('FRA', 1, 64.0),
('DEU', 30, 60.0),
('CHN', 6, 50.0),
('RUS', 29, 72.0),
('JPN', 4, 35.0),
('AUS', 1, 52.0),
('ZAF', 1, 79.0),
('EGY', 2, 90.0),
('MEX', 1, 85.0),
('ARG', 1, 92.0),
('KOR', 1, 30.0),
('SAU', 2, 99.0),
('IRN', 2, 98.0),
('THA', 4, 94.0),
('PHL', 1, 90.0),
('IDN', 2, 87.0),
('ESP', 1, 71.0),
('ITA', 1, 80.0),
('GBR', 1, 60.0),
('PAK', 2, 95.0),
('NGA', 2, 50.0),
('KEN', 1, 85.0),
('COL', 1, 90.0),
('VNM', 6, 73.0),
('TUR', 2, 99.0),
('UKR', 29, 78.0);
GO


-- Menambahkan data ke tabel organizations
INSERT INTO organizations (name, headquarters, established_year)
VALUES
('United Nations', 'New York', 1945),
('NATO', 'Brussels', 1949),
('WHO', 'Geneva', 1948),
('European Union', 'Brussels', 1993),
('ASEAN', 'Jakarta', 1967),
('African Union', 'Addis Ababa', 2002),
('World Bank', 'Washington D.C.', 1944),
('IMF', 'Washington D.C.', 1944),
('OPEC', 'Vienna', 1960),
('UNESCO', 'Paris', 1945),
('OECD', 'Paris', 1961),
('Interpol', 'Lyon', 1923),
('Red Cross', 'Geneva', 1863),
('WTO', 'Geneva', 1995),
('UNICEF', 'New York', 1946),
('G20', 'Various', 1999),
('FAO', 'Rome', 1945),
('ILO', 'Geneva', 1919),
('ITU', 'Geneva', 1865),
('IAEA', 'Vienna', 1957),
('ICC', 'The Hague', 2002),
('World Meteorological Organization', 'Geneva', 1950),
('UNHCR', 'Geneva', 1950),
('UNDP', 'New York', 1965),
('UN Women', 'New York', 2010),
('UNAIDS', 'Geneva', 1996),
('World Economic Forum', 'Geneva', 1971),
('BRICS', 'Various', 2009),
('G7', 'Various', 1975),
('Commonwealth of Nations', 'London', 1931);
GO


-- Menambahkan data ke tabel country_organization
-- Asumsikan organisasi dimulai dari id 1
INSERT INTO country_organization (country_code, org_id, membership_year)
VALUES
('USA', 1, 1945), ('CAN', 1, 1945), ('IND', 1, 1945),
('BRA', 1, 1945), ('FRA', 1, 1945), ('DEU', 1, 1945), ('CHN', 1, 1945),
('RUS', 1, 1945), ('JPN', 1, 1945), ('AUS', 1, 1945),
('MEX', 1, 1945), ('KOR', 1, 1945), ('ZAF', 6, 2002), ('EGY', 6, 2002),
('SAU', 9, 1960), ('IRN', 9, 1960), ('THA', 5, 1967), ('PHL', 5, 1967),
('IDN', 5, 1967), ('ESP', 4, 1993), ('ITA', 4, 1993), ('GBR', 4, 1993),
('PAK', 1, 1947), ('NGA', 6, 2002), ('KEN', 6, 2002), ('COL', 1, 1945),
('VNM', 5, 1995), ('TUR', 2, 1952), ('UKR', 1, 1992), ('ARG', 1, 1945);
GO

