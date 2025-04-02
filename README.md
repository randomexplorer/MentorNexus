# 🎓 MentorNexus - Educational Mentorship Platform

## 🚀 Quick Start in Codespace Terminal

1. **Setup Project Structure**
   ```bash
   # Create necessary directories
   mkdir -p src/main/webapp/WEB-INF

   # Copy web.xml to correct location
   cp web.xml src/main/webapp/WEB-INF/
   ```

2. **Install & Configure MySQL**
   ```bash
   # Install MySQL
   sudo apt update
   sudo apt install -y mysql-server

   # Start MySQL
   sudo service mysql start

   # Configure Database and User
   sudo mysql -e "CREATE DATABASE mentornexus;"
   sudo mysql -e "CREATE USER 'mentoruser'@'%' IDENTIFIED BY 'password';"
   sudo mysql -e "GRANT ALL PRIVILEGES ON mentornexus.* TO 'mentoruser'@'%';"
   sudo mysql -e "FLUSH PRIVILEGES;"
   ```

3. **Build & Run (Temporary Setup)**
   ```bash
   # Clean and package
   mvn clean package -DskipTests

   # Run using Tomcat plugin
   mvn tomcat7:run-war
   ```

4. **Access the Application**
   - Wait for Tomcat to start (you'll see "Server startup in [xxx] milliseconds")
   - Click "PORTS" tab in Codespaces
   - Find port 8080 and click the globe icon
   - The application will open in a new browser tab

## 🔑 Default Login Credentials

- **Admin:** admin@education.com / admin123
- **Mentor:** mentor@education.com / mentor123
- **Student:** student@education.com / student123

## 🛠️ Tech Stack

- Frontend: HTML, CSS, Bootstrap, JavaScript, JSP
- Backend: Java, Servlets, JDBC
- Database: MySQL
- Environment: GitHub Codespaces

## 💡 Key Features

- User registration and authentication
- Mentorship program management
- Blog system for educational articles
- Event management
- Appointment booking system
- Admin dashboard

## 👥 Contributors
- [Ish Jaiswal](https://github.com/ishjaiswal7)
- [Stuti Rajeev](https://github.com/thestutirajeev)
- [Barsha Routh](https://github.com/BarshaRouth)
- [Nidhi Tulsyan](https://github.com/NidhiTulsyan)
- [Shrishti Jalan](https://github.com/Srishti-jalan5)

## 📄 License
This project is open-source under the MIT License.
