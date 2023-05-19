<jsp:include page="/html/components/Header.jsp" />
<linl rel="stylesheet" href="style/home.css" />
<jsp:include page="/html/home/Navbar.jsp" /> 


<jsp:include page="/html/home/Hero.jsp" />     

<input type='hidden' id='email' value='<%= request.getAttribute("email") %>' />


<jsp:include page="/html/home/Banner.jsp" /> 
<jsp:include page="/html/category/CategoryItem.jsp" /> 
<jsp:include page="/html/home/Footer.jsp" />
<jsp:include page="/html/SidebarCategory/index.jsp" />
<jsp:include page="/html/CartSidebar/index.jsp" />



<script>
    const emailField = document.getElementById('email')
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
    console.log(emailField.value === "null")
    
     if(emailField.value !== "null"){
         location.href = '/Major_Project'
         localStorage.setItem('user_email',emailField.value)
         emailPlaceHolder.innerHTML = emailField.value;
         auth.style.display = "none";
         loggedIn.style.display = "block";
     }if(userEmail !== null || userEmail !== 'null' || userEmail !== ''){
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
<jsp:include page="/html/components/FooterComponent.jsp" />


    