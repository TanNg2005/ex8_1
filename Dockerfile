# Dùng Tomcat 11 + JDK 21
FROM tomcat:11.0.10

# Xóa các app mặc định của Tomcat (tùy chọn, cho sạch)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR đã build sẵn từ thư mục target vào Tomcat
COPY ch08_ex1_email-1.0-SNAPSHOT.war ROOT.war

# Tomcat sẽ tự chạy khi container start
EXPOSE 8080
CMD ["catalina.sh", "run"]