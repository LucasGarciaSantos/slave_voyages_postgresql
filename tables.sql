--Voyage groupings for estimating imputed slaves
--Format: F3
BEGIN;
CREATE TABLE voyage_groupings_xmimpflag(
    xmimpflag int GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    label VARCHAR
);

INSERT INTO voyage_groupings_xmimpflag(xmimpflag, label) VALUES
(1, 'Spanish, pre-1626'),
(2, 'Spanish, 1626-41'),
(3, 'French, pre-1716'),
(4, 'Pernambuco, pre-1701'),
(5, 'Pernambuco, 1701-1800'),
(6, 'Pernambuco, post-1800'),
(7, 'Dutch, pre-1650'),
(8, 'Dutch, 1650-73'),
(9, 'Dutch, 1674-1730'),
(10, 'Dutch, post-1730'),
(11, 'Bahia, pre-1751'),
(14, 'Bahia, 1801-25'),
(15, 'Bahia, post-1825'),
(16, 'Spanish, 1642-62'),
(17, 'Brig, pre-1751'),
(18, 'Brig, 1776-1800'),
(19, 'Brig, 1801-25'),
(20, 'Brig, 1826-50'),
(21, 'Brig, post-1850'),
(22, 'Schooner, pre-1776'),
(23, 'Schooner, 1776-1800'),
(24, 'Schooner, 1801-25'),
(25, 'Schooner, 1826-50'),
(26, 'Schooner, 1851-66'),
(27, 'Curveta, pre-1751'),
(28, 'Curveta, 1751-75'),
(29, 'Curveta, 1776-1800'),
(30, 'Curveta, post-1800'),
(31, 'Ship, pre-1726'),
(32, 'Ship, 1726-50'),
(33, 'Ship, 1751-75'),
(34, 'Ship, 1776-1800'),
(35, 'Ship, 1801-25'),
(36, 'Ship, 1826-1850'),
(37, 'Ship, post-1850'),
(38, 'Schooner-brig'),
(39, 'Smack'),
(40, 'Patacho'),
(41, 'Brigantine, pre-1776'),
(42, 'Brigantine, 1776-1800'),
(43, 'Brigantine, 1801-25'),
(44, 'Brigantine, 1825-50'),
(45, 'Brigantine, post-1850'),
(46, 'Barque, pre-1826 '),
(47, 'Barque, 1826-50'),
(48, 'Barque, 1851-75'),
(49, 'Polacca'),
(50, 'Pilot'),
(51, 'Sumaca, pre-1751'),
(52, 'Sumaca, 1751-76'),
(53, 'Sumaca, 1776-1800'),
(54, 'Sumaca, 1800-25'),
(55, 'Sumaca, 1826-66'),
(56, 'Felucca'),
(57, 'Barqua'),
(58, 'Navio Mercante'),
(59, 'Chalupa'),
(60, 'Galera, pre-1751'),
(61, 'Galera,1751-76'),
(62, 'Galera, 1776-1800'),
(63, 'Galera, 1801-25'),
(64, 'Galera, post-1850'),
(65, 'Sloop, pre-1751'),
(66, 'Sloop, 1751-76'),
(67, 'Sloop, 1776-1800'),
(68, 'Sloop, post-1800'),
(69, 'Steamer'),
(70, 'Fregata, pre-1726'),
(71, 'Fregata, 1726-75'),
(73, 'Fluit'),
(74, 'Snow, pre-1726'),
(75, 'Snow, 1726-50'),
(76, 'Snow, 1751-75'),
(77, 'Snow, 1776-1800'),
(78, 'Snow, post-1800'),
(79, 'Bergantine, pre-1776'),
(80, 'Bergantine, 1776-1800 '),
(81, 'Bergantine, 1801-25'),
(82, 'Bergantine, 1826-75'),
(83, 'Penque'),
(84, 'Charrua'),
(85, 'Fregata, post-1800'),
(86, 'Balandra'),
(87, 'Paquete'),
(88, 'Iate, pre-1826'),
(89, 'Iate, post-1825'),
(90, 'Galeta, pre-1826'),
(91, 'Galeta, 1826-50'),
(92, 'Galeta, 1851-75'),
(93, 'Small craft'),
(94, 'Buque, pre-1726'),
(95, 'Buque, 1726-1825'),
(97, 'Fregata, 1776-1800'),
(98, 'Brig, 1751-75'),
(99, 'North America, pre-1851'),
(101, 'Senegambia, pre-1701'),
(102, 'Senegambia, 1701-1800'),
(103, 'Senegambia, post-1800'),
(104, 'Sierra Leone, pre-1701'),
(105, 'Sierra Leone, 1701-1800'),
(106, 'Sierra Leone, post-1800'),
(107, 'Gold Coast, pre-1701'),
(108, 'Gold Coast, post-1700'),
(110, 'B. of Benin, pre-1700'),
(111, 'B. of Benin, 1700-1800'),
(112, 'B. of Benin, post-1800'),
(113, 'B. of Biafra, pre-1700'),
(114, 'B. of Biafra, 1700-1800'),
(115, 'B. of Biafra, post-1800'),
(116, 'W C Africa, pre-1701');
COMMIT;