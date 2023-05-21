<!-- saloon -->
<!-- plumber -->
    <h1 style="text-align: center">Our Categories</h1>
</div>
<div class="container text-center mt-5 mb-5" data-aos="fade-right">
  <div class="row">
    <div class="col">
      <jsp:include page="../electrician/ElectricianCard.jsp" /> 
    </div>
    <div class="col" data-aos="fade-left">
      <jsp:include page="../Cleaner/CleanerCard.jsp" /> 
    </div>
    <div class="col" data-aos="fade-up-right">
      <jsp:include page="../plumber/PlumberCard.jsp" />
    </div>
     <div class="col" data-aos="fade-up-left">
          <!-- saloon -->
           <jsp:include page="../Salon/SalonCard.jsp" />
     </div>
  </div>
</div>
<script>
    const categoryButton = document.querySelector('.categoryButton'); 
    const categoryBtn = document.querySelectorAll('.categoryBtn');
    
    
    const loggedInUser = localStorage.getItem('user');

    if(loggedInUser === '' || loggedInUser === null || loggedInUser === 'null'){
        for(let a of categoryBtn){
            a.href = 'http://localhost:8080/Major_Project/login'
        }
    }
</script>