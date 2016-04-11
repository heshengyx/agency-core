http://datatables.club/
java -cp ../lib/hsqldb.jar org.hsqldb.Server -database.0 agencydb -dbname.0 agency_db
java -cp ../lib/hsqldb.jar org.hsqldb.util.DatabaseManager -url jdbc:hsqldb:hsql://localhost/agency_db
http://www.gbtags.com/gb/debug/new.htm

从MySQL5.7.6开始,要这样子安装
先 mysqld --initialize-insecure
然后 mysqld -install
最后net start mysql

开始->运行->cmd
停止：net stop mysql
启动：net start mysql
前提MYSQL已经安装为windows服务

mysql -u root -p

CentOS release 6.5

CREATE DATABASE `agency_db`  
CHARACTER SET 'utf8'  
COLLATE 'utf8_general_ci';

show variables like "%char%";

SET NAMES utf8;

SET character_set_client='utf8';  
SET character_set_connection='utf8';  
SET character_set_results='utf8';
SET character_set_server='utf8';

show create database agency_db;

open root@98.126.243.27

CREATE TABLE USER
(
    ID VARCHAR(50) NOT NULL,
    NICKNAME VARCHAR(100),
    USERNAME VARCHAR(100),
    ACCOUNT VARCHAR(100),
    PASSWORD VARCHAR(100),
    EMAIL VARCHAR(100),
    PHONE VARCHAR(100),
    LEVEL CHAR(1),
    TYPE CHAR(1),
    STATUS CHAR(1),
    CREATE_TIME DATETIME,
    UPDATE_TIME DATETIME,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
);

CREATE TABLE USER_ROLE
(
    USER_ID VARCHAR(50) NOT NULL,
	ROLE_ID VARCHAR(50) NOT NULL
);

CREATE TABLE ROLE
(
    ID VARCHAR(50) NOT NULL,
    NAME VARCHAR(100),
    STATUS CHAR(1),
    CREATE_TIME DATETIME,
    UPDATE_TIME DATETIME,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
);

CREATE TABLE ROLE_PERMISSION
(
	ROLE_ID VARCHAR(50) NOT NULL,
	PERMISSION_ID VARCHAR(50) NOT NULL
);

CREATE TABLE PERMISSION
(
    ID VARCHAR(50) NOT NULL,
    PARENT_ID VARCHAR(50),
    NAME VARCHAR(100),
    URL VARCHAR(100),
    STATUS CHAR(1),
    CREATE_TIME DATETIME,
    UPDATE_TIME DATETIME,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
);
ALTER TABLE ROLE ADD TAG VARCHAR(100);
ALTER TABLE PERMISSION ADD TAG VARCHAR(100);

INSERT INTO USER(ID, NAME, ACCOUNT, PASSWORD, STATUS) VALUES('e78fc614ce459cc167000', 'lock', 'lock', '123456', '1')
INSERT INTO USER(ID, NAME, ACCOUNT, PASSWORD, STATUS) VALUES('e78fc614ce459cc168000', 'jack', 'jack', '123456', '1')
INSERT INTO ROLE(ID, NAME, STATUS) VALUES('e88fc614ce459cc168001', 'manage', '1')
INSERT INTO PERMISSION(ID, NAME, URL, STATUS) VALUES('e88fc614ce459cc168002', 'manage:building', '/manage/building', '1')
INSERT INTO USER_ROLE(USER_ID, ROLE_ID) VALUES('e88fc614ce459cc168000', 'e78fc614ce459cc168001')
INSERT INTO ROLE_PERMISSION(ROLE_ID, PERMISSION_ID) VALUES('e88fc614ce459cc168001', 'e88fc614ce459cc168002')

CREATE TABLE BUILDING
(
    ID VARCHAR(50) NOT NULL,
    TOWN_ID VARCHAR(50),
    BUILDING_NAME VARCHAR(100),
    BUILDING_YEAR VARCHAR(100),
    BUILDING_ADDRESS VARCHAR(100),
    COORDINATE_X VARCHAR(50),
    COORDINATE_Y VARCHAR(50),
    TYPE CHAR(1),
    SUBMAY INT,
    STATUS CHAR(1),
    CREATE_TIME DATETIME,
    UPDATE_TIME DATETIME,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
);
CREATE TABLE BUILDING_UNIT
(
    ID VARCHAR(50) NOT NULL,
    BUILDING_ID VARCHAR(50),
    NAME VARCHAR(100),
    FLOOR int,
    STATUS CHAR(1),
    CREATE_TIME DATETIME,
    UPDATE_TIME DATETIME,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
);
CREATE TABLE BUILDING_IMAGE
(
    ID VARCHAR(50) NOT NULL,
    BUILDING_ID VARCHAR(50),
    USER_ID VARCHAR(50),
    TITLE VARCHAR(100),
    URL VARCHAR(100),
    STATUS CHAR(1),
    CREATE_TIME DATETIME,
    UPDATE_TIME DATETIME,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
);
CREATE TABLE HOUSE
(
    ID VARCHAR(50) NOT NULL,
    BUILDING_UNIT_ID VARCHAR(50),
    CODE    VARCHAR(50),
    ENCODE  VARCHAR(50),
    AREA  INT,
    FLOOR INT,
    ROOM  INT,
    SALOON  INT,
    TOILET  INT,
    KITCHEN INT,
    FACE    INT,
    FITMENT INT,
    OWNER   INT,
    STATUS  CHAR(1),
    CREATE_TIME DATETIME,
    UPDATE_TIME DATETIME,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
);
CREATE TABLE HOUSE_IMAGE
(
    ID VARCHAR(50) NOT NULL,
    HOUSE_ID VARCHAR(50),
    USER_ID VARCHAR(50),
    TITLE VARCHAR(100),
    URL VARCHAR(100),
    STATUS CHAR(1),
    CREATE_TIME DATETIME,
    UPDATE_TIME DATETIME,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
);
CREATE TABLE IMAGE
(
    ID VARCHAR(50) NOT NULL,
    FOREIGN_ID VARCHAR(50),
    USER_ID VARCHAR(50),
    TITLE VARCHAR(100),
    URL VARCHAR(100),
    TYPE CHAR(1),
    STATUS CHAR(1),
    CREATE_TIME DATETIME,
    UPDATE_TIME DATETIME,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
);
SELECT e.TITLE IMG_TITLE, e.URL, a.TITLE, d.BUILDING_NAME, d.BUILDING_ADDRESS, b.AREA, b.ROOM, b.SALOON, b.TOILET
  FROM TRADE a
  JOIN HOUSE b
    ON a.HOUSE_ID = b.ID
  JOIN BUILDING_UNIT c
    ON b.BUILDING_UNIT_ID = c.ID
  JOIN BUILDING d
    ON c.BUILDING_ID = d.ID
  LEFT JOIN IMAGE e
    ON a.IMAGE_ID = e.ID;

SELECT a.*
  FROM IMAGE a
  JOIN TRADE_IMAGE b
    on a.ID = b.IMAGE_ID
 where b.TRADE_ID = '10f9d8153c6b57da38000'
   AND a.TYPE = '2';

CREATE TABLE TRADE
(
    ID VARCHAR(50) NOT NULL,
    HOUSE_ID VARCHAR(50),
    USER_ID VARCHAR(50),
    IMAGE_ID VARCHAR(50),
    PRICE  INT,
    TITLE VARCHAR(100),
    RELEASE_TIME DATETIME,
    TYPE   CHAR(1),
    STATUS CHAR(1),
    CREATE_TIME DATETIME,
    UPDATE_TIME DATETIME,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
);
CREATE TABLE TRADE_IMAGE
(
    ID VARCHAR(50) NOT NULL,
    TRADE_ID VARCHAR(50),
    IMAGE_ID VARCHAR(50),
    TYPE   CHAR(1),
    STATUS CHAR(1),
    CREATE_TIME DATETIME,
    UPDATE_TIME DATETIME,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
);
ALTER TABLE TRADE ADD RELEASE_TIME DATETIME;
ALTER TABLE TRADE ADD IMAGE_ID VARCHAR(50);
CREATE TABLE CUSTOMER
(
    ID VARCHAR(50) NOT NULL,
    USER_ID VARCHAR(50),
    NAME VARCHAR(100),
    PHONE VARCHAR(100),
    LEVEL CHAR(1),
    STATUS CHAR(1),
    CREATE_TIME DATETIME,
    UPDATE_TIME DATETIME,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
);
CREATE TABLE CUSTOMER_REQUIRE
(
    ID VARCHAR(50) NOT NULL,
    CUSTOMER_ID VARCHAR(50),
    DISTRICT_IDS VARCHAR(1000),
    TOWN_IDS VARCHAR(1000),
    BUILDING_IDS VARCHAR(1000),
    PRICE_BEGIN INT,
    PRICE_END INT,
    AREA_BEGIN  INT,
    AREA_END  INT,
    FLOORS VARCHAR(50),
    ROOMS  VARCHAR(50),
    SALOONS  VARCHAR(50),
    TOILETS  VARCHAR(50),
    KITCHENS  VARCHAR(50),
    FACES   VARCHAR(50),
    TYPE   CHAR(1),
    STATUS CHAR(1),
    CREATE_TIME DATETIME,
    UPDATE_TIME DATETIME,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
);

CREATE TABLE REGION
(
    ID VARCHAR(50) NOT NULL,
    PARENT_ID VARCHAR(50),
    NAME VARCHAR(100),
    CODE VARCHAR(100),
    LEVEL CHAR(1),
    SEQ   INT,
    STATUS CHAR(1),
    CREATE_TIME DATETIME,
    UPDATE_TIME DATETIME,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE PRODUCT
(
    ID VARCHAR(50) NOT NULL,
    USER_ID VARCHAR(50) NOT NULL,
    NAME VARCHAR(100),
    STATUS CHAR(1),
    CREATE_TIME DATETIME,
    UPDATE_TIME DATETIME,
    REMARKS VARCHAR(1000),
    TITLE VARCHAR(100),
    BIDDING_TYPE  CHAR(1),
    TERM  VARCHAR(10),
    LEVEL VARCHAR(10),
    YEAR_RATE  INT,
    MONEY      INT,
    REPAYMENT  CHAR(1),
    USE_DESC    VARCHAR(1000),
    PRIMARY KEY (ID)
);

CREATE TABLE USER_PRODUCT
(
    ID VARCHAR(50) NOT NULL,
    USER_ID VARCHAR(50) NOT NULL,
    PRODUCT_ID VARCHAR(50) NOT NULL,
    MONEY      INT,
    STATUS CHAR(1),
    CREATE_TIME DATETIME,
    UPDATE_TIME DATETIME,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
)

CREATE TABLE USER_AUTH
(
    ID VARCHAR(50) NOT NULL,
    USER_ID VARCHAR(50) NOT NULL,
    AUTH_TYPE   CHAR(1),
    STATUS      CHAR(1),
    CREATE_TIME DATETIME,
    UPDATE_TIME DATETIME,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
)

CREATE TABLE ACCOUNT
(
    ID VARCHAR(50) NOT NULL,
    USER_ID VARCHAR(50),
    NAME VARCHAR(100),
    STATUS CHAR(1),
    BALANCE  INT,
    CREATE_TIME DATETIME,
    UPDATE_TIME DATETIME,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
)

CREATE TABLE ACCOUNT_TRADE
(
    ID VARCHAR(50) NOT NULL,
    USER_ID VARCHAR(50),
    NAME VARCHAR(100),
    STATUS CHAR(1),
    TYPE   CHAR(1),
    SOURCE VARCHAR(10),
    AMOUNT  INT,
    CREATE_TIME DATETIME,
    UPDATE_TIME DATETIME,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
)

CREATE TABLE BANK_CARD
(
    ID VARCHAR(50) NOT NULL,
    USER_ID VARCHAR(50),
    ACCOUNT_NAME VARCHAR(100),
    BANK_NO VARCHAR(100),
    BANK_NAME VARCHAR(100),
    BANK_CODE VARCHAR(100),
    BANK_ADDRESS VARCHAR(100),
    STATUS CHAR(1),
    TYPE   CHAR(1),
    CREATE_TIME DATETIME,
    UPDATE_TIME DATETIME,
    REMARKS VARCHAR(1000),
    PRIMARY KEY (ID)
)

INSERT INTO PRODUCT(ID, USER_ID, TITLE, LEVEL, YEAR_RATE, MONEY, TERM, STATUS) VALUES('d78fc614ce459cc168000', 'e78fc614ce459cc167000', '鎵╁ぇ鐢熶骇/缁忚惀', 'A', 1200, 125600, '36', '1')
INSERT INTO PRODUCT(ID, USER_ID, TITLE, LEVEL, YEAR_RATE, MONEY, TERM, STATUS) VALUES('d78fc614ce459cc168001', 'e78fc614ce459cc167000', '璐拱璐х墿/鍘熸潗/璁惧', 'A', 1000, 125600, '25', '1')
INSERT INTO PRODUCT(ID, USER_ID, TITLE, LEVEL, YEAR_RATE, MONEY, TERM, STATUS) VALUES('d78fc614ce459cc168002', 'e78fc614ce459cc167000', '绗簩娆″�娆捐淇埧瀛�, 'B', 1200, 125600, '36', '1')
INSERT INTO PRODUCT(ID, USER_ID, TITLE, LEVEL, YEAR_RATE, MONEY, TERM, STATUS) VALUES('d78fc614ce459cc168003', 'e78fc614ce459cc167000', '鍥戒紒鑱屽憳鍊熸鐢ㄤ簬鎴垮眿瑁呬慨', 'B', 1000, 125600, '25', '1')
INSERT INTO PRODUCT(ID, USER_ID, TITLE, LEVEL, YEAR_RATE, MONEY, TERM, STATUS) VALUES('d78fc614ce459cc168004', 'e78fc614ce459cc167000', '鎵╁ぇ鐢熶骇/缁忚惀', 'A', 1200, 125600, '36', '1')
INSERT INTO PRODUCT(ID, USER_ID, TITLE, LEVEL, YEAR_RATE, MONEY, TERM, STATUS) VALUES('d78fc614ce459cc168005', 'e78fc614ce459cc167000', '璐拱璐х墿/鍘熸潗/璁惧', 'A', 1000, 125600, '25', '1')
INSERT INTO PRODUCT(ID, USER_ID, TITLE, LEVEL, YEAR_RATE, MONEY, TERM, STATUS) VALUES('d78fc614ce459cc168006', 'e78fc614ce459cc167000', '绗簩娆″�娆捐淇埧瀛�, 'B', 1200, 125600, '36', '1')
INSERT INTO PRODUCT(ID, USER_ID, TITLE, LEVEL, YEAR_RATE, MONEY, TERM, STATUS) VALUES('d78fc614ce459cc168007', 'e78fc614ce459cc167000', '鍥戒紒鑱屽憳鍊熸鐢ㄤ簬鎴垮眿瑁呬慨', 'B', 1000, 125600, '25', '1')

INSERT INTO USER_PRODUCT(ID, USER_ID, PRODUCT_ID, MONEY, CREATE_TIME) VALUES('g78fc614ce459cc168000', 'e78fc614ce459cc168000', 'd78fc614ce459cc168003', 10000, now())
INSERT INTO USER_PRODUCT(ID, USER_ID, PRODUCT_ID, MONEY, CREATE_TIME) VALUES('g78fc614ce459cc168001', 'f3009314e92335e748000', 'd78fc614ce459cc168003', 10000, now())

INSERT INTO USER_AUTH(ID, USER_ID, AUTH_TYPE, STATUS, CREATE_TIME) VALUES('f78fc614ce459cc168000', 'e78fc614ce459cc168000', 'A', '1', now())
INSERT INTO USER_AUTH(ID, USER_ID, AUTH_TYPE, STATUS, CREATE_TIME) VALUES('f78fc614ce459cc168001', 'e78fc614ce459cc168000', 'B', '1', now())
INSERT INTO USER_AUTH(ID, USER_ID, AUTH_TYPE, STATUS, CREATE_TIME) VALUES('f78fc614ce459cc168002', 'e78fc614ce459cc168000', 'C', '1', now())

INSERT INTO ACCOUNT(ID, USER_ID, BALANCE, STATUS, CREATE_TIME) VALUES('h78fc614ce459cc168000', 'e78fc614ce459cc168000', 0, '1', now())
SELECT
    b.name,
    d.*
FROM
    user_role a
JOIN
    role b
ON
    a.user_id = 'z19f5314e912819698000'
AND a.role_id = b.id --z19f5314e912819698000 admin
JOIN
    role_permission c
ON
    b.id = c.role_id
JOIN
    permission d
ON
    c.permission_id = d.id

http://itindex.net/detail/50593-web-%E9%A1%B9%E7%9B%AE-%E5%BA%94%E7%94%A8



INSERT INTO BUILDING (ID, TOWN_ID, BUILDING_NAME, BUILDING_YEAR, BUILDING_ADDRESS, COORDINATE_X, COORDINATE_Y, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS) VALUES ('3020ad153ef6bbe1f7f00', '5bdc50153ef6bbe1f6a00', '银庄大厦', '2005', '福田区金田南路1013号', null, null, '1', '1', now(), null, null);
INSERT INTO BUILDING (ID, TOWN_ID, BUILDING_NAME, BUILDING_YEAR, BUILDING_ADDRESS, COORDINATE_X, COORDINATE_Y, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS) VALUES ('5bdc50153ef6bbe1f7a00', '5bdc50153ef6bbe1f6a00', '皇庭世纪', '2011', '福田滨河大道与益田路交汇处', null, null, '1', '1', now(), null, null);
INSERT INTO BUILDING (ID, TOWN_ID, BUILDING_NAME, BUILDING_YEAR, BUILDING_ADDRESS, COORDINATE_X, COORDINATE_Y, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS) VALUES ('8c436b153ef6bbe1f7c00', '5bdc50153ef6bbe1f6a00', '水畔紫云阁', '1999', '福田滨河路以南（皇岗口岸以东）', null, null, '1', '1', now(), null, null);
INSERT INTO BUILDING (ID, TOWN_ID, BUILDING_NAME, BUILDING_YEAR, BUILDING_ADDRESS, COORDINATE_X, COORDINATE_Y, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS) VALUES ('9e5c73153ef6bbe1f7d00', '5bdc50153ef6bbe1f6a00', '晨晖家园', '2000', '皇岗公园一街', null, null, '1', '1', now(), null, null);
INSERT INTO BUILDING (ID, TOWN_ID, BUILDING_NAME, BUILDING_YEAR, BUILDING_ADDRESS, COORDINATE_X, COORDINATE_Y, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS) VALUES ('aa9f99153ef6bbe1f7h00', '5bdc50153ef6bbe1f6a00', '皇御苑三期', '1998', '福田福田南路7号', null, null, '1', '1', now(), null, null);
INSERT INTO BUILDING (ID, TOWN_ID, BUILDING_NAME, BUILDING_YEAR, BUILDING_ADDRESS, COORDINATE_X, COORDINATE_Y, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS) VALUES ('b15692153ef6bbe1f7g00', '5bdc50153ef6bbe1f6a00', '皇岗花园', '2010', '福田福田南彩田南路', null, null, '1', '1', now(), null, null);
INSERT INTO BUILDING (ID, TOWN_ID, BUILDING_NAME, BUILDING_YEAR, BUILDING_ADDRESS, COORDINATE_X, COORDINATE_Y, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS) VALUES ('c791b9153ef6bbe1f7e00', '5bdc50153ef6bbe1f6a00', '高发城驰苑', '2003', '福田区福民路与益田路交汇处东南', null, null, '1', '1', now(), null, null);
INSERT INTO BUILDING (ID, TOWN_ID, BUILDING_NAME, BUILDING_YEAR, BUILDING_ADDRESS, COORDINATE_X, COORDINATE_Y, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS) VALUES ('d42d08153ef6bbe1f7i00', '5bdc50153ef6bbe1f6a00', '皇庭彩园', '2006', '福田金田路与福民路的交汇处', null, null, '1', '1', now(), null, null);
INSERT INTO BUILDING (ID, TOWN_ID, BUILDING_NAME, BUILDING_YEAR, BUILDING_ADDRESS, COORDINATE_X, COORDINATE_Y, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS) VALUES ('d86fd3153ef6bbe1f7j00', '5bdc50153ef6bbe1f6a00', '骏皇名居', '2004', '福田丹桂路与金桂路交汇处', null, null, '1', '1', now(), null, null);
INSERT INTO BUILDING (ID, TOWN_ID, BUILDING_NAME, BUILDING_YEAR, BUILDING_ADDRESS, COORDINATE_X, COORDINATE_Y, TYPE, STATUS, CREATE_TIME, UPDATE_TIME, REMARKS) VALUES ('dd3812153ef6bbe1f7b00', '5bdc50153ef6bbe1f6a00', '江南名苑', '2001', '福田福强路2143号', null, null, '1', '1', now(), null, null);


(SELECT
    a.*
FROM
    image a
JOIN
    trade_image b
ON
    a.ID = b.image_id
WHERE
    b.trade_ID = '91993f153fb08a44b7001')
union
(select a.* FROM IMAGE a where 1=1 AND a.FOREIGN_ID = '6b2d4a153fb08a44b7001' AND a.TYPE = '2' AND a.USER_ID IS NULL AND
a.ID not in (SELECT
    a.ID
FROM
    image a
JOIN
    trade_image b
ON
    a.ID = b.image_id
WHERE
    b.trade_ID = '91993f153fb08a44b7001') order by a.CREATE_TIME desc)
union
(select a.* FROM IMAGE a where 1=1 AND a.FOREIGN_ID = 'b44e46153fb08a44b7001' AND a.TYPE = '1' AND a.USER_ID IS NULL AND
a.ID not in (SELECT
    a.ID
FROM
    image a
JOIN
    trade_image b
ON
    a.ID = b.image_id
WHERE
    b.trade_ID = '91993f153fb08a44b7001') order by a.CREATE_TIME desc)
 