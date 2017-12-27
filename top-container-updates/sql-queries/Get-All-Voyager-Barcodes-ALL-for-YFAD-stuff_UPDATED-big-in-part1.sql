SELECT YALEDB.ITEM_BARCODE.ITEM_BARCODE
	, YALEDB.LOCATION.LOCATION_ID
	, YALEDB.LOCATION.LOCATION_NAME
	, YALEDB.BIB_MFHD.BIB_ID
	, YALEDB.BIB_MFHD.MFHD_ID
	, YALEDB.ITEM.ITEM_ID
	, CASE WHEN (YALEDB.MFHD_ITEM.ITEM_ENUM is null OR YALEDB.MFHD_ITEM.ITEM_ENUM = 'Box' OR YALEDB.MFHD_ITEM.ITEM_ENUM = 'Volume') THEN 'assumedbox 1'
	       ELSE YALEDB.MFHD_ITEM.ITEM_ENUM END
	       as ITEM_ENUM
  , YALEDB.ITEM.PERM_LOCATION
  , YALEDB.ITEM_STATS.ITEM_STAT_ID
	
FROM YALEDB.ITEM_BARCODE 
JOIN YALEDB.ITEM ON YALEDB.ITEM_BARCODE.ITEM_ID = YALEDB.ITEM.ITEM_ID
LEFT JOIN YALEDB.ITEM_STATS ON YALEDB.ITEM_STATS.ITEM_ID = YALEDB.ITEM.ITEM_ID
LEFT JOIN YALEDB.ITEM_NOTE ON YALEDB.ITEM_NOTE.ITEM_ID = YALEDB.ITEM.ITEM_ID
JOIN YALEDB.MFHD_ITEM ON YALEDB.MFHD_ITEM.ITEM_ID = YALEDB.ITEM.ITEM_ID
JOIN YALEDB.MFHD_MASTER ON YALEDB.MFHD_MASTER.MFHD_ID = YALEDB.MFHD_ITEM.MFHD_ID
JOIN YALEDB.LOCATION ON YALEDB.LOCATION.LOCATION_ID = YALEDB.MFHD_MASTER.LOCATION_ID 
JOIN YALEDB.BIB_MFHD ON YALEDB.BIB_MFHD.MFHD_ID = YALEDB.MFHD_MASTER.MFHD_ID


WHERE YALEDB.ITEM_BARCODE.BARCODE_STATUS = '1'
AND (YALEDB.BIB_MFHD.BIB_ID in 
('11158057', '12659132', '3214041', '13233225', '9450591', '9446173', '9440697', '9441937', '9479676', '9451869', '9453078', '8906291', '9720841', '9792006', '9867362', '9880695', '9873251', '11162245', '11179687', '11180291', '11075447', '3174264', '11069387', '7803408', '11310971', '11146005', '12883710', '12883725', '13298982', '13322583', '1050621', '1050622', '1050623', '1050625', '1050652', '1050624', '1050648', '1050626', '1050651', '1050649', '1050628', '1050650', '1050629', '1050630', '1050631', '1050632', '1050627', '1050637', '1050641', '1050644', '1050642', '1050620', '881806', '865608', '881803', '881804', '881805', '881807', '881810', '1050646', '3265757', '1050640', '1050636', '1050638', '3814885', '7060030', '3980468', '4119156', '6766887', '4249925', '4499497', '10593249', '4391144', '842130', '842131', '842132', '842133', '842134', '842143', '842129', '842135', '842140', '842137', '842139', '4226371', '842116', '842138', '842125', '842127', '842128', '842124', '842119', '842136', '842123', '842121', '842115', '1050618', '842122', '842113', '842112', '842142', '842126', '842118', '842145', '842117', '842141', '881809', '842144', '896498', '3814653', '1059575', '1050639', '4268924', '842114', '842120', '4196388', '4065431', '4070709', '1050647', '4223687', '4223707', '4120952', '3791049', '4237370', '4224844', '10563612', '4795449', '4775896', '4684133', '4937811', '4939091', '6037589', '6337820', '8194277', '7262773', '8398602', '8626992', '13268171', '10616931', '10434917', '10538648', '10563814', '10584791', '10601196', '10630626', '10584770', '11679782', '10573886', '10570726', '6831420', '13183412', '3130987', '13142781', '6133201', '10513188', '12752544', '10421363', '11747466', '10507591', '4309580', '4304125', '6343029', '6477470', '6583776', '966184', '12696196', '8013998', '6602696', '6607329', '6451561', '6689703', '7110446', '7715774', '8427490', '9110977', '9326873', '9517592', '9669005', '10078153', '10199720', '10153638', '10200890', '10349670', '10421021', '3664368', '6628630', '11112725', '11172350', '11286530', '11331567', '11377375', '13029110', '11941854', '12161317', '12316503', '12403133', '12272231', '12501592', '12845346', '13079728', '13173464', '6303198', '11702197', '11802543', '12859256', '13074949', '12785602', '967543', '613902', '613666', '613669', '4295288', '613670', '613672', '967557', '613674', '613673', '967558', '613675', '613676', '884369', '613677', '613678', '613679', '613680', '890399', '613726', '613681', '613682', '613916', '613683', '967597', '613722', '613723', '752842', '613724', '613725', '868648', '613751', '4276617', '613727', '613713', '613752', '4268992', '613754', '910174', '967602', '613755', '613756', '613714', '613757', '613758', '967546', '613759', '4288245', '4276648', '613760', '4318422', '613761', '613762', '613763', '613720', '4283247', '4276656', '613764', '613717', '613730', '613718', '820226', '4283257', '613731', '613732', '613733', '4276829', '613734', '613735', '613736', '967540', '613745', '613746', '967556', '613697', '613747', '613748', '884368', '967551', '4276842', '614034', '613737', '613739', '614066', '967552', '967587', '614222', '4280060', '614207', '614223', '613765', '613852', '613851', '613740', '613741', '613853', '613742', '614197', '4276632', '613743', '614407', '613744', '4276886', '614406', '614408', '897136', '4276907', '614409', '614411', '613854', '614412', '614429', '613749', '4276921', '613750', '884372', '613695', '614434', '614430', '614440', '614248', '614450', '614451', '967549', '614452', '614453', '4276980', '967559', '614610', '614517', '787414', '613875', '616148', '4276995', '614454', '967561', '613693', '613766', '613767', '890400', '967548', '614612', '614615', '614455', '613768', '613769', '613861', '1124799', '4277002', '613770', '614456', '4277018', '614457', '614634', '613771', '614041', '614472', '614635', '4283280', '613772', '613773', '752835', '967555', '614636', '614458', '614637', '4288281', '613780', '613709', '967578', '614058', '614064', '614067', '752833', '614093', '613715', '613915', '614078', '613774', '614107', '614161', '613776', '967582', '614079', '613808', '614080', '613781', '614049', '614050', '614806', '613950', '765318', '613775', '613777', '613943', '613951', '4285661', '613778', '613952', '967553', '967563', '613779', '613953', '613782', '614035', '614042', '613783', '4283289', '4295291', '613784', '613785', '613786', '613787', '967579', '613788', '4293528', '967577', '613917', '614051', '4288261', '613789', '613954', '613790', '752834', '613955', '4277028', '613944', '613791', '613956', '922009', '613687', '4293535', '613792', '613958', '4283438', '613793', '613794', '4291650', '616321', '4324663', '1070574', '613795', '613971', '613796', '613797', '868644', '613798', '613799', '752837', '613809', '613977', '613810', '613811', '613819', '967564', '613812', '752836', '613704', '613813', '613692', '613972', '780727', '613814', '613800', '613801', '613802', '4277038', '614294', '613815', '614331', '614347', '614345', '4277048', '613816', '614348', '613817', '967566', '613818', '614295', '614296', '613803', '614335', '614337', '765315', '614341', '613820', '967599', '613821', '967568', '613822', '614396', '613823', '614413', '613824', '752845', '967547', '614397', '614414', '614415', '613988', '613989', '614435', '613992', '613990', '613991', '614416', '613993', '614436', '614437', '614438', '614441', '613994', '613995', '897137', '613999', '614442', '613996', '614213', '752839', '613997', '967583', '614118', '614000', '614008', '4277060', '967592', '4277439', '614009', '613998', '614123', '967585', '614014', '614015', '4283978', '989896', '614019', '614088', '614020', '614021', '967554', '614109', '614022', '614030', '614036', '4292670', '4292639', '614108', '614037', '614038', '614096', '613963', '967572', '614001', '614044', '4277541', '614043', '967575', '614046', '614052', '614047', '614089', '614056', '967573', '967569', '4277752', '4277710', '4277730', '967580', '614039', '614094', '614059', '614053', '614054', '614060', '614068', '614061', '614069', '955539', '614070', '613964', '614062', '614071', '614072', '614176', '614177', '614082', '614073', '614075', '614097', '614198', '614178', '614254', '614126', '614181', '868645', '614127', '614206', '614119', '614274', '614122', '614208', '614074', '614121', '614214', '614128', '4277561', '614076', '614209', '4283298', '614225', '614226', '4277788', '614210', '614111', '4277794', '614275', '4277820', '614253', '614249', '614139', '614138', '1019936', '4277859', '614140', '614255', '967589', '752844', '614194', '4283306', '614195', '765316', '614250', '614083', '4291652', '752841', '614090', '967594', '614227', '614230', '616348', '614277', '614081', '615604', '614084', '922010', '613712', '614098', '614141', '614112', '614099', '614091', '614100', '614085', '614101', '614144', '967567', '613965', '614045', '967581', '752840', '614040', '614145', '614055', '613966', '613967', '614113', '614114', '967584', '614146', '613661', '613843', '613691', '614147', '613855', '613973', '614148', '613974', '614383', '613804', '4333287', '614384', '614057', '614372', '614373', '614149', '613856', '614374', '614375', '613857', '614376', '614392', '614393', '613701', '4279821', '614417', '4279914', '614048', '614150', '614151', '614443', '614431', '614459', '614152', '967604', '614158', '614461', '614460', '614473', '614638', '614639', '613719', '967541', '614640', '4279988', '613858', '614153', '1065438', '794029', '614154', '614228', '613689', '614444', '614492', '614215', '614498', '614518', '967550', '614520', '613859', '614519', '614231', '613729', '614232', '752838', '614521', '4281098', '614499', '773152', '614641', '613860', '614236', '614217', '967539', '614160', '614278', '614297', '614329', '614326', '614211', '614229', '613694', '614159', '967601', '613862', '613708', '967600', '614309', '614298', '614168', '614310', '614346', '614349', '801224', '614169', '613863', '613716', '614256', '614338', '614343', '613698', '752832', '614311', '614251', '614312', '614257', '613696', '4297408', '613864', '613710', '613702', '4295296', '614252', '967595', '967586', '614279', '614180', '868647', '614280', '614170', '613805', '613892', '4281843', '614327', '614182', '967608', '773151', '4281853', '4281881', '613707', '614258', '614377', '614183', '614378', '614379', '614184', '614418', '614172', '614419', '614399', '4287723', '614259', '614282', '967596', '613866', '614281', '613893', '614260', '614420', '613867', '614185', '614299', '613894', '614276', '613946', '614261', '613903', '967588', '614283', '614199', '967598', '614200', '614237', '967590', '613904', '614233', '4285840', '614212', '614201', '613905', '801223', '613918', '614234', '794030', '613906', '614302', '4295309', '614313', '614314', '614235', '614445', '614446', '614447', '614216', '613907', '614218', '752830', '613919', '614449', '752843', '614238', '614485', '614500', '614642', '614643', '614501', '4281890', '613806', '614285', '614421', '614644', '614645', '613807', '967542', '614502', '614646', '614286', '614186', '613908', '614287', '613910', '613825', '614647', '614288', '614289', '613969', '614648', '613911', '613912', '613913', '613914', '614328', '614386', '614380', '614342', '614315', '614334', '614336', '614350', '614339', '614344', '614316', '614351', '614352', '614353', '613690', '614354', '614355', '613826', '614356', '614357', '614358', '614359', '613827', '614360', '614503', '614317', '614361', '614318', '614319', '614362', '614363', '614364', '614187', '614365', '614320', '614366', '614367', '614322', '614321', '614323', '614324', '614368', '614325', '614369', '614370', '613828', '614371', '614381', '613876', '614382', '614387', '614388', '613877', '613878', '614389', '614390', '614394', '614395', '614400', '614401', '614188', '614402', '614403', '614391', '614404', '614405', '614422', '614423', '614424', '614425', '614426', '614427', '613879', '868642', '613829', '613880', '613830', '614428', '614504', '614505', '614649', '614506', '613831', '613881', '614650', '614652', '614654', '614655', '614656', '614660', '614661', '613882', '613662', '614662', '613663', '614663', '614664', '613883', '614665', '614666', '614667', '613884', '613885')
OR YALEDB.BIB_MFHD.BIB_ID in
('614668', '614669', '613832', '614670', '613833', '613834', '614671', '614672', '884371', '614674', '614675', '614676', '614677', '614678', '614679', '613921', '614680', '614496', '614681', '614682', '613922', '614683', '613835', '614684', '614685', '614686', '614224', '614687', '614688', '614651', '614484', '967544', '614689', '614690', '614691', '614692', '614693', '614694', '614695', '614696', '4284210', '614697', '614698', '613923', '773153', '613924', '614699', '613925', '614700', '614701', '614702', '614032', '614703', '614704', '614705', '614706', '614707', '614708', '614709', '614710', '613926', '613711', '613927', '613703', '614711', '614712', '614189', '613929', '614190', '613930', '613836', '613931', '613932', '614713', '614714', '614715', '613933', '613837', '613934', '613664', '613935', '614717', '613838', '4281900', '614718', '967570', '4285081', '614719', '613936', '613839', '614720', '4281934', '614721', '614722', '613937', '614723', '614605', '613728', '613938', '614606', '614607', '613939', '614608', '614609', '613940', '613941', '967565', '614611', '613942', '614613', '614614', '614616', '613945', '613840', '613841', '613947', '613665', '613948', '614617', '614618', '614619', '614620', '1076700', '614621', '614497', '613688', '614622', '614623', '613949', '614624', '613705', '613671', '614625', '614626', '614627', '613959', '614628', '614629', '614630', '613968', '613970', '868646', '613975', '614631', '614632', '613976', '614633', '613979', '613980', '614724', '613686', '614725', '613981', '613842', '613982', '614726', '613844', '613983', '614727', '613845', '613984', '614728', '967545', '614731', '614732', '613985', '613846', '613986', '613847', '614733', '614716', '614735', '614736', '613987', '613848', '614002', '614737', '614738', '614739', '614003', '614740', '613849', '614004', '614730', '613957', '614005', '614006', '613850', '967571', '614007', '614541', '614191', '614584', '613895', '614585', '614192', '614219', '614542', '614543', '613886', '967576', '614220', '614239', '614193', '614196', '614544', '614545', '614202', '614546', '614547', '614203', '614262', '614548', '613887', '614549', '613888', '614263', '4281939', '613889', '614550', '614264', '613890', '614204', '614205', '967593', '614551', '614552', '614553', '614554', '613891', '614555', '614265', '967591', '614240', '614241', '614556', '614522', '614523', '614031', '614524', '614024', '614025', '614026', '614027', '4284963', '614525', '614526', '614527', '614528', '613896', '614529', '613667', '614565', '614566', '613868', '614567', '614568', '613685', '614569', '614570', '614531', '614532', '614533', '614534', '613684', '614535', '614536', '614537', '967574', '614242', '614538', '614539', '614571', '614572', '614573', '614243', '613869', '614221', '614540', '614586', '614574', '614575', '614576', '614588', '614577', '614579', '614507', '614580', '614589', '614821', '614509', '614581', '614011', '614582', '614583', '613897', '967560', '613898', '614012', '613870', '614013', '614590', '613871', '614591', '614592', '614593', '614594', '614510', '614245', '614511', '614512', '614513', '614595', '614514', '614596', '614597', '614598', '614599', '614600', '614601', '967562', '613899', '614016', '614017', '614273', '613900', '752853', '614820', '613901', '614272', '614291', '614290', '614292', '614018', '614293', '614028', '614029', '614602', '614603', '614308', '614247', '613872', '613909', '613668', '613873', '4281943', '614301', '614303', '614305', '614306', '613721', '613874', '613706', '614300', '614304', '613753', '614604', '613738', '868643', '765317', '613960', '4287710', '929109', '614307', '614284', '614410', '614385', '922008', '614516', '614775', '614766', '615129', '615154', '616325', '615693', '615749', '615744', '615993', '615776', '615868', '616680', '616679', '616195', '616196', '616224', '616322', '616251', '616313', '616323', '616324', '616431', '616387', '616388', '616409', '616681', '616682', '616684', '616685', '616686', '616687', '616688', '616689', '616690', '616683', '616691', '616491', '616631', '616632', '616646', '616667', '616724', '616725', '616726', '616744', '616751', '616750', '616773', '616792', '616821', '616837', '616850', '616848', '616851', '616927', '616928', '616944', '616947', '616945', '616946', '616943', '752863', '616961', '752864', '616989', '752855', '617042', '617038', '617039', '617049', '617030', '752856', '617043', '617044', '617050', '752901', '752903', '752906', '752905', '752891', '752909', '752908', '752910', '752914', '773157', '810021', '801241', '843540', '843541', '801228', '843545', '843542', '801242', '843543', '843544', '843533', '843546', '884373', '884378', '884376', '922011', '1015593', '1072603', '1065471', '1074930', '1074942', '1074943', '1074944', '1070563', '1070564', '1070565', '1070566', '1070567', '1070568', '1074939', '1074938', '1074936', '1074937', '1074935', '1074932', '1072604', '1074941', '1074940', '1070569', '1070570', '1070562', '1074933', '1074934', '1074946', '1074945', '1074948', '1074947', '1074931', '1074949', '1078808', '1088194', '1088198', '1088199', '1088200', '1088201', '1088202', '1088203', '1088205', '1088206', '1088207', '1088208', '1088210', '1088209', '1088211', '1089270', '1089271', '1089272', '1089273', '1088196', '1088197', '1088193', '1088212', '4318463', '1124800', '1124797', '1119399', '4301837', '4324822', '4284717', '4284730', '4292479', '4317090', '4317029', '4395413', '4391299', '4411447', '4787174', '6345891', '1119403', '1089274', '884374', '884375', '884379', '922014', '884377', '897138', '922012', '910175', '910176', '3040774', '922015', '934749', '934747', '4296417', '989897', '1031932', '989898', '989895', '989899', '1001183', '989900', '989902', '989901', '982252', '1024103', '992508', '4281948', '4337373', '998960', '4299035', '995000', '995001', '1001184', '1004540', '1004541', '1004542', '1036042', '1064079', '4285874', '1061725', '1064075', '4288112', '1019937', '1019938', '1019939', '1064076', '1019940', '1036046', '1076699', '1019941', '1036044', '1043591', '1031930', '1036040', '1036041', '1031933', '1064077', '1040888', '1036043', '1036045', '1040889', '1040890', '1043593', '1043592', '1043594', '4293908', '1050680', '1047900', '1050679', '1072600', '1064078', '1052299', '1076698', '1068954', '1058039', '1068950', '1064074', '1064080', '1065472', '1074950', '1064081', '1064082', '1064083', '4291669', '1070571', '1133537', '1068953', '1072602', '1072601', '1089268', '1095410', '1070561', '1068952', '1093089', '1068955', '1074951', '1076696', '1076697', '1081048', '1088195', '1081047', '1078809', '1090381', '1096694', '4287847', '4301698', '1088204', '4291233', '1100291', '1089267', '1089269', '1096693', '1090383', '1093092', '1090382', '1093091', '1095411', '4571198', '1091697', '1096695', '1094399', '1095412', '1095413', '1096696', '4317269', '4284624', '1097624', '1097625', '4326655', '1119865', '4593450', '1118461', '4324325', '1117654', '1124798', '1117655', '4301808', '4285607', '4454492', '4326639', '1117656', '4285887', '1119402', '1119404', '1119401', '4325383', '4304528', '4324288', '4395374', '4307212', '1122985', '4337354', '4324740', '4287785', '4291181', '4296215', '4329668', '4325712', '9579382', '1133539', '1133538', '4442077', '4513038', '4427593', '4436586', '4421628', '4427607', '4436561', '4435767', '4436542', '4443574', '4454865', '4462273', '4637354', '4618383', '4523181', '4704439', '4768247', '12165608', '4519899', '5985988', '4593972', '7432386', '4740351', '4523735', '4557218', '4662693', '6345203', '4576504', '616507', '4641354', '4618803', '4618786', '4687105', '4764671', '4764678', '4816539', '4816612', '4816147', '4816669', '9039958', '4711053', '4752302', '4683358', '4735007', '4918250', '4752342', '4790009', '4780407', '4780262', '4798206', '4806479', '4927098', '6712648', '4836008', '4908768', '7784291', '4881433', '6149953', '4931286', '6038705', '6002103', '6038607', '6005928', '6437630', '6568157', '6106732', '6120233', '6176338', '6226853', '6102164', '6311490', '6386823', '6155410', '6505251', '6176779', '9119799', '6172320', '6205932', '6254261', '6327171', '6234439', '6642819', '6899051', '6480237', '6489458', '7006826', '7153442', '6712592', '9879870', '6627428', '6654374', '7246145', '6701320', '6701626', '6805383', '6819920', '6773041', '6788295', '6951832', '6952429', '7022405', '7132355', '7132373', '7128673', '7128146', '7130759', '7117038', '7117051', '7003616', '7025456', '6997857', '7045652', '7314961', '7010941', '7029659', '7054470', '7063586', '7149631', '7105791', '7129458', '7404199', '7942829', '7142868', '8839554', '9304350', '7317042', '7672550', '8055566', '7448574', '7642963', '7555756', '7691118', '7671053', '7707196', '11865084', '7827191', '7707498', '8089520', '9379522', '7779237', '7773487', '8211987', '8105711', '9119724', '9073315', '7903407', '7925666', '9692357', '8202620', '8204072', '8027700', '8106857', '8409325', '8275222', '9127052', '8446587', '8203509', '9916222', '8123726', '9300625', '8447240', '9042302', '9042350', '8154359', '9060277', '9125881', '8420954', '8507931', '8430517', '9116298', '9086112', '8333390', '8524936', '8324697', '8379815', '8379447', '8381632', '10413403', '9110285', '8832419', '8580751', '12344264', '8963166', '8527171', '8506125', '8613321', '8519756', '8963060', '6647700', '12839722', '8940627', '8706619', '8815648', '8622194', '9523299', '8946545', '8991850', '11253324', '8888751', '9452234', '9056203', '8940608', '8939831', '9149283', '8981755', '8904515', '8969971', '11035511', '9040109', '9745494', '9579477', '11461464', '10117225', '9956336', '9617976', '9600771', '9700991', '9575256', '9590285', '9590195', '11703935', '9604373', '9728935', '9962654', '9650296', '7522846', '10527516', '11857492', '10298501', '10454191', '10201556', '10564444', '11714849', '10964461', '11314550', '11795387', '11646657', '11318042', '12105450', '11659270', '12452425', '11370341', '11898494', '11821096', '12251776', '12251425', '11898121', '11907586', '12126568', '11979924', '12251731', '12344266', '12344267', '12578780', '12374981', '12847798', '10745655', '9742875', '12624382', '12449675', '12415480', '12710683', '12420121', '12610948', '13001952', '12535679', '12532316', '7722256', '13080379', '7823605', '8228072', '12710666', '13080425', '13080447', '10133244', '13149004', '12847931', '12956368', '12631877', '13027713', '12709873', '12848659', '12584987', '12737055', '13001997', '12964867', '13001275', '13058224', '12838660', '13097125', '13004690', '13003769', '13027094', '12907288', '12907292')
)