<jsp:include page="../components/Header.jsp" />
<linl rel="stylesheet" href="style/home.css" />
<jsp:include page="../home/Navbar.jsp" /> 

<div class="container text-center">
  <div class="row">
    <div class="col">
        <img src='img/success.jpg' style='width: 500px;border-radius: 100%' />
        <h1>Your Order has successfully been placed</h1>
        <h1>Your Order ID - <%= request.getAttribute("orderId")  %></h1>
            <input type='hidden' value='<%= request.getAttribute("orderId")  %>' name='orderId' id='orderId' /> 
           <input type='hidden' value='<%= request.getAttribute("userEmail")  %>' name='userEmail' id='userEmail' />
           <input type='hidden' value='<%= request.getAttribute("userPhone")  %>' name='userPhone' id='userPhone' />
           <input type='hidden' value='<%= request.getAttribute("userAddress")  %>' name='userAddress' id='userAddress' />
           <input type='hidden' value='<%= request.getAttribute("service")  %>' name='service' id='service' />
           <input type='hidden' value='<%= request.getAttribute("totalAmount")  %>' name='totalAmount' id='totalAmount' />
           <input type='hidden' value='<%= request.getAttribute("orderDate")  %>' name='orderDate' id='orderDate' />
           <input type='hidden' value='<%= request.getAttribute("serviceDate")  %>' name='serviceDate' id='serviceDate' />
           <input type='hidden' value='<%= request.getAttribute("serviceTime")  %>' name='serviceTime' id='serviceTime' />
           <input type='hidden' value='<%= request.getAttribute("totalOrder")  %>' name='totalOrder' id='totalOrder' />

        <a><button type="button" class="btn btn-warning p-2" style='font-size: 1.2rem;font: bolder'>Go To Order Page</button></a>
    </div>
  </div>
</div>
        
        <script>
//            localStorage.setItem('cart',JSON.stringify({cart:[]}));
            const orders = localStorage.getItem('orders');
            const fields = ["orderId","userEmail","userPhone","userAddress","service","totalAmount","orderDate","serviceDate","serviceTime","totalOrder"];
            
            
            if(orders === null || orders === 'null' || orders === ''){
                localStorage.setItem('orders',JSON.stringify({orders:[]}))
            }else{
                console.log("Orders data already exist...")
            }
            
            const fetchOrderDetails = () =>{
                let orderInfo = {}
                for(let i of fields){
                    orderInfo[i] = document.getElementById(i).value;
                }
                
                return orderInfo;
            }   
            
            const storeOrder = () =>{
                const myOrders = localStorage.getItem('orders');
                
                if(myOrders !== null || myOrders !== 'null' || myOrders !== ''){
                    console.log(myOrders)
                    const {orders} = JSON.parse(myOrders);
                    const orderInfo = fetchOrderDetails();
                    console.log(orderInfo)
                    orders.push(orderInfo)
//                    
                    localStorage.setItem('orders',JSON.stringify({orders:[...orders]}))
                }
            }
            if(isLoggedin() !== false){
                storeOrder();
            }
            
        </script>
<jsp:include page="../SidebarCategory/index.jsp" />
<jsp:include page="../CartSidebar/index.jsp" />

<jsp:include page="../components/FooterComponent.jsp" />