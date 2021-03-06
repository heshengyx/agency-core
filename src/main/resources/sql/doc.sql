//防火墙
一直用CentOS 6 习惯了，一下没适应过来。防火墙配置后执行service iptables save 出现"Failed to restart iptables.service: Unit iptables.service failed to load: No such file or directory."错误,在CentOS 7或RHEL 7或Fedora中防火墙由firewalld来管理，当然你可以还原传统的管理方式。或则使用新的命令进行管理。
假如采用传统请执行一下命令：

systemctl stop firewalld
systemctl mask firewalld

首先查看本机的 iptables 的版本：rpm -qa iptables，发现是iptables-2.16-xxx.xx

于是下载了 iptables 的rpm包，即：iptables-2.16-xxx.xx.rpm

然后强制卸载 iptables 包: rpm -e --nodeps iptables-2.16-xxx.xx  这里需要加上 --nodeps 不考虑依赖，强制卸载。

卸载完毕，安装: rpm -ivh iptables-2.16-xxx.xx.rpm

安装成功后，执行 iptables 命令：iptables -L 。发现不再提示段错误了，正常了。

重启iptables，即执行命令： systemctl restart iptables.service，
查看iptables状态，即：systemctl status iptables.service。
 
并且安装iptables-services：
1
yum install iptables-services
设置开机启动：
1
systemctl enable iptables

systemctl [stop|start|restart] iptables
#or
service iptables [stop|start|restart]
 
service iptables save
#or
/usr/libexec/iptables/iptables.init save
//防火墙

//linux
shutdown -h now
//linux

//Java安装
1.查看Linux自带的JDK是否已安装
查看CentOS自带JDK是否已安装。
输入：yum list installed |grep -i java。
2.卸载OpenJDK
若有自带安装的JDK，如何卸载CentOS系统自带Java环境？
卸载JDK相关文件输入：yum -y remove java-1.7.0-openjdk*。
卸载tzdata-java输入：yum -y remove tzdata-java.noarch。
当结果显示为Complete！即卸载完毕。
3.新建java安装目录
mkdir /usr/java
4.将之前下载的jdk解压缩并安装
tar -zxvf  jdk-7u71-linux-i586.tar.gz
5.在profile文件中加入java环境变量
vi /etc/profile  
  
export JAVA_HOME=/usr/java/jdk1.8.0_91  
export CLASSPATH=.:%JAVA_HOME%/lib/dt.jar:%JAVA_HOME%/lib/tools.jar  
export PATH=$PATH:$JAVA_HOME/bin
6.使文件立即生效
source /etc/profile
7.检测是否安装成功
java -version 
//Java安装

//tomcat安装
[root@admin local]# cd /usr/local  
[root@admin local]# wget http://apache.fayea.com/apache-mirror/tomcat/tomcat-7/v7.0.57/bin/apache-tomcat-7.0.57.tar.gz  
[root@admin local]# tar -zxv -f apache-tomcat-7.0.29.tar.gz // 解压压缩包  
[root@admin local]# rm -rf apache-tomcat-7.0.29.tar.gz // 删除压缩包  
[root@admin local]# mv apache-tomcat-7.0.29 tomcat  //修改文件夹名

[root@admin ~]# /usr/local/tomcat/bin/startup.sh //启动tomcat

8080端口开启
[root@admin ~]# vi + /etc/sysconfig/iptables
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 8081 -j ACCEPT
service iptables restart
//tomcat安装

//MySQL安装
a. 检查MySQL及相关RPM包，是否安装，如果有安装，则移除（rpm –e 名称）
rpm -qa | grep -i mysql //grep的-i选项表示匹配时忽略大小写
rpm -e mysql-libs-5.1.61-4.el6.x86_64 --nodeps //载时使用了--nodeps选项，忽略了依赖关系
yum list installed |grep -i mysql 
yum -y remove mysql-libs*
b. 下载Linux对应的RPM包，如：CentOS6.4_64对应的RPM包，如下
MySQL-client-5.6.15-1.el6.x86_64.rpm
MySQL-devel-5.6.15-1.el6.x86_64.rpm
MySQL-server-5.6.15-1.el6.x86_64.rpm
在下载页面Select Platform:选项选择linux-generic
c. 安装MySQL
[root@localhost rpm]# rpm -ivh MySQL-server-5.6.15-1.el6.x86_64.rpm
[root@localhost rpm]# rpm -ivh MySQL-devel-5.6.15-1.el6.x86_64.rpm
[root@localhost rpm]# rpm -ivh MySQL-client-5.6.15-1.el6.x86_64.rpm 
#修改配置文件位置
[root@localhost rpm]# cp /usr/share/mysql/my-default.cnf /etc/my.cnf
如果直接点击rpm包安装会得到错误提示。因为CentOS的默认数据库已经不再是MySQL了，而是MariaDB，为什么呢？
MariaDB数据库管理系统是MySQL的一个分支，主要由开源社区在维护，采用GPL授权许可。
开发这个分支的原因之一是：甲骨文公司收购了MySQL后，有将MySQL闭源的潜在风险，因此社区采用分支的方式来避开这个风险。
MariaDB的目的是完全兼容MySQL，包括API和命令行，使之能轻松成为MySQL的代替品。
rpm -qa | grep -i mariadb
将它们统统强制性卸载掉：
[root@bogon 桌面]# rpm -e --nodeps mariadb-libs-5.5.35-3.el7.x86_64
[root@bogon 桌面]# rpm -e --nodeps mariadb-5.5.35-3.el7.x86_64
[root@bogon 桌面]# rpm -e --nodeps mariadb-server-5.5.35-3.el7.x86_64
4. 启动MYSQL
[root@bogon 桌面]# service mysql start
查看MySQL运行状态：
[root@bogon 桌面]# service mysql status
5. 默认root用户登录MYSQL
[root@bogon 桌面]# mysql -u root -p
(1) 停止MySQL服务
[root@bogon 桌面]# service mysql stop
6. 初始化MySQL及设置密码
cat /root/.mysql_secret  #查看root账号密码,密码动态生成
[root@localhost ~]# mysql -u root –p Y7Q3I2EEXf_fmHtT
mysql> SET PASSWORD = PASSWORD('123456');    #设置密码为123456
mysql> exit
[root@localhost ~]# mysql -u root -p 123456
7. 允许远程登陆
mysql> use mysql;
mysql> select host,user,password,password_expired from user;
mysql> update user set password=password('123!@#456') where user='root';
mysql> update user set host='%' where user='root' and host='localhost';
mysql> flush privileges;
mysql> exit
发现表中密码过期，密码过期状态（password_expired字段值）是否为Y，Y表示已过期，需要修改为N
8. 设置开机自启动
[root@localhost ~]# chkconfig mysql on
[root@localhost ~]# chkconfig --list | grep mysql
9. MySQL的默认安装位置
/var/lib/mysql/               #数据库目录
/usr/share/mysql              #配置文件目录
/usr/bin                     #相关命令目录
/etc/init.d/mysql              #启动脚本
10. 修改字符集和数据存储路径
在[client]下添加
default-character-set=utf8
在[mysqld]下添加
default-character-set=utf8（mysql 5.5 版本添加character-set-server=utf8）


配置/etc/my.cnf文件,修改数据存放路径、mysql.sock路径以及默认编码utf-8.
[client]
password        = 123456
port            = 3306
default-character-set=utf8
[mysqld]
port            = 3306
character_set_server=utf8
character_set_client=utf8
collation-server=utf8_general_ci
#(注意linux下mysql安装完后是默认：表名区分大小写，列名不区分大小写； 0：区分大小写，1：不区分大小写)
lower_case_table_names=1
#(设置最大连接数，默认为 151，MySQL服务器允许的最大连接数16384; )
max_connections=1000
11. 查看字符集
show variables like '%collation%';
show variables like '%char%';

12. 创建用户
例子：mysql>grant select,insert,update,delete,create,drop on test.hr to john@192.168.10.1 identified by '123';
说明：给主机为192.168.10.1的用户john分配可对数据库test的hr表进行select,insert,update,delete,create,drop等操作的权限，并设定口令为123。
mysql>grant all privileges on test.* to joe@192.168.10.1 identified by '123';
说明：给主机为192.168.10.1的用户john分配可对数据库test所有表进行所有操作的权限，并设定口令为123。
mysql>grant all privileges on *.* to john@192.168.10.1 identified by '123';
说明：给主机为192.168.10.1的用户john分配可对所有数据库的所有表进行所有操作的权限，并设定口令为123。
mysql>grant all privileges on *.* to john@localhost identified by '123';
说明：用户john分配可对所有数据库的所有表进行所有操作的权限，并设定口令为123。
完成用户的创建后，请记得刷新系统权限表；
mysql>flush privileges;
CREATE DATABASE `agency_db`  
CHARACTER SET 'utf8';
grant select,insert,update,delete,create,drop on agency_db.* to 'john'@'%' identified by '123!@#456';
update user set host='%' where user='john' and host='localhost';
//MySQL安装

//nginx
一、安装gcc-c++
# yum install -y gcc-c++

1.安装openssl-fips-2.0.2.tar.gz

[root@localhost mrms]# tar -zxvf openssl-fips-2.0.2.tar.gz 

[root@localhost mrms]# cd openssl-fips-2.0.2

[root@localhost openssl-fips-2.0.2]# ./config 

[root@localhost openssl-fips-2.0.2]# make

[root@localhost openssl-fips-2.0.2]# make install
2.安装zlib-1.2.7.tar.gz

[root@localhost mrms]# tar -zxvf zlib-1.2.7.tar.gz

[root@localhost mrms]# cd zlib-1.2.7

[root@localhost zlib-1.2.7]# ./configure 

[root@localhost zlib-1.2.7]# make

[root@localhost zlib-1.2.7]# make install
3.安装pcre-8.21.tar.gz

[root@localhost mrms]# tar -zxvf pcre-8.21.tar.gz

[root@localhost mrms]# cd pcre-8.21

[root@localhost pcre-8.21]# ./configure 

[root@localhost pcre-8.21]# make

[root@localhost pcre-8.21]# make install
 4.安装 nginx-1.2.6.tar.gz

[root@localhost mrms]# tar -zxvf nginx-1.2.6.tar.gz 

[root@localhost mrms]# cd nginx-1.2.6

[root@localhost nginx-1.2.6]# ./configure --with-pcre=../pcre-8.21 --with-zlib=../zlib-1.2.7 --with-openssl=../openssl-fips-2.0.2

[root@localhost nginx-1.2.6]# make

[root@localhost nginx-1.2.6]# make install
至此Nginx的安装完成!

第三步:检测是否安装成功

[root@localhost nginx-1.2.6]# cd  /usr/local/nginx/sbin

[root@localhost sbin]# ./nginx -t
出现如下所示提示,表示安装成功
第三步:检测是否安装成功

[root@localhost nginx-1.2.6]# cd  /usr/local/nginx/sbin

[root@localhost sbin]# ./nginx -t

启动nginx
[root@localhost sbin]# ./nginx
查看端口
[root@localhost sbin]# netstat -ntlp
# nginx -t
nginx: the configuration file /usr/local/etc/nginx/nginx.conf syntax is ok
nginx: configuration file /usr/local/etc/nginx/nginx.conf test is successful


首先执行命令找到nginx路径
ps aux | grep nginx
如nginx路径为
/usr/local/nginx/sbin/nginx

然后执行以下命令
/usr/local/nginx/sbin/nginx -V
默认放在 安装目录下 conf/nginx.conf
server {
    listen       8090;
    server_name  localhost;

    location ~ .*\.(gif|jpg|jpeg|png)$ {
        root   E:/files/images/;
    }

    access_log  E:/files/logs/log_access.log;
}
server {
    listen       8090;
    server_name  localhost;

    location ~ .*\.(gif|jpg|jpeg|png)$ {
        root   /data/files/images/;
    }

    #access_log /usr/nginx/logs/log_access.log;
}
nginx.exe -s reload
start nginx
//nginx

文件及目录的复制是经常要用到的。linux下进行复制的命令为cp。
假设复制源目录 为 dir1 ,目标目录为dir2。怎样才能将dir1下所有文件复制到dir2下了
如果dir2目录不存在，则可以直接使用
cp -r dir1 dir2
即可。
如果dir2目录已存在，则需要使用
cp -r dir1/. dir2
如果这时使用cp -r dir1 dir2,则也会将dir1目录复制到dir2中，明显不符合要求。

当我修改了/etc/profile文件，我想让它立刻生效，而不用重新登录；这时就想到用source命令，如:source /etc/profile

rm-rf目录名字

./shutdown.sh
./startup.sh

JAVA_HOME=/usr/java/jdk1.6.0_45
JRE_HOME=/usr/java/jdk1.6.0_45/jre
PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
export JAVA_HOME JRE_HOME PATH CLASSPATH

CATALINA_BASE=/usr/java/apache-tomcat-6.0.44
CATALINA_HOME=/usr/java/apache-tomcat-6.0.44
export CATALINA_BASE CATALINA_HOME

CATALINA_2_BASE=/usr/java/apache-tomcat-6.0.44-core
CATALINA_2_HOME=/usr/java/apache-tomcat-6.0.44-core
export CATALINA_2_BASE CATALINA_2_HOME

CATALINA_3_BASE=/usr/java/apache-tomcat-6.0.44-web
CATALINA_3_HOME=/usr/java/apache-tomcat-6.0.44-web
export CATALINA_3_BASE CATALINA_3_HOME

TOMCAT_HOME=/usr/java/apache-tomcat-6.0.44
export TOMCAT_HOME
TOMCAT_2_HOME=/usr/java/apache-tomcat-6.0.44-core
export TOMCAT_2_HOME
TOMCAT_3_HOME=/usr/java/apache-tomcat-6.0.44-web
export TOMCAT_3_HOME


export JAVA_HOME=/usr/java/jdk1.6.0_45
export JRE_HOME=/usr/java/jdk1.6.0_45/jre
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
export CATALINA_HOME=$CATALINA_2_HOME
export CATALINA_BASE=$CATALINA_2_BASE

export JAVA_HOME=/usr/java/jdk1.6.0_45
export JRE_HOME=/usr/java/jdk1.6.0_45/jre
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
export CATALINA_HOME=$CATALINA_3_HOME
export CATALINA_BASE=$CATALINA_3_BASE

Choose unique values for the 'webAppRootKey' context-param in your web.xml files!

//java
<c:forEach var="data" items="${faces}">
Agency.map.put('${data.key}', '${data.value}');
</c:forEach>
Map<Integer, String> map = new HashMap<Integer, String>();  
map.put(1, "One");  
map.put(2, "Two");  
<c:out value="${map[1]}"/>
无法取到值。换成
Map<Long, String> map = new HashMap<Long, String>();  
map.put(1L, "One");
即正常。
原因是JSTL默认把数字封装成Long类型。
另一个问题：类型转换

Map<Long, String> map = new HashMap<Long, String>();
${map[obj.id]}
 
obj.id定义为int类型时，无法取到值。需要将obj.id转为Long。
在jsp页面可以这样写${map[obj.id + 0]}
//java