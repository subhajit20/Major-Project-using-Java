<jsp:include page="../components/Header.jsp" />
<linl rel="stylesheet" href="style/home.css" />
<jsp:include page="../home/Navbar.jsp" /> 


<div class="container text-center">
  <div class="row">
    <div class="col">
        <img src='img/cross.jpg' style='width: 500px;border-radius: 100%' />
        <h1><%= request.getAttribute("Failed")  %></h1>
        <h3>Kindly Retry</h3>
        <a><button type="button" class="btn btn-danger p-2" style='font-size: 1.2rem;font: bolder'>Go To Order Page</button></a>
    </div>
  </div>
</div>
 
<jsp:include page="../SidebarCategory/index.jsp" />
<jsp:include page="../CartSidebar/index.jsp" />

<jsp:include page="../components/FooterComponent.jsp" />
