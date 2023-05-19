<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Company Name</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Category
          </a>
          <ul class="dropdown-menu">
              <li><button class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#SalonCanvas" aria-controls="SalonCanvas">Saloon service</button></li>   
              <li><button class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#ElectricCanvas" aria-controls="ElectricCanvas">Electric service</button></li>     
              <li><button class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#CleanerCanvas" aria-controls="CleanerCanvas">Cleaner service</button></li>       
              <li><button class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#PlumberCanvas" aria-controls="PlumberCanvas">Plumber service</button></li>
          </ul>
        </li>
      </ul>
      <div class="d-flex gap-2">
          <button class="btn" type="button" data-bs-toggle="offcanvas" data-bs-target="#CartSidebar" aria-controls="CartSidebar"><i class="fa-solid fa-cart-shopping" style="font-size: 1.3rem"></i></button>
        <div id='auth'>
            <a href="/Major_Project/signup"><button type="button" class="btn btn-warning">Signup</button></a>
            <a href="/Major_Project/login"><button class="btn btn-outline-success" type="submit">Login</button></a>
        </div>
        <div class="dropdown" id='loggedIn' style="display: none" style="margin-right: 2rem">
            <a class="btn btn-secondary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <i class="fa-solid fa-user"></i> 
            </a>

            <ul class="dropdown-menu "   style="left :-100px">
              <li><a class="dropdown-item" id='userEmail' ></a></li>
              <li><a class="dropdown-item" id='logout' href="#">Log Out</a></li>
            </ul>
          </div>
          
      </form>
    </div>
  </div>
</nav>

<script>
    const userEmail = localStorage.getItem('user_email');
    const emailPlaceHolder = document.getElementById('userEmail')
    let auth = document.getElementById("auth");
    let loggedIn = document.getElementById("loggedIn");
    const logout = document.getElementById("logout")

    logout.addEventListener('click',(e)=>{
        console.log(userEmail)
        localStorage.setItem("user_email",'');
        localStorage.setItem("isLoggedIn",'');

        location.reload();
        location.href = '/Major_Project/login';
        auth.style.display = "block";
        loggedIn.style.display = "none";

    })
//    console.log(emailField.value === "null")
    
    if(userEmail !== null || userEmail !== 'null' || userEmail !== ''){
         console.log(userEmail)
         emailPlaceHolder.innerHTML = userEmail;
         auth.style.display = "none";
         loggedIn.style.display = "block";
     }if(userEmail === '' || userEmail === 'null'){
         console.log("Nulllllll");
         auth.style.display = "block";
         loggedIn.style.display = "none";
     }
</script>
