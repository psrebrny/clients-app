-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 18 Lut 2015, 14:10
-- Wersja serwera: 5.6.20
-- Wersja PHP: 5.5.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Baza danych: `angular-crm`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
`id` int(11) NOT NULL,
  `company_name` varchar(100) COLLATE utf8_polish_ci NOT NULL,
  `contact_name` varchar(50) COLLATE utf8_polish_ci NOT NULL,
  `contact_phone` varchar(15) COLLATE utf8_polish_ci NOT NULL,
  `contact_email` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `account_manager_id` int(11) NOT NULL,
  `notes` varchar(500) COLLATE utf8_polish_ci DEFAULT NULL,
  `sector_id` int(11) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=16 ;

--
-- Zrzut danych tabeli `clients`
--

INSERT INTO `clients` (`id`, `company_name`, `contact_name`, `contact_phone`, `contact_email`, `account_manager_id`, `notes`, `sector_id`) VALUES
(1, 'Lorem ipsum dolor', 'Michalina Kwiatkowska', '53 790 92 21', 'MichalinaKwiatkowska@dayrep.com', 1, 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 5),
(2, 'Aenean massa', 'Kazimierz Wiśniewski', '88 434 60 33', 'KazimierzWiniewski@dayrep.com', 2, NULL, 4),
(3, 'Nullam dictum', 'Miłosław Duda', '67 431 58 98', 'MiosawDuda@dayrep.com', 3, 'Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', 3),
(4, 'Aliquam lorem ante', 'Konstancja Gorska', '78 931 86 71', 'KonstancjaGorska@dayrep.com', 4, 'In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus.', 2),
(5, 'Maecenas tempus', 'Józef Woźniak', '79 319 44 99', 'JzefWoniak@teleworm.us', 5, NULL, 1),
(6, 'Donec sodales sagittis', 'Janek Czerwinski', '66 796 79 49', 'JanekCzerwinski@jourrapide.com', 1, 'Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu.', 1),
(7, 'Vestibulum purus', 'Hanna Kozłowska', '53 858 22 59', 'HannaKozowska@jourrapide.com', 2, NULL, 2),
(8, 'Etiam sit', 'Walery Czarnecki', '67 677 77 97', 'WaleryCzarnecki@jourrapide.com', 3, 'Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus.', 3),
(9, 'Cras id dui', 'Wacław Grabowski', '78 772 75 31', 'WacawGrabowski@rhyta.com', 4, 'Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui.', 4),
(10, 'Duis arcu tortor', 'Augustyna Sokołowska', '69 268 36 68', 'AugustynaSokoowska@armyspy.com', 5, NULL, 5),
(11, 'Phasellus accumsan', 'Jarek Kucharski', '78 357 89 49', 'JarekKucharski@armyspy.com', 1, 'Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero.', 5),
(12, 'Pellentesque posuere', 'Felicja Olszewska', '88 706 67 24', 'FelicjaOlszewska@jourrapide.com', 2, NULL, 3),
(13, 'Aenean viverra', 'Berta Ostrowska', '53 218 38 56', 'BertaOstrowska@teleworm.us', 3, NULL, 1),
(14, 'Phasellus gravida', 'Augustyn Nowicki', '79 435 93 31', 'AugustynNowicki@armyspy.com', 4, NULL, 2),
(15, 'Phasellus volutpat', 'Urszula Kucharska', '79 532 30 44', 'UrszulaKucharska@jourrapide.com', 5, 'Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante.', 4);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `company_sectors`
--

CREATE TABLE IF NOT EXISTS `company_sectors` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=6 ;

--
-- Zrzut danych tabeli `company_sectors`
--

INSERT INTO `company_sectors` (`id`, `name`) VALUES
(1, 'Sklep internetowy'),
(2, 'Wydawnictwo'),
(3, 'Producent odzieży'),
(4, 'Producent suplementów'),
(5, 'Agencja reklamowa');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `contact_timeline`
--

CREATE TABLE IF NOT EXISTS `contact_timeline` (
`id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `contact_date` datetime NOT NULL,
  `contact_type` varchar(15) COLLATE utf8_polish_ci NOT NULL,
  `notes` varchar(500) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=6 ;

--
-- Zrzut danych tabeli `contact_timeline`
--

INSERT INTO `contact_timeline` (`id`, `client_id`, `user_id`, `contact_date`, `contact_type`, `notes`) VALUES
(1, 1, 1, '2015-01-12 12:00:00', 'phone', 'Lorem ipsum dolor sit amet enim. Etiam ullamcorper. Suspendisse a pellentesque dui, non felis. Maecenas malesuada elit lectus felis, malesuada ultricies. Curabitur et ligula.'),
(2, 1, 2, '2015-01-14 18:30:00', 'envelope-o', 'Ut molestie a, ultricies porta urna. Vestibulum commodo volutpat a, convallis ac.'),
(3, 1, 3, '2015-01-16 13:15:00', 'phone', 'Phasellus fermentum in, dolor. Pellentesque facilisis. Nulla imperdiet sit amet magna. Vestibulum dapibus, mauris nec malesuada fames ac turpis velit, rhoncus eu.'),
(4, 1, 2, '2015-01-16 15:00:00', 'users', 'Quisque lorem tortor fringilla sed, vestibulum id, eleifend justo vel bibendum sapien massa ac turpis faucibus orci luctus non, consectetuer lobortis quis, varius in, purus.'),
(5, 1, 1, '2015-01-20 12:00:00', 'file-text-o', 'Cum sociis natoque penatibus et ultrices volutpat. Nullam wisi ultricies.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci AUTO_INCREMENT=6 ;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `name`) VALUES
(1, 'Konstantyn Kowalski'),
(2, 'Łukasz Pawłowski'),
(3, 'Zofia Jabłońska'),
(4, 'Izydor Pawłowski'),
(5, 'Sylwester Kozłowski');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
 ADD PRIMARY KEY (`id`), ADD KEY `account_manager_id` (`account_manager_id`,`sector_id`), ADD KEY `sector_id` (`sector_id`);

--
-- Indexes for table `company_sectors`
--
ALTER TABLE `company_sectors`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_timeline`
--
ALTER TABLE `contact_timeline`
 ADD PRIMARY KEY (`id`), ADD KEY `client_id` (`client_id`,`user_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `clients`
--
ALTER TABLE `clients`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT dla tabeli `company_sectors`
--
ALTER TABLE `company_sectors`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT dla tabeli `contact_timeline`
--
ALTER TABLE `contact_timeline`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `clients`
--
ALTER TABLE `clients`
ADD CONSTRAINT `clients_ibfk_1` FOREIGN KEY (`account_manager_id`) REFERENCES `users` (`id`),
ADD CONSTRAINT `clients_ibfk_2` FOREIGN KEY (`sector_id`) REFERENCES `company_sectors` (`id`);

--
-- Ograniczenia dla tabeli `contact_timeline`
--
ALTER TABLE `contact_timeline`
ADD CONSTRAINT `contact_timeline_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `contact_timeline_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
