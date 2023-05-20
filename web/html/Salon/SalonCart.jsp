<div>
    <h2 style="text-align: center;margin: 1.3rem">Add That Item Into Cart</h2>
</div>


<div class="container">
    <h4>Select Service</h4>
    <p class="alert"></p>
    <div class="row">
        <div class="form-check col">
            <input class="form-check-input menSalon" name="Salon" value="men" type="radio" style="scale:1.3" name="flexRadioDefault" id="flexRadioDefault1">
            <label class="form-check-label" for="flexRadioDefault1" style="font-size: 1.3rem">
              Select Men Salon
            </label>
          </div>
         <div class="form-check col">
             <input class="form-check-input womenSalon" value="women"  name="Salon" type="radio"  style="scale:1.3" name="flexRadioDefault" id="flexRadioDefault2" checked>
           <label class="form-check-label" for="flexRadioDefault2"  style="font-size: 1.3rem">
             Select Women Salon
           </label>
         </div>
    </div>
    <div class="container dateTime" style="margin-top:  1.4rem">
         <label class="form-check-label " for="flexCheckChecked" style="font-size: 1.4rem">
        Select Date
        </label>
       <div class="form" style="margin-bottom: 1.2rem">
           <input type="date" class="date dateField" id="flexCheckChecked" style="width: 70%;padding: 1rem;border-radius: 20px;outline: none">
       </div>
       <label class="form-check-label " for="flexCheckChecked" style="font-size: 1.4rem">
           Select Time
        </label>
       <div class="form">
           <input type="time" class="date timeField" id="flexCheckChecked" style="width: 70%;padding: 1rem;border-radius: 20px;outline: none">
       </div>
    </div>
    <div class="spinner-border text-success" id="loader" role="status" style="display: none">
        <span class="visually-hidden">Loading...</span>
      </div>
    <div class="cartbutton" style="margin-top:  1.3rem">
        <button type="submit" id="SalonCartBtn" style="font-size: 1.5rem" class="btn btn-warning">ADD TO CART</button>
    </div>
</div>
<script>
    
    const randomIdGenerator = () =>{
        let uniqueNum = '';
        let alphabets = [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' ]

        const SalonCartBtn = document.getElementById("SalonCartBtn");
        for(let i=0; i<= 7; i++){
            uniqueNum += alphabets[Math.floor(Math.random()*25)] + Math.floor(Math.random()*26)
        }
        
        return uniqueNum;
    }
    /**
     * Input Fields
     */
    const womenSalon = document.querySelector('.womenSalon');   
    const menSalon = document.querySelector('.menSalon');  
    const dateField = document.querySelector('.dateField');
    const timeField = document.querySelector('.timeField');
    const loader = document.querySelector('#loader'); 
    const btnContainer = document.querySelector('.btnContainer');

    const alertMsg = document.querySelector('.alert');
    const SalonCartBtn = document.getElementById('SalonCartBtn');
    
    
    const getCart = () =>{
        const cart = localStorage.getItem('cart');
        
        return cart;
    }
    
    const validation = (user) =>{
        if(dateField.value === '' || timeField.value === ''){
            return {
                status:false,
                msg:"Invalid Inputs!"
            }
        }
        if(womenSalon.checked && dateField.value !== '' && timeField.value !== ''){
            if(timeField.value >= "10:00" && timeField.value <= "16:00"){
                return {
                    status:true,
                    data:{
                        id:randomIdGenerator(),
                        email:user.email,
                        serviceDate:dateField.value,
                        serviceTime:timeField.value,
                        orderDate:new Date().toLocaleDateString(),
                        Category:"Women",
                        isActive:true,
                        service:"Women Salon",
                        price:"300"
                    }
                }
            }else{
                return {
                    status:false,
                    msg:"Time should be 10:00-04:00"
                }
            }
            
        }else if(menSalon.checked && dateField !== '' && timeField !== ''){
            if(timeField.value >= "10:00" && timeField.value <= "16:00"){
                return {
                    status:true,
                    data:{
                        id:randomIdGenerator(),
                        email:user.email,
                        serviceDate:dateField.value,
                        serviceTime:timeField.value,
                        orderDate:new Date().toLocaleDateString(),
                        Category:"Men",
                        isActive:true,
                        service:"Men Salon",
                        price:"250"
                    }
                }
            }else{
                return {
                    status:false,
                    msg:"Time should be 10:00-04:00"
                }
            }
            
        }else{
            return {
                    status:false,
                    msg:"Something went wrong..."
                }
        }
    }
    
    SalonCartBtn.addEventListener('click',(e)=>{
        e.preventDefault()
        const myCart = getCart();
        
        if(isLoggedin() !== false){
            if(myCart === null){
                localStorage.setItem('cart',JSON.stringify({cart:[]}));
            }else{
                const {user} = isLoggedin();
                const data = validation(user);
                SalonCartBtn.style.display = 'none';
                
                if(data.status !== false){
                    const {cart} = JSON.parse(myCart);
                    cart.push({...data.data});
                    alertMsg.innerHTML = data.msg ;
                    
                    localStorage.setItem('cart',JSON.stringify({cart:[...cart]}));
                    
                    alertMsg.innerHTML = `<div class="alert alert-success" role="alert">
                                            Item added to the Cart!
                                          </div>`;
                    setTimeout(()=>{
                        SalonCartBtn.style.display = "block";
                        loader.style.display = 'none';
                        alertMsg.innerHTML = ''
                    },2000)
                }else{
                    alertMsg.innerHTML = '<div class="alert alert-danger" role="alert">'
                                            +data.msg+
                                          '</div>'
                    setTimeout(()=>{
                        SalonCartBtn.style.display = "block";
                        loader.style.display = 'none';
                        alertMsg.innerHTML = ''
                    },2000)
                }
            }
        }else{
            console.log("");
        }

    })
</script>
