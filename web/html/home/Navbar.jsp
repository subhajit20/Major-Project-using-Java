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
              <li><a class="dropdown-item" id='myEmail' ></a></li> 
              <li><a class="dropdown-item" id='myAddress' ></a></li>
              <li><a class="dropdown-item" id='myPhone' ></a></li>

              <li><a class="dropdown-item" id='logout' href="#">Log Out</a></li>
            </ul>
          </div>
          
      </form>
    </div>
  </div>
</nav>

<script>
    
    
    const user = localStorage.getItem('user');
    const myEmail = document.getElementById('myEmail') 
    const myAddress = document.getElementById('myAddress')
    const myPhone = document.getElementById('myPhone')

    let auth = document.getElementById("auth");
    let loggedIn = document.getElementById("loggedIn");
    const logout = document.getElementById("logout");
    
    const isLoggedin = () =>{
        const user = localStorage.getItem('user');
        
        if(user !== 'null' || user !== '' || user !== null){
            return JSON.parse(user);
        }else{
            return false;
        }
    }

    logout.addEventListener('click',(e)=>{
        localStorage.setItem("user",'');

        location.reload();
        auth.style.display = "block";
        loggedIn.style.display = "none";
        location.href = '/Major_Project/login';

    })
//    console.log(emailField.value === "null")
    
    if(user !== null || user !== 'null' || user !== ''){
        let {user:userData} = JSON.parse(user)
        loggedIn.style.display = 'block';
        auth.style.display = 'none'
        myEmail.innerHTML = userData.email;
        myAddress.innerHTML = userData.address; 
        myPhone.innerHTML = userData.phoneno;
     }if(user === '' || user === 'null' || user == null){
         console.log("Login Required");
         auth.style.display = "block";
         loggedIn.style.display = "none";
     }
     
     
     
    
</script>
