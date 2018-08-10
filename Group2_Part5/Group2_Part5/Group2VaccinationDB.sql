-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: vergil.u.washington.edu:1111
-- Generation Time: Jul 29, 2018 at 11:52 PM
-- Server version: 5.5.18
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Group2VaccinationDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `Address`
--

CREATE TABLE `Address` (
  `Address ID` int(11) NOT NULL,
  `City` varchar(50) NOT NULL,
  `StreetAddress` varchar(50) NOT NULL,
  `Country enum` char(3) NOT NULL,
  `PostalCode` varchar(50) NOT NULL,
  `State enum` char(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Address`
--

INSERT INTO `Address` (`Address ID`, `City`, `StreetAddress`, `Country enum`, `PostalCode`, `State enum`) VALUES
(1, 'Seattle', '11111 111 St. SW', 'USA', '98125', 'WA'),
(2, 'Toronto', '22222 22nd Ave. NE', 'CAN', '11111', NULL),
(3, 'Mexico City', '22222 22nd Ave. NE', 'MEX', '11111', NULL),
(4, 'Longview', '555555 5th Ave. SW', 'USA', '11111', 'WA'),
(5, 'Yakima', '5222 5th Ave. SW', 'USA', '11111', 'WA'),
(6, 'Bellevue', '12345 123rd Ave. SW', 'USA', '11111', 'WA'),
(7, 'Vancouver', '8721 87th Ave. SW', 'USA', '11111', 'WA'),
(8, 'Renton', '321 3rd Ave. SW', 'USA', '11111', 'WA'),
(9, 'Redmond', '54444 54th Ave. SW', 'USA', '11111', 'WA'),
(10, 'Bellingham', '12222 122nd Ave. SW', 'USA', '11111', 'WA');

-- --------------------------------------------------------

--
-- Table structure for table `Allergy`
--

CREATE TABLE `Allergy` (
  `Allergy ID` int(11) NOT NULL,
  `AllergyName` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Allergy`
--

INSERT INTO `Allergy` (`Allergy ID`, `AllergyName`) VALUES
(1, 'Milk'),
(2, 'Eggs'),
(3, 'Fish'),
(4, 'Shrimp'),
(5, 'Wheat'),
(6, 'Peanuts'),
(7, 'Cashews'),
(8, 'Almonds'),
(9, 'Cats'),
(10, 'Pollen');

-- --------------------------------------------------------

--
-- Table structure for table `Country`
--

CREATE TABLE `Country` (
  `Country enum` char(3) NOT NULL,
  `CountryName` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Country`
--

INSERT INTO `Country` (`Country enum`, `CountryName`) VALUES
('USA', 'United States of America'),
('CAN', 'Canada'),
('MEX', 'Mexico');

-- --------------------------------------------------------

--
-- Table structure for table `DisImmu`
--

CREATE TABLE `DisImmu` (
  `DiseaseImmunity ID` int(11) NOT NULL,
  `DiseaseName` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `DisImmu`
--

INSERT INTO `DisImmu` (`DiseaseImmunity ID`, `DiseaseName`) VALUES
(1, 'Measles'),
(2, 'Flu'),
(3, 'HPV'),
(4, 'Mumps'),
(5, 'Hepatitis'),
(6, 'Tuberculosis'),
(7, 'FakeDisease1'),
(8, 'FakeDisease2'),
(9, 'FakeDisease3');

-- --------------------------------------------------------

--
-- Table structure for table `Gender`
--

CREATE TABLE `Gender` (
  `Gender enum` int(11) NOT NULL,
  `GenderFull` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Gender`
--

INSERT INTO `Gender` (`Gender enum`, `GenderFull`) VALUES
(1, 'Male'),
(2, 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `Lot`
--

CREATE TABLE `Lot` (
  `LotNumber` int(11) NOT NULL,
  `Manufacturer ID` int(11) DEFAULT NULL,
  `Vaccine ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Lot`
--

INSERT INTO `Lot` (`LotNumber`, `Manufacturer ID`, `Vaccine ID`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 3),
(4, 5, 1),
(5, 6, 7),
(6, 2, 2),
(7, 9, 2),
(8, 2, 5),
(9, 3, 1),
(10, 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `Manufacturer`
--

CREATE TABLE `Manufacturer` (
  `Manufacturer ID` int(11) NOT NULL,
  `ManufacturerName` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Manufacturer`
--

INSERT INTO `Manufacturer` (`Manufacturer ID`, `ManufacturerName`) VALUES
(1, 'Vaccine Corp'),
(2, 'PharmaC'),
(3, 'MedTech'),
(4, 'VacMan'),
(5, 'Immuno'),
(6, 'DiseaseAway'),
(7, 'Immunity Corp'),
(8, 'The Vaccine Company'),
(9, 'Prevent Illness Foundation'),
(10, 'Pharmacy Company');

-- --------------------------------------------------------

--
-- Table structure for table `MedFacility`
--

CREATE TABLE `MedFacility` (
  `MedFac ID` int(11) NOT NULL,
  `Address ID` int(11) NOT NULL,
  `MedicalFacilityName` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MedFacility`
--

INSERT INTO `MedFacility` (`MedFac ID`, `Address ID`, `MedicalFacilityName`) VALUES
(1, 1, 'MedFac1'),
(2, 1, 'MedFac1'),
(3, 1, 'MedFac1'),
(4, 1, 'MedFac1'),
(5, 1, 'MedFac1'),
(6, 2, 'MedFac2'),
(7, 3, 'MedFac3'),
(8, 4, 'MedFac4'),
(9, 5, 'MedFac5'),
(10, 6, 'MedFac6'),
(11, 7, 'MedFac7'),
(12, 8, 'MedFac8'),
(13, 9, 'MedFac9'),
(14, 10, 'MedFac10');

-- --------------------------------------------------------

--
-- Table structure for table `MedProfession`
--

CREATE TABLE `MedProfession` (
  `MedicalProfession enum` int(11) NOT NULL,
  `MedProfessionName` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `MedProfession`
--

INSERT INTO `MedProfession` (`MedicalProfession enum`, `MedProfessionName`) VALUES
(1, 'Nurse'),
(2, 'Physician'),
(3, 'Pediatrician');

-- --------------------------------------------------------

--
-- Table structure for table `Patient`
--

CREATE TABLE `Patient` (
  `Patient ID` int(11) NOT NULL,
  `Gender enum` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `PrimaryPhoneNumber` varchar(50) NOT NULL,
  `PrimaryEmail` varchar(50) NOT NULL,
  `DateOfBirth` datetime NOT NULL,
  `MiddleName` varchar(50) DEFAULT NULL,
  `Address ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Patient`
--

INSERT INTO `Patient` (`Patient ID`, `Gender enum`, `FirstName`, `LastName`, `PrimaryPhoneNumber`, `PrimaryEmail`, `DateOfBirth`, `MiddleName`, `Address ID`) VALUES
(1, 0, 'Bob', 'Carrey', '206-111-2461', 'Bobc@hotmail.com', '1990-07-15 00:00:00', NULL, 1),
(3, 1, 'Abe', 'Bo', '55555555', 'myemail@email.com', '2018-07-03 00:00:00', NULL, 1),
(4, 1, 'Abel', 'Bob', '5554555', 'myemail2@email.com', '1998-07-03 00:00:00', NULL, 1),
(5, 1, 'Abelina', 'Bobo', '5552555', 'myemail3@email.com', '1997-07-03 00:00:00', NULL, 2),
(6, 1, 'Jake', 'Smith', '55551555', 'myemail5@email.com', '2011-07-03 00:00:00', NULL, 1),
(7, 1, 'John', 'Smithers', '55552555', 'myemail4@email.com', '2010-07-03 00:00:00', NULL, 1),
(8, 1, 'James', 'Smithsonian', '5558555', 'myemail6@email.com', '2015-07-03 00:00:00', NULL, 1),
(9, 1, 'Jon', 'Smith', '5559555', 'myemail7@email.com', '2014-07-03 00:00:00', NULL, 1),
(10, 1, 'Jo', 'Smithy', '5550555', 'myemail8@email.com', '2013-07-03 00:00:00', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `PatientAllergy`
--

CREATE TABLE `PatientAllergy` (
  `PatientAllergy ID` int(11) NOT NULL,
  `Patient ID` int(11) NOT NULL,
  `Allergy ID` int(11) NOT NULL,
  `Severity enum` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `PatientAllergy`
--

INSERT INTO `PatientAllergy` (`PatientAllergy ID`, `Patient ID`, `Allergy ID`, `Severity enum`) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 1),
(5, 5, 2, 1),
(6, 6, 1, 1),
(7, 7, 4, 1),
(8, 8, 3, 1),
(9, 9, 1, 1),
(10, 10, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Severity`
--

CREATE TABLE `Severity` (
  `Severity enum` int(11) NOT NULL,
  `SeverityLevel` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Severity`
--

INSERT INTO `Severity` (`Severity enum`, `SeverityLevel`) VALUES
(1, 'Low'),
(2, 'Medium'),
(3, 'High');

-- --------------------------------------------------------

--
-- Table structure for table `State`
--

CREATE TABLE `State` (
  `State enum` char(2) NOT NULL,
  `StateName` char(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `State`
--

INSERT INTO `State` (`State enum`, `StateName`) VALUES
('WA', 'Washington'),
('OR', 'Oregon'),
('WY', 'Wyoming');

-- --------------------------------------------------------

--
-- Table structure for table `Vaccination`
--

CREATE TABLE `Vaccination` (
  `Vaccination ID` int(11) NOT NULL,
  `Vaccine ID` int(11) NOT NULL,
  `VaccinationDate` datetime NOT NULL,
  `Lot LotNumber` int(11) NOT NULL,
  `Vaccinator ID` int(11) NOT NULL,
  `MedFac ID` int(11) NOT NULL,
  `Patient ID` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Vaccination`
--

INSERT INTO `Vaccination` (`Vaccination ID`, `Vaccine ID`, `VaccinationDate`, `Lot LotNumber`, `Vaccinator ID`, `MedFac ID`, `Patient ID`) VALUES
(1, 1, '2018-07-11 00:00:00', 1, 1, 1, 1),
(2, 2, '2018-07-11 00:00:00', 2, 2, 2, 2),
(3, 2, '2018-07-11 00:00:00', 3, 3, 3, 3),
(4, 2, '2018-07-11 00:00:00', 4, 4, 4, 4),
(5, 2, '2018-07-11 00:00:00', 5, 5, 5, 5),
(6, 2, '2018-07-11 00:00:00', 6, 6, 6, 6),
(7, 2, '2018-07-11 00:00:00', 7, 7, 7, 7),
(8, 2, '2018-07-11 00:00:00', 8, 8, 8, 8),
(9, 2, '2018-07-11 00:00:00', 9, 9, 9, 9),
(10, 2, '2018-07-11 00:00:00', 10, 10, 10, 10);

-- --------------------------------------------------------

--
-- Table structure for table `Vaccinator`
--

CREATE TABLE `Vaccinator` (
  `Vaccinator ID` int(11) NOT NULL,
  `MedProf` int(11) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `FirstName` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Vaccinator`
--

INSERT INTO `Vaccinator` (`Vaccinator ID`, `MedProf`, `LastName`, `FirstName`) VALUES
(1, 1, 'Smith', 'John'),
(2, 2, 'Smithy', 'James'),
(3, 3, 'Smithson', 'Johnny'),
(4, 1, 'Smithsonian', 'Johnathan'),
(5, 2, 'Smithsberg', 'Jon'),
(6, 2, 'Smite', 'Jo'),
(7, 1, 'Smithers', 'Joe'),
(8, 2, 'Smith', 'Jonny'),
(9, 3, 'Small', 'Jane'),
(10, 1, 'Small', 'Joe');

-- --------------------------------------------------------

--
-- Table structure for table `Vaccine`
--

CREATE TABLE `Vaccine` (
  `Vaccine ID` int(11) NOT NULL,
  `VaccineName` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `Vaccine`
--

INSERT INTO `Vaccine` (`Vaccine ID`, `VaccineName`) VALUES
(1, 'Adenovirus Type 4 and Type 7 Vaccine, Live, Oral'),
(2, 'Influenza A (H1N1) 2009 Monovalent Vaccine'),
(3, 'Human Papillomavirus 9-valent Vaccine, Recombinant'),
(4, 'Influenza Vaccine'),
(5, 'Influenza Virus Vaccine\r\n(Trivalent, Types A and B'),
(6, 'Rabies Vaccine'),
(7, 'Yellow Fever Vaccine'),
(8, 'Zoster Vaccine, Live, (Oka/Merck)'),
(9, 'Pneumococcal Vaccine, Polyvalent'),
(10, 'Smallpox (Vaccinia) Vaccine, Live');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Address`
--
ALTER TABLE `Address`
  ADD PRIMARY KEY (`Address ID`),
  ADD KEY `Country_Address_FK1` (`Country enum`),
  ADD KEY `State_Address_FK1` (`State enum`);

--
-- Indexes for table `Allergy`
--
ALTER TABLE `Allergy`
  ADD PRIMARY KEY (`Allergy ID`),
  ADD UNIQUE KEY `Allergy_AK1` (`AllergyName`);

--
-- Indexes for table `DisImmu`
--
ALTER TABLE `DisImmu`
  ADD PRIMARY KEY (`DiseaseImmunity ID`),
  ADD UNIQUE KEY `DisImmu_AK1` (`DiseaseName`);

--
-- Indexes for table `Gender`
--
ALTER TABLE `Gender`
  ADD PRIMARY KEY (`Gender enum`);

--
-- Indexes for table `Lot`
--
ALTER TABLE `Lot`
  ADD PRIMARY KEY (`LotNumber`),
  ADD KEY `Manufacturer_Lot_FK1` (`Manufacturer ID`),
  ADD KEY `Vaccine_Lot_FK1` (`Vaccine ID`);

--
-- Indexes for table `Manufacturer`
--
ALTER TABLE `Manufacturer`
  ADD PRIMARY KEY (`Manufacturer ID`),
  ADD UNIQUE KEY `Manufacturer_AK` (`ManufacturerName`);

--
-- Indexes for table `MedFacility`
--
ALTER TABLE `MedFacility`
  ADD PRIMARY KEY (`MedFac ID`),
  ADD KEY `Address_MedFacility_FK1` (`Address ID`);

--
-- Indexes for table `MedProfession`
--
ALTER TABLE `MedProfession`
  ADD PRIMARY KEY (`MedicalProfession enum`);

--
-- Indexes for table `Patient`
--
ALTER TABLE `Patient`
  ADD PRIMARY KEY (`Patient ID`),
  ADD KEY `Gender_Patient_FK1` (`Gender enum`),
  ADD KEY `Address_Patient_FK1` (`Address ID`);

--
-- Indexes for table `PatientAllergy`
--
ALTER TABLE `PatientAllergy`
  ADD PRIMARY KEY (`PatientAllergy ID`),
  ADD KEY `Patient_PatientAllergy_FK1` (`Patient ID`),
  ADD KEY `Allergy_PatientAllergy_FK1` (`Allergy ID`),
  ADD KEY `Severity_PatientAllergy_FK1` (`Severity enum`);

--
-- Indexes for table `Severity`
--
ALTER TABLE `Severity`
  ADD PRIMARY KEY (`Severity enum`);

--
-- Indexes for table `State`
--
ALTER TABLE `State`
  ADD PRIMARY KEY (`State enum`);

--
-- Indexes for table `Vaccination`
--
ALTER TABLE `Vaccination`
  ADD PRIMARY KEY (`Vaccination ID`),
  ADD KEY `Vaccine_Vaccination_FK1` (`Vaccine ID`),
  ADD KEY `Lot_Vaccination_FK1` (`Lot LotNumber`),
  ADD KEY `Vaccinator_Vaccination_FK1` (`Vaccinator ID`),
  ADD KEY `Patient_Vaccination_FK1` (`Patient ID`),
  ADD KEY `MedFacility_Vaccination_FK1` (`MedFac ID`);

--
-- Indexes for table `Vaccinator`
--
ALTER TABLE `Vaccinator`
  ADD PRIMARY KEY (`Vaccinator ID`),
  ADD KEY `MedProfession_Vaccinator_FK1` (`MedProf`);

--
-- Indexes for table `Vaccine`
--
ALTER TABLE `Vaccine`
  ADD PRIMARY KEY (`Vaccine ID`),
  ADD UNIQUE KEY `Vaccine_AK1` (`VaccineName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Address`
--
ALTER TABLE `Address`
  MODIFY `Address ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Allergy`
--
ALTER TABLE `Allergy`
  MODIFY `Allergy ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `DisImmu`
--
ALTER TABLE `DisImmu`
  MODIFY `DiseaseImmunity ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `Gender`
--
ALTER TABLE `Gender`
  MODIFY `Gender enum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Lot`
--
ALTER TABLE `Lot`
  MODIFY `LotNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Manufacturer`
--
ALTER TABLE `Manufacturer`
  MODIFY `Manufacturer ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `MedFacility`
--
ALTER TABLE `MedFacility`
  MODIFY `MedFac ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `MedProfession`
--
ALTER TABLE `MedProfession`
  MODIFY `MedicalProfession enum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Patient`
--
ALTER TABLE `Patient`
  MODIFY `Patient ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `PatientAllergy`
--
ALTER TABLE `PatientAllergy`
  MODIFY `PatientAllergy ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Severity`
--
ALTER TABLE `Severity`
  MODIFY `Severity enum` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `Vaccination`
--
ALTER TABLE `Vaccination`
  MODIFY `Vaccination ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Vaccinator`
--
ALTER TABLE `Vaccinator`
  MODIFY `Vaccinator ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `Vaccine`
--
ALTER TABLE `Vaccine`
  MODIFY `Vaccine ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
