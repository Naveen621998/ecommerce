<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New User</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body> 
  <%@include file="components/navbar.jsp"%>
  <div class="container-fluid">
   <div class="row mt-5">
  <div class="col-md-4 offset-md-4">
      <div class="card">
          <%@include file="components/message.jsp" %>
      <div class="card-body px-5 custom-bg" >
          <div class="text-center"><i class="fas fa-user-plus"></i><div>
       <h3 class="text-center my-3 text-white">Sign Up Here!!</h3>
       <form action="RegisterServlet" method="post">
  <div class="form-group text-white">
  <label for="name">User Name</label>
  <input type="text" class="form-control" id="name" name="user_name" placeholder="Enter your name">
  </div>
  <div class="form-group text-white">
  <label for="email">User Email</label>
  <input type="email" class="form-control" id="email" name="user_email" placeholder="Enter your email">
  </div>        
  <div class="form-group text-white">
  <label for="password">User Password</label>
  <input type="password" class="form-control" id="password" name="user_password" placeholder="Enter your password">
  </div>        
  <div class="form-group text-white">
  <label for="phone">User Phone</label>
  <input type="number" class="form-control" id="phone" name="user_phone" placeholder="Enter your phone number">
  </div>        
  <div class="form-group text-white">
  <label for="address">User Address</label>
  <textarea style="height: 100px" class="form-control" name="user_address" placeholder="Enter your address"></textarea>
  </div> 
  <div class="container text-center">
      <button class="btn btn-outline-success text-white">Register</button>       
      <button class="btn btn-outline-warning text-white">Reset</button>       
  </div>
  </form>    
  </div> 
  </div>        
  </div>
  </div>
  </div>
  </body>
</html>
