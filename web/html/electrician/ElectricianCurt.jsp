<div>
    <h2 style="text-align: center;margin: 1.3rem">Add That Item Into Cart</h2>
</div>

<div class="container">
    <h4>Select Service</h4>
    <p class="alert"></p>
    <div class="row">
        <div class="form-check col">
            <input class="form-check-input TvService" name="Service" value="Tv" type="radio" style="scale:1.3" name="flexRadioDefault" id="flexRadioDefault1">
            <label class="form-check-label" for="flexRadioDefault1" style="font-size: 1.3rem">
              Select Tv Service
            </label>
          </div>
         <div class="form-check col">
             <input class="form-check-input AcService" value="Ac"  name="Service" type="radio"  style="scale:1.3" name="flexRadioDefault" id="flexRadioDefault2" checked>
           <label class="form-check-label" for="flexRadioDefault2"  style="font-size: 1.3rem">
             Select Ac Service
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
        <button type="submit" id="ElectricianCartBtn" style="font-size: 1.5rem" class="btn btn-warning">ADD TO CART</button>
    </div>
</div>
<script>
    
    const ElectricianCartBtn = document.getElementById("ElectricianCartBtn");
    
    /**
     * Input Fields
     */
    const AcService = document.querySelector('.AcService');   
    const TvService = document.querySelector('.TvService');  
    const dateField = document.querySelector('.dateField');
    const timeField = document.querySelector('.timeField');
    const loader = document.querySelector('#loader'); 
    const btnContainer = document.querySelector('.btnContainer');

    const alertMsg = document.querySelector('.alert')
    
    const randomIdGenerator = () =>{
        let uniqueNum = '';
        let alphabets = [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' ]

        const SalonCartBtn = document.getElementById("SalonCartBtn");
        for(let i=0; i<= 7; i++){
            uniqueNum += alphabets[Math.floor(Math.random()*25)] + Math.floor(Math.random()*26)
        }
        
        return uniqueNum;
    }
    
    const isLoggedin = () =>{
        const user_email = localStorage.getItem('user_email');
        
        if(user_email !== 'null' || user_email !== ''){
            return user_email;
        }else{
            return false;
        }
    }
    
    const getCart = () =>{
        const cart = localStorage.getItem('cart');
        
        return cart;
    }
    
    const validation = (email) =>{
        console.log(AcService.checked,TvService.value,dateField.value,dateField.value,timeField.value);
        
        if(dateField.value === '' || timeField.value === ''){
            return {
                    status:false,
                    msg:"Invalid inputs"
                }
        }
        if(AcService.checked && dateField.value !== '' && timeField.value !== ''){
            if(timeField.value >= "10:00" && timeField.value <= "16:00"){
                return {
                    status:true,
                    data:{
                        id:randomIdGenerator(),
                        email:email,
                        orderDate:dateField.value,
                        orderTime:timeField.value,
                        isActive:true,
                        service:"Ac Service",
                        Category:"Electiician",
                        price:"3300"
                    }
                }
            }else{
                return {
                    status:true,
                    msg:"Time should be 10:00-04:00"
                }
            }
            
        }else if(TvService.checked && dateField !== '' && timeField !== ''){
            if(timeField.value >= "10:00" && timeField.value <= "16:00"){
                return {
                    status:true,
                    data:{
                        id:randomIdGenerator(),
                        email:email,
                        orderDate:dateField.value,
                        orderTime:timeField.value,
                        isActive:true,
                        service:"Tv Service",
                        Category:"Electiician",
                        price:"2800"
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
                    msg:"Time should be 10:00-04:00"
                }
        }
    }
    
   ElectricianCartBtn.addEventListener('click',(e)=>{
        e.preventDefault()
        const myCart = getCart();
        
        if(isLoggedin() !== false){
            if(myCart === null){
                localStorage.setItem('cart',JSON.stringify({cart:[]}));
            }else{
                const user = isLoggedin();
                const data = validation(user);
                ElectricianCartBtn.display = 'none';
                
                if(data.status !== false){
                    const {cart} = JSON.parse(myCart);
                    cart.push({...data.data});
                    alertMsg.innerHTML = data.msg ;
                    
                    localStorage.setItem('cart',JSON.stringify({cart:[...cart]}));
                    
                    alertMsg.innerHTML = `<div class="alert alert-success" role="alert">
                                            Item added to the Cart!
                                          </div>`;
                    setTimeout(()=>{
                        ElectricianCartBtn.style.display = "block";
                        loader.style.display = 'none';
                        alertMsg.innerHTML = ''
                    },2000)
                }else{
                    alertMsg.innerHTML = '<div class="alert alert-danger" role="alert">'
                                            +data.msg+
                                          '</div>'
                    setTimeout(()=>{
                        ElectricianCartBtn.style.display = "block";
                        loader.style.display = 'none';
                        alertMsg.innerHTML = ''
                    },2000)
                }
            }
        }else{
            alert('You are not logged in...')
        }

    })
</script>
