<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Dashboard</title>
	<link rel="icon" type="image/x-icon" href="images/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css" type="text/css">
    <link rel="stylesheet" href="navbarAndFooter.css" type="text/css">
    <link rel="stylesheet" href="bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="userDashboard.css">
</head>
<body>
	<section id="top">
        <div class="container  text-center " style="margin-top: 10%; margin-bottom: 3%;">
            <img src="./ImagePutter" class=" user-img-top rounded-circle img-fluid" style="height: 10%; width: 10%;">
            <p>Welcome to the User Dashboard</p>
            <h1>${userName}</h1>
            <button type="button" class="btn btn-warning rounded-3">Edit Profile</button>
        </div>
        <div class="container-fluid text-center" id="booking" style="background-color:#1899B6; ">
            <p style="line-height: 2;">Booking</p>
        </div>
    </section>
    <script src="bootstrap.bundle.min.js"></script>
</body>
</html>