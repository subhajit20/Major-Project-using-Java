<h1 style="text-align: center;margin-top: 1.3rem">Your Carts</h1>

<table class="table" style="height: 500px;overflow-y: scroll;">
  <thead>
    <tr  style="font-size:2.4rem;">
      <th scope="col">Category</th>
      <th scope="col">Order Date</th>
      <th scope="col">Service</th>  
      <th scope="col">Service Date</th> 
      <th scope="col">Price</th>
    </tr>
  </thead>
  <tbody id="orderTable" style="font-size:1.3rem">
    
  </tbody>
</table>

<div class="container text-center" style="display: fixed">
  <div class="row">
    <div class="col">
        <form action="http://localhost:8080/Major_Project/Order" method="post">
           <input type='hidden' value='' name='orderId' id='orderId' /> 
           <input type='hidden' value='' name='userEmail' id='userEmail' />
           <input type='hidden' value='' name='userPhone' id='userPhone' />
           <input type='hidden' value='' name='userAddress' id='userAddress' />
           <input type='hidden' value='' name='service' id='service' />
           <input type='hidden' value='' name='totalAmount' id='totalAmount' />
           <input type='hidden' value='' name='orderDate' id='orderDate' />
           <input type='hidden' value='' name='serviceDate' id='serviceDate' />
           <input type='hidden' value='' name='serviceTime' id='serviceTime' />
           <input type='hidden' value='' name='totalOrder' id='totalOrder' />
           
          <button class="btn btn-warning" type='submit'  style="width: 100%;font-size: 1.3rem;font:bold" id='buy'>Buy Now</button>
        </form>
    </div>
      <div class="col" id='priePlaceHolder' style="font-size: 1.5rem;font: 900">
    </div>
  </div>
</div>

<script>
    const fields = ["orderId","userEmail","userPhone","userAddress","service","totalAmount","orderDate","serviceDate","serviceTime","totalOrder"]
    const orderTable = document.getElementById('orderTable');
    const priePlaceHolder = document.getElementById('priePlaceHolder')
    const allField = new Map();
    //
    const orderEmail = document.getElementById('orderEmail')
    
    const buy = document.getElementById('buy');
    
    const randomIdGenerator = () =>{
        let uniqueNum = '';
        let alphabets = [ 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z' ]

        const SalonCartBtn = document.getElementById("SalonCartBtn");
        for(let i=0; i<= 7; i++){
            uniqueNum += alphabets[Math.floor(Math.random()*25)] + Math.floor(Math.random()*26)
        }
        
        return uniqueNum;
    }
    
    const fetchALlInputField = () =>{
        for(let i of fields){
            const elemet = document.getElementById(i)
            allField.set(i,elemet);
        }
    }
    fetchALlInputField()
    
    
    let html = '';
    let totalPrice = 0;
    let totalOrder = 0;
    let service = [];
    let serviceTime = '';
    let serviceDate = '';
    let orderDate = ''

    if(isLoggedin() !== false){
        const cart = localStorage.getItem('cart');
        if(cart){
            const {cart:myCart} = JSON.parse(cart);
            if(myCart.length > 0){
                const {user} = isLoggedin();
                for(let c of myCart){
                    html += '<tr>'
                    html += '<th>'+c.Category+'</th>'
                    html += '<th>'+c.orderDate+'</th>' 
                    html += '<th>'+c.service+'</th>'
                    html += '<th>'+c.serviceDate+'</th>'   
                    html += '<th>'+c.price+'</th>'   
                    html += '</tr>'
                    
                    totalPrice += parseInt(c.price);
                    totalOrder += 1;
                    
                    service.push(c.service);
                    serviceDate = c.serviceDate;
                    serviceTime = c.serviceTime;
                    orderDate =   c.orderDate;
                }
                
                orderTable.innerHTML = html;
                priePlaceHolder.innerHTML = 'Total Amount : '+totalPrice;
                
                allField.get('orderId').value = randomIdGenerator();
                allField.get('userEmail').value = user.email; 
                allField.get('userPhone').value = user.phoneno;
                allField.get('userAddress').value = user.address; 
                
                allField.get('service').value = JSON.stringify(service);
                allField.get('totalAmount').value = totalPrice;
                allField.get('orderDate').value = orderDate
                allField.get('serviceDate').value = serviceDate
                allField.get('serviceTime').value = serviceTime
                allField.get('totalOrder').value = totalOrder  
                
            }
            
            

                   
        }
    }else{
        console.log("Login required for placing order...")
    }
   
</script>