<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	
	<!-- Favicon -->
	    <link rel="icon" href="images/mark3.png" type="image/png"><!-- Font Awesome -->
	   
	   <link rel="stylesheet" href="CSS/quick-website.css" id="stylesheet">  
	    
		
	<title>Payment</title>
	
</head>
<body>

	<!-- Nav bar -->
	<jsp:include page="Header.jsp" />  
	<%
	  	try
		{
	  		 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	  	  	 java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=quicknote","sa","chirag2207");
	  	    		
			  Statement s1=con1.createStatement();
			 int nid=Integer.parseInt(request.getParameter("nid"));
			 
			 ResultSet rs=s1.executeQuery("select *from notes where noteid="+nid);
			 rs.next();
			 
	   %>
	<div class="container" style="padding-top: 50px;">
	
		<form action="proceed">
		
			<div class="card" style="border-width: 2px;border-radius: 10px;width:1100px;">

                <div class="card-body pb-1" style="margin-left: 2%;">
                
                	<h2 style="color: red;">Invoice</h2>
                
                	<h3> <%=rs.getString("notename")%></h3>
                        		
                    <p class="text-muted mb-0">Author</p>
                    <p class="text-muted mb-1"><%=rs.getString("author") %></p>
                    
                    <h4 >Rs. <%=rs.getInt("noteprice") %> /-</h4>
                    
                    <p class="text-muted mb-2">Category: </p>
                    <p class="text-muted mb-3"><%=rs.getString("category") %></p>
                    
                    <div class="text-center text-md-left mt-5" style="padding-bottom: 50px;">
	                     <a href="Downloadd?nid=<%=rs.getString("pdf")%>" class="btn btn-primary btn-icon" style="width: 200px;">
	                         <span class="btn-inner--text">Pay Now</span>
	                         <span class="btn-inner--icon"><i data-feather="chevron-right"></i></span>
	                     </a>
	              
                 	</div>
                 
             	</div>
             	
            </div>

		
		</form>
	</div>
	
	<%
		}
		catch(Exception e)
		{
			
		}
    %>
    
	 <!-- Footer  -->
    <jsp:include page="Footer.jsp" />  
	

</body>
</html>