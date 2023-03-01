<--------------------- Some things to keep in mind before testing the web site--------------------------->


1. first must execute the dump sql files before starting the web site otherwise the web site will not run. 
   You cam simply import the 'dump' folder in mySql workbench and run that.

2. Professionals and User tables are populated with data and when you run the sql code from dump that data 
   will also available at your database.

3. you can obviously add new professional and customer from signup page.

4. You can fire report. And admin will get that report to solve that in admin dash board.

5. Admin Dashboard email and password for login is 'hsaadmin@gmail.com', '@1234#'.

6. Forget password field is not secure as it will just require the registered email and phone number associated 
   with that email to open the change password portal.
   
7. change the username and password in the 'DbConnection.java' class from 'com.hsa.connection.util' package.
