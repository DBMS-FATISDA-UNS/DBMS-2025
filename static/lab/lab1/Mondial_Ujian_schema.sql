-- Buat database
IF DB_ID('mondial_ujian') IS NULL
    CREATE DATABASE mondial_ujian;
GO

USE mondial_ujian;
GO

-- Tabel: continents
CREATE TABLE continents (
    continent_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(50) NOT NULL
);
GO

-- Tabel: countries
CREATE TABLE countries (
    country_code CHAR(3) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL,
    population INT,
    area FLOAT,
);
GO

-- Tabel: cities
CREATE TABLE cities (
    city_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL,
    population INT,
    country_code CHAR(3),
    FOREIGN KEY (country_code) REFERENCES countries(country_code)
);
GO

-- Tabel: country_continent (many-to-many)
CREATE TABLE country_continent (
    country_code CHAR(3),
    continent_id INT,
    PRIMARY KEY (country_code, continent_id),
    FOREIGN KEY (country_code) REFERENCES countries(country_code),
    FOREIGN KEY (continent_id) REFERENCES continents(continent_id)
);
GO

-- Tabel: languages
CREATE TABLE languages (
    language_code CHAR(3) PRIMARY KEY,
    name NVARCHAR(100) NOT NULL
);
GO

-- Tabel: country_language
CREATE TABLE country_language (
    country_code CHAR(3),
    language_code CHAR(3),
    is_official BIT,
    percentage FLOAT,
    PRIMARY KEY (country_code, language_code),
    FOREIGN KEY (country_code) REFERENCES countries(country_code),
    FOREIGN KEY (language_code) REFERENCES languages(language_code)
);
GO

-- Tabel: religions
CREATE TABLE religions (
    religion_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL
);
GO

-- Tabel: country_religion
CREATE TABLE country_religion (
    country_code CHAR(3),
    religion_id INT,
    percentage FLOAT,
    PRIMARY KEY (country_code, religion_id),
    FOREIGN KEY (country_code) REFERENCES countries(country_code),
    FOREIGN KEY (religion_id) REFERENCES religions(religion_id)
);
GO

-- Tabel: organizations
CREATE TABLE organizations (
    org_id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(100) NOT NULL,
    headquarters NVARCHAR(100),
    established_year INT
);
GO

-- Tabel: country_organization
CREATE TABLE country_organization (
    country_code CHAR(3),
    org_id INT,
    membership_year INT,
    PRIMARY KEY (country_code, org_id),
    FOREIGN KEY (country_code) REFERENCES countries(country_code),
    FOREIGN KEY (org_id) REFERENCES organizations(org_id)
);
GO

SELECT * FROM continents
