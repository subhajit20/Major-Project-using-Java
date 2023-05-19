<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="style/login.css">
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    </head>
    <body>
        <input type="hidden" id="status" value="<%= request.getAttribute("status") %>" >
        <div class="wrapper">
         <div class="title">
            Login Form
         </div>
            <form action="http://localhost:8080/Major_Project/login" method="post" >
            <div class="field">
                <input type="text" id="email" name="tbemail" required >
               <label>Email Address</label>
            </div>
            <div class="field">
                <input type="password" name="tbpass" required>
               <label>Password</label>
            </div>
            <div class="content">
               <div class="pass-link">
                  <a href="/Major_Project/forgotPassword">Forgot password?</a>
               </div>
            </div>
                
            <div class="field">
               <input type="submit" id="loginBtn" value="Login">
            </div>
            <div class="signup-link">
               Not a member? <a href="/Major_Project/signup">Signup now</a>
            </div>
         </form>
      </div>
        
<!--        <script src="js/login.js"></script>-->
    </body>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="alert/dist/sweetalert.css">
    <script type="text/javascript">
        var status= document.getElementById("status").value;
        if ( status == "failed")
        {
            swal("Wronng Email or Password!!Try again");
        }
        </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

</html>