<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style/signup.css" />
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    </head>
    <body>
    
    <input type="hidden" id="status" value="<%= request.getAttribute("status") %>" >
        
        <div class="container">
    <div class="title">Registration</div>
    <div class="content">
      <form action="http://localhost:8080/Major_Project/signup" method="post">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Full Name</span>
            <input type="text" name="tbName" placeholder="Enter your name" required>
          </div>
          <div class="input-box">
            <span class="details">Address</span>
            <input type="text" name="tbAdd" placeholder="Enter your City" required>
          </div>
          <div class="input-box">
            <span class="details">Email</span>
            <input type="text" name="tbEmail" placeholder="Enter your email" required>
          </div>
          <div class="input-box">
            <span class="details">Phone Number</span>
            <input type="number" name="tbPh" placeholder="Enter your number" required>
          </div>
          <div class="input-box">
            <span class="details">Password</span>
            <input type="password" name="tbPass" placeholder="Enter your password" required>
          </div>
          <div class="input-box">
            <span class="details">Confirm Password</span>
            <input type="password" name="tbCPass" placeholder="Confirm your password" required>
          </div>
        </div>
        <div class="gender-details">
            <input type="radio" name="rbGender" id="dot-1" value="MALE">
            <input type="radio" name="rbGender" id="dot-2" value="FEMALE">
            <input type="radio" name="rbGender" id="dot-3" value="UNKNOWN">
          <span class="gender-title">Gender</span>
          <div class="category">
            <label for="dot-1">
            <span class="dot one"></span>
            <span class="gender">Male</span>
          </label>
          <label for="dot-2">
            <span class="dot two"></span>
            <span class="gender">Female</span>
          </label>
          <label for="dot-3">
            <span class="dot three"></span>
            <span class="gender">Prefer not to say</span>
            </label>
          </div>
        </div>
        <div class="button" >
            <input type="submit" value="Register" id="signup" name="signup" >
        </div>

          <div class="login-link">
               Already a Member? <a href="/Major_Project/login">Login Now</a>
            </div>
      </form>
    </div>
  </div>
    </body>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
    <script type="text/javascript">
        var status= document.getElementById("status").value;
        if ( status == "success")
        {
            swal("Data Updated");
        }
        else
        {
            swal("User already exist");
        }
        </script>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    
</html>
