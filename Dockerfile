# Dùng Tomcat 11 + JDK 21
FROM tomcat:11.0.10

# Xóa các app mặc định của Tomcat (tùy chọn)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR vào thư mục webapps của Tomcat với tên ROOT.war
COPY ch08_ex1_email-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]