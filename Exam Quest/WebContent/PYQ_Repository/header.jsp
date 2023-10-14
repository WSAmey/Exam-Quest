<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Sofia+Sans+Semi+Condensed:ital,wght@0,400;0,700;0,800;1,300;1,500;1,900&display=swap" rel="stylesheet">    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<title>Admin Header</title>

<head>


<style>

body{
	margin: 0;
	padding: 0;
	background-color: whitesmoke;
}

ul{
        padding: 0;
        list-style: none;
        background: white;
        text-align: center;
    }
    ul li{
        display: inline-block;
        position: relative;
        line-height: 21px;
        text-align: left;
    }

    ul li a{
        display: block;
        padding: 14px 25px;
        color: #36454F;
        text-decoration: none;
        font-weight: 1000;
        font-size: larger;
        @import url('https://fonts.googleapis.com/css2?family=Sofia+Sans+Semi+Condensed:ital,wght@0,400;0,700;0,800;1,300;1,900&display=swap');
		font-family: 'Sofia Sans Semi Condensed', sans-serif;		   	
		}
    ul li a:hover{
     	padding: 14px 25px;
        color: blueviolet;
		background-color: #D3D3D3;
    }
    ul li ul.dropdown{
        min-width: 100%; /* Set width of the dropdown */
        background: #f2f2f2;
        display: none;
        position: absolute;
        z-index: 999;
        left: 0;
    }
    ul li:hover ul.dropdown{
        display: block;	/* Display the dropdown */
    }
    ul li ul.dropdown li{
        display: block;
    }
    i{
    	    color: #708090;
    }
    marquee{
			background-color: #007eff;
			color: white;
			height: 31px;
			
	}
</style>
</head>
<body>
<%
String fname=(String)session.getAttribute("fname");
String lname=(String)session.getAttribute("lname");
String uname=(String)session.getAttribute("uname");
String email=(String)session.getAttribute("email");
String pass=(String)session.getAttribute("pass");
session.setAttribute("uname",uname);

%>
    <marquee direction="left" height="35px" onmouseover="this.stop();"
			onmouseout="this.start();" >
    <p style="font-weight: 600;padding-top: 6px;padding-bottom: 6px;">** <i class='far fa-envelope' style="color: white;"></i> <a href="https://mail.google.com/mail/?view=cm&fs=1&to=ameysw54@gmail.com&to=help@pyq.com&su=Regarding Help" target="_blank" style="text-decoration: none; color: white;">help@pyq.com</a> for any help regarding any missing university paper or any paper link not working **</p> 
    
			
		</marquee> 
<!-- As a heading -->
<nav class="navbar navbar-light bg-secondary">
  <div class="container-fluid "  style=" background:#007eff;margin-top:-8px; margin-bottom: -8px;padding-top: 6px;padding-bottom: 6px;">
    <span class="navbar-brand mb-0 h1 fs-2" style="color: white;font-weight: 900;font-size: larger;@import url('https://fonts.googleapis.com/css2?family=Sofia+Sans+Semi+Condensed:ital,wght@0,400;0,700;0,800;1,300;1,900&display=swap');
		font-family: 'Sofia Sans Semi Condensed', sans-serif;	"><a href="index.jsp" style="text-decoration: none;color:white;">Exam Quest</a></span>
    <span class="navbar-brand mb-0 h1 fs-4" style="color: white;font-weight: 900;font-size: larger;margin-left: 724px;font-family: 'Sofia Sans Semi Condensed', sans-serif;	">
		
		 <% 
		
			out.println(fname+" "+lname); 
	%></span>
    <span class="navbar-brand mb-0 h1 fs-4" style="color: white;font-weight: 900;font-size: larger;margin-top:-1px; font-family: 'Sofia Sans Semi Condensed', sans-serif;margin-right: 6px;">
		
		 <% 
			out.println(email); 
	%></span>
		

  </div>
</nav>

<ul>
        <li>
        	<a href="index.jsp">Home</a>
        </li>
		<li><a href="viewAboutUs.jsp">About Us </a></li>
		<%
	
			if(uname.equals("Admin")){
		%>
           <li>
        	<a href="viewUsers.jsp">Users</a> <!--  how many students using the System-->
        </li>
        <li>
            <a href="#">Universities &#9662; </a>
            <ul class="dropdown">

			<li><a href="addUniversity.jsp" class="smalltext">Add </a></li>
            <li><a href="viewUniversity.jsp" class="smalltext">View </a></li>              
            </ul>
        </li>
        <li>
            <a href="#">Paper Link &#9662;</a>
            <ul class="dropdown">
			<li><a href="addSubject.jsp"class="smalltext">Add </a></li>
            <li><a href="viewSubject.jsp" class="smalltext">View </a></li>              
            </ul>
        </li>
        <li>
            <a href="#">Broadcast &#9662;</a>
            <ul class="dropdown">
			<li><a href="addBroadcast.jsp"class="smalltext">Add </a></li>
            <li><a href="viewBroadcast.jsp" class="smalltext">View </a></li>              
            </ul>
        </li>
      
        <li>
        	<a href="viewContactUs.jsp">Paper Requests</a> <!--  helpers will send the paper details through contact us form and Admin can see their details-->
        </li>

        <%
			}
		
		else{
			
        %>
				<li>
		            <a href="viewPapers.jsp?flag=header">Question papers</a>
		           
        		</li>
        		
        		<li>
        	<a href="addContactUs.jsp">Contact Us</a> <!--  helpers will send the paper details through contact us form and Admin can see their details-->
        </li>
   		<% 
			}
   		%>
   		        <li><a href="resetPass.jsp?flag=header">Reset Password</a></li>
        <li><a href="login.jsp?flag=logout">Logout</a></li>
    </ul>

</body>
