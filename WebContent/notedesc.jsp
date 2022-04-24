<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
  
    <link rel="stylesheet" href="CSS/swiper.min.css" />
    <link rel="stylesheet" href="CSS/easyzoom.css" />
    <link rel="stylesheet" href="CSS/main.css" />
   
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
   
   <link rel="stylesheet" href="CSS/quick-website.css" id="stylesheet">  
    
	
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
	   

    <div class="container">

        <table >

            <tr>
                <td>
                    <div class="product__carousel">
                        <div class="gallery-parent">
                            <!-- SwiperJs and EasyZoom plugins start -->
                            <div class="swiper-container gallery-top" style="width: 500px;height: 500px;  border-width: 2px; border-color: rgb(112, 110, 110); border-radius: 10px; padding:10px; background-color: rgb(255, 255, 255); box-shadow: 0 0 10px rgb(191, 197, 197); ">
                                <div class="swiper-wrapper" >
                                    <div class="swiper-slide easyzoom easyzoom--overlay">
                                        <a href='images/<%=rs.getString("img1") %>'>
                                        <img src="images/<%=rs.getString("img1") %>" alt="" />
                                        </a>
                                    </div>
                                    <div class="swiper-slide easyzoom easyzoom--overlay">
                                        <a href='images/<%=rs.getString("img2") %>'>
                                        <img src="images/<%=rs.getString("img2") %>" alt="" />
                                        </a>
                                    </div>
                                    <div class="swiper-slide easyzoom easyzoom--overlay">
                                        <a href='images/<%=rs.getString("img3") %>'>
                                        <img src="images/<%=rs.getString("img3") %>" alt="" />
                                        </a>
                                    </div>
                                </div>
                                <!-- Add Arrows -->
                                <div class="swiper-button-next swiper-button-white"></div>
                                <div class="swiper-button-prev swiper-button-white"></div>
                            </div>
                            
                            <div class="swiper-container gallery-thumbs" style="margin-top:30px;">
                                <div class="swiper-wrapper">
                                    <div class="swiper-slide"  style="border-radius: 10px; ">
                                        <img src="images/<%=rs.getString("img1") %>" alt="" />
                                    </div>
                                    <div class="swiper-slide"  style="border-radius: 10px;">
                                        <img src="images/<%=rs.getString("img2") %>" alt="" />
                                    </div>
                                    <div class="swiper-slide"  style="border-radius: 10px;">
                                        <img src="images/<%=rs.getString("img3") %>" alt="" />
                                    </div>
                                </div>
                            </div>
                            <!-- SwiperJs and EasyZoom plugins end -->
                        </div>
                    </div>
                </td>

                <td >
                    <div class="container" style="padding-top: 50px; margin-left: 5px;height: 790px;width: 600px;">
                        <div class="card" style="border-width: 2px;border-radius: 10px;width:600px;height:670px;">

                            <div class="card-body pb-1" style="margin-left: 2%;">
                        
                        		<h3> <%=rs.getString("notename")%></h3>
                        		
                                   <p class="text-muted mb-0">Author</p>
                                   <p class="text-muted mb-1"><%=rs.getString("author") %></p>
                                   
                                   <h4 >Rs. <%=rs.getInt("noteprice") %> /-</h4>
                                   
                                   <p class="text-muted mb-2">Category: </p>
                                   <p class="text-muted mb-3"><%=rs.getString("category") %></p>
                                   
                                   <h5>
                                   	Description
                                   </h5>
                                   <p class="text-muted mb-2"><%=rs.getString("discription") %> </p>
                                   
                                   <div class="text-center text-md-left mt-5">
				                        <a href="proceed.jsp?nid=<%=nid%>" class="btn btn-primary btn-icon" style="width: 500px;">
				                            <span class="btn-inner--text">Buy Now</span>
				                            <span class="btn-inner--icon"><i data-feather="chevron-right"></i></span>
				                        </a>
				                 
				                    </div>
        		
                            </div>
                        </div>
                        
                    </div>
                </td>
            </tr>
        </table>
        
    </div>
    
    <%
		}
		catch(Exception e)
		{
			
		}
    %>
    
    <!-- Footer  -->
    <jsp:include page="Footer.jsp" />  
	
     
  
    
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="js/swiper.min.js"></script>
    <script src="js/easyzoom.js"></script>
    <script src="js/main.js"></script>
 
</body>
</html>