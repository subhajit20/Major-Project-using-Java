<jsp:include page="/html/components/Header.jsp" />
<linl rel="stylesheet" href="style/home.css" />

<div id="screenLoader"  style="display: none">
    <jsp:include page="/html/ScreenLoader/Loader.jsp" />  
</div>

<div id="mainScreen" style="display: none" >
    <jsp:include page="/html/home/Navbar.jsp" /> 

    <jsp:include page="/html/home/Hero.jsp" />     

    <input type='hidden' id='email' value='<%= request.getAttribute("email") %>' />
    <input type='hidden' id='address' value='<%= request.getAttribute("address") %>' />
    <input type='hidden' id='phone' value='<%= request.getAttribute("phone") %>' />

    <jsp:include page="/html/home/Banner.jsp" /> 
    <jsp:include page="/html/category/CategoryItem.jsp" /> 
    <jsp:include page="/html/home/Sponsorship.jsp" />
    <jsp:include page="/html/home/Footer.jsp" />
    <jsp:include page="/html/SidebarCategory/index.jsp" />
    <jsp:include page="/html/CartSidebar/index.jsp" />
</div>


<script>
    const emailField = document.getElementById('email'); 
    const addressField = document.getElementById('address');
    const phonenoField = document.getElementById('phone');
    const screenLoader = document.getElementById('screenLoader');
    const mainScreen = document.getElementById('mainScreen')
    
    window.onload = ()=>{
        screenLoader.style.display = 'block';
        mainScreen.style.display = 'none'
        
        
        setTimeout(()=>{
            screenLoader.style.display = 'none';
            mainScreen.style.display = 'block'
        },3000)
    }
    
    if(emailField.value !== "null" && addressField.value !== "null" && phonenoField.value !== "null"){
        let user_Details = {
            email:emailField.value,
            address:addressField.value,
            phoneno:phonenoField.value
        };
        
        localStorage.setItem('user',JSON.stringify({user:user_Details}));
        loggedIn.style.display = 'block';
        auth.style.display = 'none'
        myEmail.innerHTML = emailField.value;
        myAddress.innerHTML = addressField.value; 
        myPhone.innerHTML = phonenoField.value;
        location.href = '/Major_Project';
    }if(user === '' || user === 'null' | user === null){
        console.log("Loggin Required!")
    }
</script>

<jsp:include page="/html/components/FooterComponent.jsp" />


    