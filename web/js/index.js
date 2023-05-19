let email = document.getElementById("email");
let auth = document.getElementById("auth");
let loggedIn = document.getElementById("loggedIn");
const userEmail = document.getElementById("userEmail");
const logout = document.getElementById("logout")
let isEmailExist = localStorage.getItem("user_email");
let flag = localStorage.getItem("isLoggedIn");


if(flag === null || isEmailExist === null){
    localStorage.setItem('user_email',''); 
    localStorage.setItem('isLoggedIn','');
}

/**
 * Authentication Functinality
 */
export const isLoggedIn = () =>{
    if(isEmailExist === "" && flag === ""){
        console.log("User is Not Logged in");
        return false;
    }else{
        return true;
    }
}

if(email.value !== "null"){
    localStorage.setItem("user_email",email.value);
    localStorage.setItem("isLoggedIn",true);

    userEmail.innerHTML = email.value;
    auth.style.display = "none";
    loggedIn.style.display = "block";
    
}else{
    console.log("Please Go and Login yourself...")
}

/**
 * Logout Functionality
 */
logout.addEventListener('click',(e)=>{
    if(isLoggedIn() && flag){
        localStorage.setItem("user_email",'');
        localStorage.setItem("isLoggedIn",'');

        location.reload();
        auth.style.display = "block";
        loggedIn.style.display = "none";
    }
})
