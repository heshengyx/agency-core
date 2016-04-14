INSERT INTO TRADE
   (ID, HOUSE_ID, USER_ID, IMAGE_ID, PRICE, TITLE, RELEASE_TIME, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS)
VALUES
   ('91993f153fb08a44b7001', '6b2d4a153fb08a44b7001', '1870dc153c592f7578001', '04e3b2153fb08a44b7001', 20000, '来座山 实用的户型 南北通透 业主低于市场价15万急卖', NOW(), '1', '1', NOW(), NULL, NULL);

INSERT INTO TRADE
   (ID, HOUSE_ID, USER_ID, IMAGE_ID, PRICE, TITLE, RELEASE_TIME, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS)
VALUES
   ('91993f153fb08a44b7002', '6b2d4a153fb08a44b7002', '1870dc153c592f7578001', '04e3b2153fb08a44b7002', 40000, '慢城 大四房 楼王位置 三面采光 业主急卖 还是看山景的', NOW(), '1', '1', NOW(), NULL, NULL);

INSERT INTO TRADE
   (ID, HOUSE_ID, USER_ID, IMAGE_ID, PRICE, TITLE, RELEASE_TIME, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS)
VALUES
   ('91993f153fb08a44b7003', '6b2d4a153fb08a44b7003', '1870dc153c592f7578001', '04e3b2153fb08a44b7003', 60000, '大赠送 拥有自己的装修风格 还是看山景的', NOW(), '1', '1', NOW(), NULL, NULL);

INSERT INTO TRADE
   (ID, HOUSE_ID, USER_ID, IMAGE_ID, PRICE, TITLE, RELEASE_TIME, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS)
VALUES
   ('91993f153fb08a44b7004', '6b2d4a153fb08a44b7004', '1870dc153c592f7578001', '04e3b2153fb08a44b7004', 80000, '南北通透 全新装修 还是看山景的', NOW(), '1', '1', NOW(), NULL, NULL);

INSERT INTO TRADE
   (ID, HOUSE_ID, USER_ID, IMAGE_ID, PRICE, TITLE, RELEASE_TIME, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS)
VALUES
   ('91993f153fb08a44b7005', '6b2d4a153fb08a44b7005', '1870dc153c592f7578001', '04e3b2153fb08a44b7005', 100000, '来座山 全新毛坯 大增送123送60平 实用', NOW(), '1', '1', NOW(), NULL, NULL);

INSERT INTO TRADE
   (ID, HOUSE_ID, USER_ID, IMAGE_ID, PRICE, TITLE, RELEASE_TIME, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS)
VALUES
   ('91993f153fb08a44b7006', '6b2d4a153fb08a44b7006', '1870dc153c592f7578001', '04e3b2153fb08a44b7006', 120000, '城铁沿线91平570万元业主急售!', NOW(), '1', '1', NOW(), NULL, NULL);

INSERT INTO TRADE
   (ID, HOUSE_ID, USER_ID, IMAGE_ID, PRICE, TITLE, RELEASE_TIME, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS)
VALUES
   ('91993f153fb08a44b7007', '6b2d4a153fb08a44b7007', '1870dc153c592f7578001', '04e3b2153fb08a44b7007', 140000, '友邻公寓性价比高,总价,诚意出售!', NOW(), '1', '1', NOW(), NULL, NULL);

INSERT INTO TRADE
   (ID, HOUSE_ID, USER_ID, IMAGE_ID, PRICE, TITLE, RELEASE_TIME, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS)
VALUES
   ('91993f153fb08a44b7008', '6b2d4a153fb08a44b7008', '1870dc153c592f7578001', '04e3b2153fb08a44b7008', 160000, '一手业主享受高端高尔夫美景你值得拥有', NOW(), '1', '1', NOW(), NULL, NULL);

INSERT INTO TRADE
   (ID, HOUSE_ID, USER_ID, IMAGE_ID, PRICE, TITLE, RELEASE_TIME, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS)
VALUES
   ('91993f153fb08a44b7009', '6b2d4a153fb08a44b7009', '1870dc153c592f7578001', '04e3b2153fb08a44b7009', 180000, '名匠设计,豪华装修,满五,业主诚心出售', NOW(), '1', '1', NOW(), NULL, NULL);

INSERT INTO TRADE
   (ID, HOUSE_ID, USER_ID, IMAGE_ID, PRICE, TITLE, RELEASE_TIME, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS)
VALUES
   ('91993f153fb08a44b7010', '6b2d4a153fb08a44b7010', '1870dc153c592f7578001', '04e3b2153fb08a44b7010', 200000, '美荔园3室640万元地地道道好房!', NOW(), '1', '1', NOW(), NULL, NULL);

INSERT INTO IMAGE (ID, FOREIGN_ID, USER_ID, TITLE, URL, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS) VALUES ('4af82c153fb08a44b7001', '6b2d4a153fb08a44b7001', '', '卧室', 'house/FgVS04PCNWRykjeQKltH1v1ZcNXh.jpg', '2', '1', NOW(), null, null);
INSERT INTO IMAGE (ID, FOREIGN_ID, USER_ID, TITLE, URL, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS) VALUES ('4af82c153fb08a44b7002', '6b2d4a153fb08a44b7001', '', '客厅', 'house/FoDwtQIoUvug8VxWKIZTTlSs8Vss.jpg', '2', '1', NOW(), null, null);
INSERT INTO IMAGE (ID, FOREIGN_ID, USER_ID, TITLE, URL, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS) VALUES ('4af82c153fb08a44b7003', '6b2d4a153fb08a44b7001', '', '厨房', 'house/Fv1LUQS378hkbrNFREpj67OnZTT3.jpg', '2', '1', NOW(), null, null);
INSERT INTO IMAGE (ID, FOREIGN_ID, USER_ID, TITLE, URL, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS) VALUES ('4af82c153fb08a44b7004', '6b2d4a153fb08a44b7001', '', '阳台', 'house/FvALB_y0gkhwLyYcGgEl0PHPEpBn.jpg', '2', '1', NOW(), null, null);


INSERT INTO TRADE_IMAGE (ID, TRADE_ID, IMAGE_ID, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS) VALUES ('ff76f1153c6f148b08001', '91993f153fb08a44b7001', '4af82c153fb08a44b7001', null, '1', NOW(), null, null);
INSERT INTO TRADE_IMAGE (ID, TRADE_ID, IMAGE_ID, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS) VALUES ('ff76f1153c6f148b08002', '91993f153fb08a44b7001', '4af82c153fb08a44b7002', null, '1', NOW(), null, null);
