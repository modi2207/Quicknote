<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="java.sql.*" %>
   
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>QuickNote</title>
    <!-- CSS of body -->
    <style>
        @keyframes hidePreloader {
            0% {
                width: 100%;
                height: 100%;
            }

            100% {
                width: 0;
                height: 0;
            }
        }

        body>div.preloader {
            position: fixed;
            background: white;
            width: 100%;
            height: 100%;
            z-index: 1071;
            opacity: 0;
            transition: opacity .5s ease;
            overflow: hidden;
            pointer-events: none;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        body:not(.loaded)>div.preloader {
            opacity: 1;
        }

        body:not(.loaded) {
            overflow: hidden;
        }

        body.loaded>div.preloader {
            animation: hidePreloader .5s linear .5s forwards;
        }
    </style>
    
    <!-- Favicon -->
    <link rel="icon" href="images/mark3.png" type="image/png"><!-- Font Awesome -->
    <!-- Quick CSS -->
    <link rel="stylesheet" href="CSS/quick-website.css" id="stylesheet">
</head>

<body>

	<!-- Nav bar -->
	<jsp:include page="Header.jsp" />  
	    
    <!-- Main content -->
    <section class="slice py-7">
        <div class="container">
            <div class="row row-grid align-items-center">
                <div class="col-12 col-md-5 col-lg-6 order-md-2 text-center">
                    <!-- Image -->
                    <figure class="w-100">
                        <img alt="Image placeholder" src="images/search.jpg"  class="img-fluid mw-md-120">
                    </figure>
                </div>
                <div class="col-12 col-md-7 col-lg-6 order-md-1 pr-md-5">
                    <!-- Heading -->
                    <h1 class="display-4 text-center text-md-left mb-3">
                       Search Here<br>
                    </h1>
                    <!-- Text -->
                    <p class="lead text-center text-md-left text-muted">
                        You can search a book of any subject by subject name & price
                    </p>
                    <!-- Buttons -->
                    <form action="Serach_filter.jsp">
                    <input type="text" name="bname" placeholder="Enter Book name" style="border-radius:15px; width:240px; outline:none;">
               &nbsp; &nbsp;     <select name="price" style="border-radius:15px; width:240px; outline:none; height:30px;">
						<option value="0">Select Price range</option>
						<option value="1">Below 100</option>
						<option value="2">100-500</option>
						<option value="3">500-1500</option>
						<option value="4">Above 1500</option>
					</select>
                    <div class="text-center text-md-left mt-5">
                       <input type="submit" class="btn-inner--text"  value="Search" style="background-color: blue; border:none; height:50px; width:70px; border-radius:15px;">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="slice slice-lg pt-lg-6 pb-0 pb-lg-6 bg-section-secondary">
        <div class="container">
            <!-- Title -->
            <!-- Section title -->
            <div class="row mb-5 justify-content-center text-center">
                <div class="col-lg-6">
                    <span class="badge badge-soft-success badge-pill badge-lg">
                        Get started
                    </span>
                    <h2 class=" mt-4">Recently Added Notes</h2>
                    <div class="mt-2">
                        <p class="lead lh-180">it shows recently added top notes.</p>
                    </div>
                </div>
            </div>
            <!-- Card -->
            <div class="row mt-5">
  <%
  
  
  try
  {
  	 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
  	 java.sql.Connection  con1=DriverManager.getConnection("jdbc:sqlserver://localhost;databaseName=quicknote","sa","chirag2207");
      
    String inst="select * from notes";

    Statement s = con1.createStatement();
    ResultSet rs = s.executeQuery(inst);
   	
  	
  	
    while(rs.next())
    { 
    	String img=rs.getString("img1");
    	int id=rs.getInt("noteid");
    	 %>
    	 
    	 
    	 <div class="col-md-4">
         <div class="card">
             <div class="card-body pb-5">
                 <div class="pt-4 pb-5">
                     <img src="images/<%=img %>" class="img-fluid img-center" style="height: 150px;" alt="Illustration" />
                 </div>
                 <h5 class="h4 lh-130 mb-3"><%=rs.getString("notename") %></h5>
                 <p class="text-muted mb-0"><%=rs.getString("category") %><br>Price : <%=rs.getInt("noteprice") %><br>Author : <%=rs.getString("author") %></p>
           <br>
              <a href='notedesc.jsp?nid=<%=id%>'> <input type="button" value="Show Details"> </a>
    	 
             </div>
         </div>
     </div>
       
     <%
   }
  
    
  }
  catch(Exception e)
  {
    System.out.println(e.getMessage());
  }
  %>
  

    
  
    
				<!-- card1 start-->
               
				<!-- card1 End -->

                <!-- add here -->
            </div>
        </div>
    </section>
    
    <!-- Footer  -->
    <jsp:include page="Footer.jsp" />  
	
        
</body>

</html>