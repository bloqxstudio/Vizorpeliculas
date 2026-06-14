-- =====================================================================
-- Seed do Catálogo Vizor 2026 — FONTE DA VERDADE: CATÁLOGO VIZOR 2026_RL.pdf
-- =====================================================================
-- Regras:
--   * 1 linha por moto (modelo + ano), exatamente como no PDF.
--   * O CÓDIGO identifica a PELÍCULA, não a moto -> o mesmo código se
--     repete em motos compatíveis (ex.: BMW VZB0008, Dafra VZF0007).
--   * Formato oficial: VZB#### / VZF#### (4 dígitos, zero à esquerda).
--   * code_b e code_f têm sempre o MESMO número (só muda B=brilho/F=fosco).
--   * num = identificador único da LINHA (usado na URL /produto/{num}).
--
-- Como rodar: cole no SQL Editor do Supabase (projeto Vizor) e execute.
-- =====================================================================

-- 1) Schema: garante as colunas de código (texto, NÃO únicas)
ALTER TABLE products ADD COLUMN IF NOT EXISTS code_b text;
ALTER TABLE products ADD COLUMN IF NOT EXISTS code_f text;

-- 1b) Imagens passam a ser opcionais (serão remapeadas/buscadas depois).
--     Sem isso o INSERT abaixo falha por NOT NULL em folder/file.
ALTER TABLE products ALTER COLUMN folder DROP NOT NULL;
ALTER TABLE products ALTER COLUMN file DROP NOT NULL;
ALTER TABLE products ALTER COLUMN image_url DROP NOT NULL;

-- 2) Preserva as imagens já cadastradas (folder/file/image_url) por num,
--    pois o passo seguinte recria as linhas a partir do PDF.
CREATE TEMP TABLE _img_backup AS
  SELECT num, folder, file, image_url FROM products;

-- 3) Reconstrói o conteúdo a partir do PDF (fonte da verdade)
TRUNCATE TABLE products RESTART IDENTITY;

-- 4) Insere o catálogo. code_f é derivado de code_b trocando VZB->VZF.
INSERT INTO products (num, brand, model, year, code_b, code_f) VALUES
-- ---------------- BAJAJ ----------------
(1,  'Bajaj', 'Dominar 400', '2023–2025', 'VZB0001', 'VZF0001'),
(2,  'Bajaj', 'Dominar NS160', '2025', 'VZB0003', 'VZF0003'),
(3,  'Bajaj', 'Dominar 200', '2023–2025', 'VZB0002', 'VZF0002'),
(4,  'Bajaj', 'Dominar 160', '2023–2025', 'VZB0002', 'VZF0002'),
(5,  'Bajaj', 'Dominar NS200', '2025', 'VZB0003', 'VZF0003'),
(6,  'Bajaj', 'Dominar 250', '2025', 'VZB0001', 'VZF0001'),
(7,  'Bajaj', 'Pulsar N150', '2025', 'VZB0004', 'VZF0004'),
-- ---------------- DAFRA ----------------
(8,  'Dafra', 'Cruisym 150', '2022–2025', 'VZB0006', 'VZF0006'),
(9,  'Dafra', 'NH 190', '2025', 'VZB0007', 'VZF0007'),
(10, 'Dafra', 'NH 300', 'Todos modelos', 'VZB0007', 'VZF0007'),
(11, 'Dafra', 'NHX 190', '2025', 'VZB0007', 'VZF0007'),
-- ---------------- BMW ----------------
(12, 'BMW', 'R1250 GS / GS Adventure', '2019–2025', 'VZB0008', 'VZF0008'),
(13, 'BMW', 'R1200 GS / GS Adventure', '2012–2018', 'VZB0010', 'VZF0010'),
(14, 'BMW', 'F850 GS / GS Adventure', '2019–2025', 'VZB0008', 'VZF0008'),
(15, 'BMW', 'R1200 GS / GS Adventure', '2018–2025', 'VZB0008', 'VZF0008'),
(16, 'BMW', 'R1300 GS / GS Adventure', '2024+', 'VZB0008', 'VZF0008'),
(17, 'BMW', 'F750 GS Premium', '2018–2019', 'VZB0008', 'VZF0008'),
(18, 'BMW', 'F900 R', '2019–2025', 'VZB0008', 'VZF0008'),
(19, 'BMW', 'C400X', 'Todos modelos', 'VZB0008', 'VZF0008'),
(20, 'BMW', 'S1000 RR', '2019–2025', 'VZB0008', 'VZF0008'),
(21, 'BMW', 'F800 GS', 'Todos modelos', 'VZB0008', 'VZF0008'),
(22, 'BMW', 'G310 GS', '2017–2024', 'VZB0009', 'VZF0009'),
(23, 'BMW', 'R1250 RT', '2024+', 'VZB0011', 'VZF0011'),
(24, 'BMW', 'F900 GS', '2024+', 'VZB0008', 'VZF0008'),
(25, 'BMW', 'G650 GS / G650 GS Sertão', '2012–2016', 'VZB0012', 'VZF0012'),
(26, 'BMW', 'G310 R', '2018–2024+', 'VZB0009', 'VZF0009'),
(27, 'BMW', 'R1200 Nine T', '2014–2015', 'VZB0014', 'VZF0014'),
(28, 'BMW', 'F750 GS', '2019–2022', 'VZB0013', 'VZF0013'),
(29, 'BMW', 'F900 XR', '2024+', 'VZB0008', 'VZF0008'),
-- ---------------- DUCATI ----------------
(30, 'Ducati', 'Multistrada V4S', '2021+', 'VZB0015', 'VZF0015'),
(31, 'Ducati', 'Scrambler', '2016–2024', 'VZB0018', 'VZF0018'),
(32, 'Ducati', 'Multistrada 1260 / 1260 S', '2018–2023', 'VZB0016', 'VZF0016'),
(33, 'Ducati', 'Desert X', '2020+', 'VZB0019', 'VZF0019'),
(34, 'Ducati', 'Panigale V4 R / V4 S / Diavel', '2021+', 'VZB0017', 'VZF0017'),
(35, 'Ducati', 'Streetfighter V4 S', '2021+', 'VZB0017', 'VZF0017'),
-- ---------------- CFMOTO ----------------
(36, 'CFMoto', 'IBEX 450', '2026+', 'VZB0131', 'VZF0131'),
(37, 'CFMoto', 'IBEX 700', '2026+', 'VZB0131', 'VZF0131'),
-- ---------------- HAOJUE ----------------
(38, 'Haojue', 'DL 160', '2025+', 'VZB0020', 'VZF0020'),
(39, 'Haojue', 'DK160', '2023–2025', 'VZB0022', 'VZF0022'),
(40, 'Haojue', 'DR160', '2020–2023', 'VZB0021', 'VZF0021'),
(41, 'Haojue', 'DK150', '2018–2025', 'VZB0022', 'VZF0022'),
-- ---------------- HARLEY DAVIDSON ----------------
(42, 'Harley Davidson', 'Sportster S', '2021–2025', 'VZB0024', 'VZF0024'),
(43, 'Harley Davidson', 'Pan America 1250', '2022–2025', 'VZB0026', 'VZF0026'),
(44, 'Harley Davidson', 'Sportster XL 1200', '2008–2020', 'VZB0025', 'VZF0025'),
(45, 'Harley Davidson', 'Sportster XL 883', '2008–2020', 'VZB0025', 'VZF0025'),
-- ---------------- VOLTZ ----------------
(46, 'Voltz', 'EVS', '2021–2023', 'VZB0028', 'VZF0028'),
(47, 'Voltz', 'EV1 Sport', '2021–2023', 'VZB0023', 'VZF0023'),
-- ---------------- HONDA ----------------
(48, 'Honda', 'CB 300F Twister', '2023+', 'VZB0029', 'VZF0029'),
(49, 'Honda', 'PCX 160', '2023–2025', 'VZB0032', 'VZF0032'),
(50, 'Honda', 'XRE 300 Sahara', '2023+', 'VZB0029', 'VZF0029'),
(51, 'Honda', 'CB500X', '2020–2024', 'VZB0033', 'VZF0033'),
(52, 'Honda', 'Biz 125', '2025+', 'VZB0030', 'VZF0030'),
(53, 'Honda', 'NC750X', '2022–2025', 'VZB0034', 'VZF0034'),
(54, 'Honda', 'ADV 160', '2025+', 'VZB0031', 'VZF0031'),
(55, 'Honda', 'CB Twister 250', '2016–2022', 'VZB0035', 'VZF0035'),
(56, 'Honda', 'XRE 190', '2025+', 'VZB0030', 'VZF0030'),
(57, 'Honda', 'NXR 160 Bros', '2025', 'VZB0030', 'VZF0030'),
(58, 'Honda', 'XR 300L / Tornado 300', '2025+', 'VZB0030', 'VZF0030'),
(59, 'Honda', 'CRF1100L Africa Twin', '2021–2024', 'VZB0036', 'VZF0036'),
(60, 'Honda', 'CG160 Titan / Fan / Start / Cargo', '2025+', 'VZB0030', 'VZF0030'),
(61, 'Honda', 'CB650R', '2020–2024', 'VZB0033', 'VZF0033'),
(62, 'Honda', 'CB1000R', '2023', 'VZB0037', 'VZF0037'),
(63, 'Honda', 'NXR 160 Bros', '2016–2018', 'VZB0043', 'VZF0043'),
(64, 'Honda', 'CB500F', '2020–2024', 'VZB0033', 'VZF0033'),
(65, 'Honda', 'SH 150i', '2017–2024', 'VZB0044', 'VZF0044'),
(66, 'Honda', 'ADV 150', '2024+', 'VZB0038', 'VZF0038'),
(67, 'Honda', 'CG 160 Titan / Fan', '2016–2021', 'VZB0045', 'VZF0045'),
(68, 'Honda', 'XRE 300', '2018–2023', 'VZB0039', 'VZF0039'),
(69, 'Honda', 'XRE 190', '2016–2024', 'VZB0046', 'VZF0046'),
(70, 'Honda', 'CG 160 Titan', '2022–2023', 'VZB0040', 'VZF0040'),
(71, 'Honda', 'BIZ 110i', '2018–2023', 'VZB0047', 'VZF0047'),
(72, 'Honda', 'BIZ 125', '2018–2023', 'VZB0041', 'VZF0041'),
(73, 'Honda', 'NX 500', '2025', 'VZB0048', 'VZF0048'),
(74, 'Honda', 'NC750X', '2016–2021', 'VZB0042', 'VZF0042'),
(75, 'Honda', 'POP 110i', '2016–2025', 'VZB0049', 'VZF0049'),
(76, 'Honda', 'CBR650 R', '2020–2024', 'VZB0033', 'VZF0033'),
(77, 'Honda', 'CG 160 Start', '2021–2025', 'VZB0054', 'VZF0054'),
(78, 'Honda', 'CB500X', '2025', 'VZB0050', 'VZF0050'),
(79, 'Honda', 'CRF1000L Africa Twin', '2017–2019', 'VZB0055', 'VZF0055'),
(80, 'Honda', 'Nova Elite', '2025', 'VZB0051', 'VZF0051'),
(81, 'Honda', 'X-ADV 750', '2024+', 'VZB0037', 'VZF0037'),
(82, 'Honda', 'PCX 150', '2019–2022', 'VZB0052', 'VZF0052'),
(83, 'Honda', 'Transalp 750', '2025', 'VZB0048', 'VZF0048'),
(84, 'Honda', 'Elite', '2018–2024', 'VZB0053', 'VZF0053'),
(85, 'Honda', 'CRF1000L Africa Twin', '2020', 'VZB0057', 'VZF0057'),
(86, 'Honda', 'CB500F', '2014–2019', 'VZB0050', 'VZF0050'),
(87, 'Honda', 'Hornet 500', '2025', 'VZB0048', 'VZF0048'),
(88, 'Honda', 'CBR1000RR', '2017–2020', 'VZB0058', 'VZF0058'),
-- ---------------- KAWASAKI ----------------
(89,  'Kawasaki', 'Z900', '2026', 'VZB0059', 'VZF0059'),
(90,  'Kawasaki', 'Eliminator 500', '2025', 'VZB0064', 'VZF0064'),
(91,  'Kawasaki', 'Versys 650', '2026', 'VZB0060', 'VZF0060'),
(92,  'Kawasaki', 'Z900RS', '2019–2025', 'VZB0062', 'VZF0062'),
(93,  'Kawasaki', 'Z900', '2020–2024', 'VZB0060', 'VZF0060'),
(94,  'Kawasaki', 'Vulcan S', '2015–2023', 'VZB0065', 'VZF0065'),
(95,  'Kawasaki', 'Versys-X 300', '2017–2025', 'VZB0061', 'VZF0061'),
(96,  'Kawasaki', 'Ninja ZX-10R', '2020–2025', 'VZB0060', 'VZF0060'),
(97,  'Kawasaki', 'Z650RS', '2020–2025', 'VZB0062', 'VZF0062'),
(98,  'Kawasaki', 'Z400', '2020–2025', 'VZB0066', 'VZF0066'),
(99,  'Kawasaki', 'Z650', '2020–2025', 'VZB0060', 'VZF0060'),
(100, 'Kawasaki', 'Z500 SE', '2025', 'VZB0060', 'VZF0060'),
(101, 'Kawasaki', 'Versys 1000', '2019+', 'VZB0063', 'VZF0063'),
(102, 'Kawasaki', 'Ninja ZX-6R', '2018–2020', 'VZB0061', 'VZF0061'),
(103, 'Kawasaki', 'Ninja 400', '2019–2023', 'VZB0061', 'VZF0061'),
(104, 'Kawasaki', 'Z500', '2025', 'VZB0069', 'VZF0069'),
(105, 'Kawasaki', 'Z H2', '2025', 'VZB0060', 'VZF0060'),
(106, 'Kawasaki', 'Ninja 500', '2025', 'VZB0069', 'VZF0069'),
(107, 'Kawasaki', 'Ninja 650', '2020–2025', 'VZB0060', 'VZF0060'),
(108, 'Kawasaki', 'Ninja 300', '2013–2025', 'VZB0070', 'VZF0070'),
(109, 'Kawasaki', 'Z1000', '2014–2017', 'VZB0067', 'VZF0067'),
(110, 'Kawasaki', 'Ninja ZX-4R', '2024–2025', 'VZB0060', 'VZF0060'),
(111, 'Kawasaki', 'Z900', '2017–2019', 'VZB0068', 'VZF0068'),
(112, 'Kawasaki', 'Ninja 650', '2018–2020', 'VZB0061', 'VZF0061'),
(113, 'Kawasaki', 'Z650', '2018–2020', 'VZB0068', 'VZF0068'),
(114, 'Kawasaki', 'Z800', '2013–2017', 'VZB0071', 'VZF0071'),
(115, 'Kawasaki', 'Ninja ZX-4RR', '2026', 'VZB0060', 'VZF0060'),
(116, 'Kawasaki', 'Z1100', '2026', 'VZB0059', 'VZF0059'),
-- ---------------- KTM ----------------
(117, 'KTM', 'Duke 390', '2018–2023', 'VZB0072', 'VZF0072'),
(118, 'KTM', 'Super Adventure 1290', '2017–2019', 'VZB0074', 'VZF0074'),
(119, 'KTM', '990 Adventure / 990R', '2009–2011', 'VZB0073', 'VZF0073'),
(120, 'KTM', '1190 Adventure / 1190R', '2014–2016', 'VZB0075', 'VZF0075'),
(121, 'KTM', '890 Adventure / 890R', '2021–2023', 'VZB0072', 'VZF0072'),
-- ---------------- ZONTES ----------------
(122, 'Zontes', 'T350 / T350X / R350 / V350 / S350 / GK350', '2018+', 'VZB0122', 'VZF0122'),
(123, 'Zontes', 'Max Scooter 350E', '2024+', 'VZB0123', 'VZF0123'),
(124, 'Zontes', '310T / 310R', '2022–2025', 'VZB0122', 'VZF0122'),
-- ---------------- ROYAL ENFIELD ----------------
(125, 'Royal Enfield', 'Nova Himalayan 450', '2025', 'VZB0076', 'VZF0076'),
(126, 'Royal Enfield', 'Himalayan 400 / Sleet', '2018–2021', 'VZB0076', 'VZF0076'),
(127, 'Royal Enfield', 'Meteor 350 / Scram 411', '2021–2025', 'VZB0077', 'VZF0077'),
(128, 'Royal Enfield', 'Guerrilla 450', '2025+', 'VZB0076', 'VZF0076'),
(129, 'Royal Enfield', 'Hunter 350', '2022–2025', 'VZB0077', 'VZF0077'),
(130, 'Royal Enfield', 'Continental GT 650', '2019–2023', 'VZB0078', 'VZF0078'),
(131, 'Royal Enfield', 'Super Meteor 650', '2024+', 'VZB0077', 'VZF0077'),
(132, 'Royal Enfield', 'Bear 650', '2024+', 'VZB0076', 'VZF0076'),
(133, 'Royal Enfield', 'Shotgun 650', '2025+', 'VZB0077', 'VZF0077'),
(134, 'Royal Enfield', 'Interceptor 650', '2019–2023', 'VZB0078', 'VZF0078'),
(135, 'Royal Enfield', 'Himalayan 400', '2022–2023', 'VZB0079', 'VZF0079'),
-- ---------------- SUZUKI ----------------
(136, 'Suzuki', 'V-Strom 650 / 650XT / 650XT Adv', '2017–2025', 'VZB0126', 'VZF0126'),
(137, 'Suzuki', 'V-Strom 1050 / 1050 XT', '2024+', 'VZB0127', 'VZF0127'),
(138, 'Suzuki', 'V-Strom 800', '2024+', 'VZB0127', 'VZF0127'),
(139, 'Suzuki', 'GSX-S 1000 / 1000A', '2021–2023', 'VZB0126', 'VZF0126'),
(140, 'Suzuki', 'GSX-8S', '2025+', 'VZB0127', 'VZF0127'),
(141, 'Suzuki', 'GSX-S 1000', '2025', 'VZB0127', 'VZF0127'),
(142, 'Suzuki', 'V-Strom 1050 XT', '2021–2024', 'VZB0129', 'VZF0129'),
(143, 'Suzuki', 'GSX-S 1000 / 1000F', '2016–2020', 'VZB0128', 'VZF0128'),
(144, 'Suzuki', 'V-Strom 1000 / 1000XT', '2015–2021', 'VZB0126', 'VZF0126'),
(145, 'Suzuki', 'GSX-S 1000 GT', '2024–2025', 'VZB0114', 'VZF0114'),
(146, 'Suzuki', 'GSX-S 750', '2018–2025', 'VZB0128', 'VZF0128'),
(147, 'Suzuki', 'GSX-R 1000 / 1000R', '2017–2023', 'VZB0130', 'VZF0130'),
-- ---------------- TRIUMPH ----------------
(148, 'Triumph', 'Tiger 900', '2024–2025', 'VZB0082', 'VZF0082'),
(149, 'Triumph', 'Trident 660', '2021–2023', 'VZB0125', 'VZF0125'),
(150, 'Triumph', 'Tiger 1200', '2024–2025', 'VZB0082', 'VZF0082'),
(151, 'Triumph', 'Tiger Sport 660', '2023–2025', 'VZB0124', 'VZF0124'),
(152, 'Triumph', 'Tiger 900 (7.0 Pol.)', '2022–2023', 'VZB0083', 'VZF0083'),
(153, 'Triumph', 'Scrambler 1200X', '2023+', 'VZB0125', 'VZF0125'),
(154, 'Triumph', 'Scrambler 400 X', '2024–2025', 'VZB0084', 'VZF0084'),
(155, 'Triumph', 'Tiger 1200', '2018–2023', 'VZB0085', 'VZF0085'),
(156, 'Triumph', 'Speed', '2024–2025', 'VZB0084', 'VZF0084'),
(157, 'Triumph', 'Speed Twin 900', '2013–2017', 'VZB0086', 'VZF0086'),
(158, 'Triumph', 'Tiger 800', '2018–2020', 'VZB0085', 'VZF0085'),
(159, 'Triumph', 'Speed Triple 1050 / 1050R', '2022–2023', 'VZB0087', 'VZF0087'),
(160, 'Triumph', 'Street Triple 765', '2017–2023', 'VZB0085', 'VZF0085'),
(161, 'Triumph', 'Tiger 1050 Sport', '2014–2018', 'VZB0087', 'VZF0087'),
(162, 'Triumph', 'Street Triple 675 / 675R', '2013–2017', 'VZB0087', 'VZF0087'),
(163, 'Triumph', 'Street Scrambler', '2017–2023', 'VZB0086', 'VZF0086'),
(164, 'Triumph', 'Bonneville Bobber', '2017–2023', 'VZB0086', 'VZF0086'),
(165, 'Triumph', 'Daytona 675i / 675R', '2012–2016', 'VZB0087', 'VZF0087'),
-- ---------------- SHINERAY ----------------
(166, 'Shineray', 'Urban 150', '2025', 'VZB0115', 'VZF0115'),
(167, 'Shineray', 'SHI 175', '2025', 'VZB0119', 'VZF0119'),
(168, 'Shineray', 'Flash 250F', '2025', 'VZB0116', 'VZF0116'),
(169, 'Shineray', 'Rio 125', '2025', 'VZB0120', 'VZF0120'),
(170, 'Shineray', 'STORM 200', '2025', 'VZB0117', 'VZF0117'),
(171, 'Shineray', 'Denver 250', '2025', 'VZB0121', 'VZF0121'),
(172, 'Shineray', 'SHI 250', '2025', 'VZB0118', 'VZF0118'),
-- ---------------- YAMAHA ----------------
(173, 'Yamaha', 'XMAX Connected', '2025', 'VZB0088', 'VZF0088'),
(174, 'Yamaha', 'Fazer FZ-25', '2018–2024', 'VZB0092', 'VZF0092'),
(175, 'Yamaha', 'MT-03', '2021–2026', 'VZB0089', 'VZF0089'),
(176, 'Yamaha', 'Fazer Fz25 Connected', '2025', 'VZB0090', 'VZF0090'),
(177, 'Yamaha', 'Lander Connected', '2025', 'VZB0090', 'VZF0090'),
(178, 'Yamaha', 'Factor DX', '2025', 'VZB0094', 'VZF0094'),
(179, 'Yamaha', 'XTZ Crosser 150', '2022–2025', 'VZB0091', 'VZF0091'),
(180, 'Yamaha', 'NMAX 160', '2020–2024', 'VZB0095', 'VZF0095'),
(181, 'Yamaha', 'Lander 250 / XTZ 250', '2019–2024', 'VZB0092', 'VZF0092'),
(182, 'Yamaha', 'MT-07', '2014–2024', 'VZB0096', 'VZF0096'),
(183, 'Yamaha', 'NMAX ABS Connected', '2025', 'VZB0093', 'VZF0093'),
(184, 'Yamaha', 'Tracer 900 GT', '2019–2024', 'VZB0097', 'VZF0097'),
(185, 'Yamaha', 'FZ15', '2022–2025', 'VZB0091', 'VZF0091'),
(186, 'Yamaha', 'MT-09', '2015–2024', 'VZB0098', 'VZF0098'),
(187, 'Yamaha', 'YZF-R15 ABS', '2023–2025', 'VZB0099', 'VZF0099'),
(188, 'Yamaha', 'Nova MT-07 Connected', '2025', 'VZB0105', 'VZF0105'),
(189, 'Yamaha', 'Factor 150i', '2024–2026', 'VZB0100', 'VZF0100'),
(190, 'Yamaha', 'Crosser 150', '2014–2022', 'VZB0103', 'VZF0103'),
(191, 'Yamaha', 'Fluo 125', '2022–2024', 'VZB0101', 'VZF0101'),
(192, 'Yamaha', 'XTZ Lander 250', '2017–2018', 'VZB0106', 'VZF0106'),
(193, 'Yamaha', 'YZF-R3', '2021–2024', 'VZB0089', 'VZF0089'),
(194, 'Yamaha', 'XT 1200Z Super Ténéré', '2016–2020', 'VZB0107', 'VZF0107'),
(195, 'Yamaha', 'Fazer 250', '2011–2015', 'VZB0102', 'VZF0102'),
(196, 'Yamaha', 'MT-03', '2017–2020', 'VZB0089', 'VZF0089'),
(197, 'Yamaha', 'Fazer 150 UBS', '2014–2023', 'VZB0103', 'VZF0103'),
(198, 'Yamaha', 'XTZ 250 Ténéré', '2011–2015', 'VZB0102', 'VZF0102'),
(199, 'Yamaha', 'Nova Fluo 125', '2025', 'VZB0104', 'VZF0104'),
(200, 'Yamaha', 'Tenere 250 / XT250Z', '2016–2019', 'VZB0106', 'VZF0106'),
(201, 'Yamaha', 'Factor 125i', '2016–2024', 'VZB0100', 'VZF0100'),
(202, 'Yamaha', 'YZF-R1 / R1M', '2015–2016', 'VZB0111', 'VZF0111'),
(203, 'Yamaha', 'YZF-R3', '2017–2020', 'VZB0109', 'VZF0109'),
(204, 'Yamaha', 'Fazer 600 / FZ6-S', '2005–2014', 'VZB0102', 'VZF0102'),
(205, 'Yamaha', 'XJ6-N / XJ6-F', '2010–2019', 'VZB0102', 'VZF0102'),
(206, 'Yamaha', 'YZF-R1', '2009–2014', 'VZB0112', 'VZF0112'),
(207, 'Yamaha', 'MT-09 Tracer 900', '2017–2018', 'VZB0107', 'VZF0107'),
(208, 'Yamaha', 'Nova Ténéré 700', '2026', 'VZB0113', 'VZF0113'),
(209, 'Yamaha', 'FZ6-N', '2008–2009', 'VZB0102', 'VZF0102'),
(210, 'Yamaha', 'Nova MT-09 Connected', '2025+', 'VZB0105', 'VZF0105'),
(211, 'Yamaha', 'Fazer 250 / FZ-25', '2016–2017', 'VZB0106', 'VZF0106'),
(212, 'Yamaha', 'Tenere 660', '2008–2016', 'VZB0110', 'VZF0110');

-- 5) Restaura as imagens preservadas, casando pelo num.
--    (Só reaplica onde havia imagem antes; novas linhas ficam sem imagem
--     até que folder/file/image_url sejam preenchidos.)
UPDATE products p
   SET folder    = b.folder,
       file      = b.file,
       image_url = b.image_url
  FROM _img_backup b
 WHERE p.num = b.num;

DROP TABLE _img_backup;

-- 6) Conferência rápida (opcional)
-- SELECT brand, count(*) FROM products GROUP BY brand ORDER BY brand;
-- SELECT count(*) AS total_motos, count(DISTINCT code_b) AS peliculas_distintas FROM products;
-- SELECT num, brand, model, year, code_b, code_f, image_url FROM products WHERE image_url IS NULL;
