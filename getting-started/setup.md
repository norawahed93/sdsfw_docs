# Setup

> [!NOTE]
> Let's assume that we will store all our projects in `C:/Projects`

## Library

Checkout the libraries from <svn://10.17.100.38/libs>  
The libraries used by the framework should be placed in `C:/Projects/libs`.  

## New Project 

Checkout the framework from <svn://10.17.100.38/java_training> into your Project folder. e.g. `C:/Projects/sdsfw`.

**Directory Structure**
- `src/`
	- `config/` - Configuration files are stored in here.
	- `main/` - All the java source code will be stored under this folder.
	- `sql/` - This is where we should keep the SQL files for easy reference.
- `web/` - This folder contains all the public resources (JSP files, CSS/JS libraries, images, etc).

## Database
Next, we need to setup the database structure for the framework. Run the following script according to the database type that you want to use. The script will setup the default data for the framework, with sample pages & settings. It also creates an admin user account that we can use for system administration later.

**MySQL** - <a href="/sdsfw_docs/downloads/db-setup-mysql.sql">/downloads/db-setup-mysql.sql</a>  
**MSSQL** - Coming soon! <!-- <a href="/downloads/db-setup-mssql.sql">/downloads/db-setup-mssql.sql</a> -->  
**Oracle** - Coming soon! <!-- <a href="/downloads/db-setup-oracle.sql">/downloads/db-setup-oracle.sql</a> --> 

### Database Connection

The database connection can be configured in `hibernate.cfg.xml`. The default configuration is connecting to the mysql server for training purposes. If you have configured your own database, change the settings to connect to your database.

```xml
<!-- Sample configurations -->

<!-- MySQL -->
<property name="hibernate.connection.driver_class">com.mysql.cj.jdbc.Driver</property>
<property name="hibernate.connection.url">jdbc:mysql://10.17.101.219:3306/sdsfw?useSSL=false&amp;serverTimezone=Asia/Kuala_Lumpur</property>
<property name="hibernate.connection.username">root</property>
<property name="hibernate.connection.password"></property>

<!-- MSSQL -->
<property name="hibernate.connection.driver_class">com.microsoft.sqlserver.jdbc.SQLServerDriver</property>
<property name="hibernate.connection.url">jdbc:sqlserver://localhost;databaseName=sdsfw;integratedSecurity=true</property>
<property name="hibernate.connection.username">root</property>
<property name="hibernate.connection.password"></property>

<!-- Oracle -->
<property name="hibernate.connection.driver_class">oracle.jdbc.driver.OracleDriver</property>
<property name="hibernate.connection.url">jdbc:oracle:thin:@localhost:1521:SDSFW</property>
<property name="hibernate.connection.username">root</property> 
<property name="hibernate.connection.password"></property>
```

Did you notice that the `password` property is empty? Don't worry, you can put a fake password here to make it harder for attacker to get access to your database.

The real password should be set in `SessionFactoryImpl.java` in `init()` function.

```java
String a, b, c = "";
a = "1iux1tvn1vfx1sar1xfn1xff1saj1vgx1tvf1irp";
b = "1hv81wu81wu61vno1w1c1san1w261vne1wu81wu61hsa";
c = "1v2j1uum1xtv1zej1zer1xtn1uvk1v1v";
a = str(a);b = str(b);c = str(c);
// config.setProperty(a+b+c, str("1wn71ri71vgv1xtv1kqv1ktz1xtn1vfz1ri71wmz"));
config.setProperty(a+b+c, "re@lPas$w0rd");
```

### Database Configuration

If using `Oracle Database`, set `CommonFunction.isOracleDB = Boolean.TRUE`.

## Run Project

Now, try and run the project. You should be able to see the login page. Login with below credentials:

**User ID:** admin  
**Password:** password

After login, you will see the default dashboard with the system administration menu on the left side. These are all the default settings, you can change / add on these settings later. Additionally, there is a Sample module that contains some examples to get you started. Go ahead and explore these modules, or you can continue to the next chapter.