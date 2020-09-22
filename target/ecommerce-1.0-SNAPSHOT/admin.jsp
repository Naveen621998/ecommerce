<%@page import="java.util.Map"%>
<%@page import="com.learn.ecommerce.helper.Helper"%>
<%@page import="com.learn.ecommerce.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.ecommerce.dao.CategoryDao"%>
<%@page import="com.learn.ecommerce.helper.FactoryProvider"%>
<%@page import="com.learn.ecommerce.entities.User" %>
<%
User user=(User)session.getAttribute("current-user");
if(user==null)
{
    session.setAttribute("message","You are not logged in!! Login First");
    response.sendRedirect("login.jsp");
    return;
}
else
{
 if(user.getUserType().equals("normal"))
 {
   session.setAttribute("message","You are not admin ! Not allowed to access this page");
   response.sendRedirect("login.jsp");
   return;
 }
}
%>
 <% 
    CategoryDao cdao1=new CategoryDao(FactoryProvider.getFactory());
    List<Category> list=cdao1.getCategories();
    
  //getting count
  Map<String,Long> m=Helper.getCounts(FactoryProvider.getFactory());
 %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Panel</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
        <div class="container admin">
            
            <div class="container-fluid mt-3">
                <%@include file="components/message.jsp" %>
            </div>
            <div class="row mt-3">
                <!--First col-->
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width:125px;" class="img-fluid rounded-circle" src="img/team.png" alt="user_icon">
                            </div>
                            <h1><%=m.get("userCount")%></h1>
                            <h1 class="text-uppercase text-muted">Users</h1>
                        </div>
                    </div>    
                </div>
                <!--Second col-->
                 <div class="col-md-4">
                   <div class="card">
                        <div class="card-body text-center">
                             <div class="container">
                                <img style="max-width:125px;" class="img-fluid rounded-circle" src="img/list.png" alt="categories_icon">
                            </div>
                            <h1><%=list.size()%></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>      
                </div>
                <!--Third col-->
                 <div class="col-md-4">
                  <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width:125px;" class="img-fluid rounded-circle" src="img/gift.png" alt="product_icon">
                            </div>
                            <h1><%=m.get("productCount")%></h1>
                            <h1 class="text-uppercase text-muted">Products</h1>
                        </div>
                    </div>       
                </div>
            </div>
            <!--Second Row-->
            <div class="row mt-3">
                <!--First row-->
                <div class="col-md-6">
                   <!--Second row First Column-->
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                             <div class="container">
                                <img style="max-width:125px;" class="img-fluid rounded-circle" src="img/img.png" alt="addcategories_icon">
                            </div>
                            <p class="mt-2">Click here to add new category</p>
                            <h1 class="text-uppercase text-muted">Add Categories</h1>
                        </div>
                    </div>         
                </div>
                <!--Second row-->
                <div class="col-md-6">
                    <!--Second row Second Column-->
                    <div class="card" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body text-center">
                             <div class="container">
                                <img style="max-width:125px;" class="img-fluid rounded-circle" src="img/plus.png" alt="addproduct_icon">
                            </div>
                            <p class="mt-2">Click here to add new product</p>
                            <h1 class="text-uppercase text-muted">Add Product</h1>
                        </div>
                    </div>          
                </div>
            </div>
        </div>
        <!--Add Category Modal-->
        <!-- Modal -->
         <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg" role="document">
             <div class="modal-content">
             <div class="modal-header custom-bg text-white">
                 <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                 <span aria-hidden="true">&times;</span>
                 </button>
             </div>
             <div class="modal-body">
                 <form action="ProductOperationServlet" method="post">
                     <input type="hidden" name="operation" value="addcategory">
                     <div class="form-group">
                         <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required>
                     </div>
                     <div class="form-group">
                         <textarea  style="height:200px" class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>  
                     </div>
                     
                     <div class="container text-center">
                         <button class="btn btn-outline-success" >Add Category</button>
                         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                     </div>
                 </form>
             </div>
             </div>
         </div>
         </div>
        <!--End add category modal-->
        
         <!--Add Product Modal-->
        <!-- Modal -->
         <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
         <div class="modal-dialog modal-lg" role="document">
             <div class="modal-content">
             <div class="modal-header custom-bg text-white">
                 <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                 <span aria-hidden="true">&times;</span>
                 </button>
             </div>
             <div class="modal-body">
                 <!--Start Form-->
                 <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                     <input type="hidden" name="operation" value="addproduct"/>
                     <!--Product Title-->
                     <div class="form-group">
                         <input type="text" class="form-control" name="pName" placeholder="Enter title of product" required>
                     </div>
                     <!--Product Description-->
                     <div class="form-group">
                         <textarea style="height:120px;"  class="form-control" placeholder="Enter product description" name="pDesc"></textarea>
                     </div>
                     <!--Product Price-->
                     <div class="form-group">
                         <input type="number" class="form-control" name="pPrice" placeholder="Enter price of product" required>
                     </div>
                     <!--Discount-->
                     <div class="form-group">
                         <input type="number" class="form-control" name="pDiscount" placeholder="Enter product discount" required>
                     </div>
                     <!--Product quantity-->
                     <div class="form-group">
                         <input type="number" class="form-control" name="pQuantity" placeholder="Enter product quantity" required>
                     </div>
                     <!--Product Categories-->
                    
                     <div class="form-group">
                         <select name="catId" class="form-control">
                             <%
                             for(Category c:list){
                             %>
                             <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
                             <%}%>
                             
                         </select>
                     </div>
                     <!--Product File-->
                     <div class="form-group">
                         <label for="pPic">Select Picture of Product</label><br/>
                         <input type="file"  id="pPic" name="pPic" required/>
                     </div>
                     <!--Submit Product Details-->
                     <div class="container text-center">
                         <button class="btn btn-outline-success" >Add Product</button>
                         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                     </div>
                 </form>
                 <!--End Form-->
             </div>
             </div>
         </div>
         </div>
        <!--End add product modal-->
        <%@include file="components/common_modals.jsp"%>
    </body>
</html>
