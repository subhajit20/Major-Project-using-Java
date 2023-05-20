<div class="offcanvas offcanvas-end" tabindex="-1" id="CartSidebar" aria-labelledby="offcanvasRightLabel">
  <div class="offcanvas-body" >
      <p id="alert"></p>
      <div id="allCartItems">
          
      </div>
      <a href="/Major_Project/Order"><button type="button"  class="btn btn-warning mb-2" style="width: 100%;font-size:1.4rem;font: bold" >Go To Order Page</button></a>
  </div>
</div>

<script>
    const alert = document.getElementById("alert");
    
    const getCarts = () =>{
        const carts = localStorage.getItem('cart');
        if(carts){
            const {cart} = JSON.parse(carts);
            
            return cart;
        }
    }
    
    const updateCart = (items) =>{
        
        localStorage.setItem('cart',JSON.stringify({cart:[...items]}));
        window.alert("Cart is removed successfully...");
        
        
    }
    
    const allCartItems = document.getElementById("allCartItems");
    
    const deleteCart = (id) =>{
        let allcarts = getCarts();

        for(let carts of allcarts){
            if(id === carts.id){
                carts.isActive = false;
                break;
            }
        }
        
        const updatedItems =  allcarts.filter((items)=>{
            return items.isActive !== false;
        })
        alert.innerHTML = `<div class="alert alert-success" role="alert">
                            Cart is removed successfully...
                          </div>`;
        setTimeout(()=>{
            alert.innerHTML = ''
        },2000)
        updateCart(updatedItems);
        
    }
    
    
    
    const getCartItems = () =>{
        let allCarts;
        const allcart = localStorage.getItem('cart');
        if(allcart){
            const {cart} = JSON.parse(allcart);
            if(cart.length > 0){
                for(let c=0;c <= cart.length - 1; c++){
                    if(cart[c].isActive === true){   
                    
                        allCartItems.innerHTML += '<div  class="card">'
                        allCartItems.innerHTML += "<h2>Service : "+cart[c].service+"</h2>"
                        allCartItems.innerHTML += "<h4>Category - "+cart[c].Category+"</h4>"
                        allCartItems.innerHTML += "Order Date : "+cart[c].orderDate+"</h4></br>" 
                        allCartItems.innerHTML += "<h6>Price : "+cart[c].price+"</h6></br>"   

                        allCartItems.innerHTML += '<button type="button" onclick="deleteCart(this.id)" class="btn btn-primary mb-2" '+'id='+cart[c].id+'>Remove Cart</button>'
                        allCartItems.innerHTML += '</div>'

                        allCartItems.innerHTML += "</br></br>"
                    }

                }
                return cart;
            }else{
                return []
            }
            
        }else{
            return [];
        }
        
    }
    
    getCartItems();
    
    
//    allCartItems.innerHTML = content;
</script>