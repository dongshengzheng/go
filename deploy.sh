#!/usr/bin/env bash#!/usr/bin/env bash
# 关闭tomcat
ps -ef |grep tomcat |grep -v grep |awk '{print $2}'|xargs kill 9
# 删除代码
rm -rf /opt/tomcat/webapps/site/ROOT
rm -rf /opt/tomcat/webapps/admin/ROOT
rm -rf /opt/tomcat/webapps/weixin/ROOT
# 在目录/root/workspace/jsdd 执行
git pull origin master
mvn clean install
# move site, admin & weixin
cd /opt/tomcat/webapps/
cp /root/workspace/jsdd/site/target/site.war  .
cp /root/workspace/jsdd/admin/target/admin.war  .
cp /root/workspace/jsdd/weixin/target/weixin.war  .
unzip site.war -d site/ROOT
unzip admin.war -d admin/ROOT
unzip weixin.war -d weixin/ROOT
rm site.war
rm admin.war
rm weixin.war
# cp properties/db connection info
cp /opt/override/override.properties /opt/tomcat/webapps/weixin/ROOT/WEB-INF/classes/override.properties
cp /opt/override/wx.properties /opt/tomcat/webapps/weixin/ROOT/WEB-INF/classes/wx.properties
cp /opt/override/override.properties /opt/tomcat/webapps/site/ROOT/WEB-INF/classes/override.properties
cp /opt/override/override.properties /opt/tomcat/webapps/admin/ROOT/WEB-INF/classes/override.properties
sh /opt/tomcat/bin/startup.sh

