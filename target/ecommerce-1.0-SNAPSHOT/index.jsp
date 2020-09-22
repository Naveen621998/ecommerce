<%-- 
    Document   : index
    Created on : Sep 15, 2020, 9:49:22 AM
    Author     : naveen singh
--%>

<%@page import="com.learn.ecommerce.helper.Helper"%>
<%@page import="com.learn.ecommerce.entities.Category"%>
<%@page import="com.learn.ecommerce.dao.CategoryDao"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.ecommerce.entities.Product"%>
<%@page import="com.learn.ecommerce.dao.ProductDao"%>
<%@page import="com.learn.ecommerce.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ecommerce-Home</title>
        <%@include file="components/common_css_js.jsp"%>
    </head>
    <body>
        <%@include file="components/navbar.jsp"%>
         <div class="container-fluid">
        <div class="row mt-3 mx-2">
            <%
            String cat=request.getParameter("category");
          
            ProductDao dao=new ProductDao(FactoryProvider.getFactory());
            List<Product> list=null;
            if(cat==null||cat.trim().equals("all"))
            {
             list=dao.getAllProducts();
            }else{
             int cid=Integer.parseInt(cat.trim());
             list=dao.getAllProductsById(cid);
            }
            %>
            <!--Show Categories-->
             <div id="categories" class="col-md-2">
                <div class="list-group mt-4">
              <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">All Products</a>
                <%
                  for(Category c:clist)
                  {%>
                    <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
                 <%}
                %>  
            </div>
            </div>
            <!--Show Products-->
             <div class="col-md-10">
                <!--row-->
                <div class="row mt-4">
                    <!--col:12-->
                    <div class="col-md-12">
                        
                        <div class="card-columns">
                            <!--traversing Products-->
                            <%
                              for(Product p:list){
                            %>  
                               <!--Product Card-->
                                <div class="card product-card">
                                <div class="container text-center">
                                <img class="card-img-top m-2" src="img/products/<%=p.getpPhoto()%>" style="max-height:200px; max-width:100%; width:auto" alt="...">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title"><%=p.getpName()%></h5>
                                    <p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>
                                </div>
                                <div class="card-footer">
                                    <button class="btn custom-bg text-white" onclick="add_to_cart('<%=p.getpId()%>','<%=p.getpName()%>','<%=p.getPriceAfterApplyingDiscount()%>')">Add to Cart</button>  
                                    <button class="btn btn-outline-success">&#x20B9;<%=p.getPriceAfterApplyingDiscount()%>/- <span class="text-secondary discount-label">&#x20B9;<%=p.getpPrice()%>,<%=p.getpDiscount()%>%off</span></button>  
                                </div>
                                
                                </div>
                            <% 
                             }  
                            if(list.size()==0)
                             {
                              out.println("<h3>No items in this category</h3>");
                             } 
                            %>
                      </div> 
               
                 </div>
                </div>
            </div>            
        </div> 
     </div>
        <%@include file="components/common_modals.jsp"%>             
    </body>
</html>
