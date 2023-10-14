<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
    <%@page import="java.time.LocalDate"%>
    
        <%@page import="java.util.Date,java.text.SimpleDateFormat,java.text.ParseException" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Requested Papers</title>
<style>

	.table_box{
		width: 85%;
		margin-top: 6px;
		background-color: #003cffb3;
		margin-left: auto;
		margin-right: auto;
		border-radius: 7px; 	
}
	.box_p{
		  padding-top: 7px;
    	  margin-left: 11px;
    	  margin-bottom: 7px;
    	  font-weight: 700;
    	  color: white;
	}
	.count_container{
		display: flex;
	    margin-left: 111px;
	    margin-top: 34px;
	    margin-bottom: -16px;
	}
	.p1{
		color: #ff4200;
    font-size: larger;
    font-weight: 700;
	}
	.a_container{
		background-color: dodgerblue;
	    padding: 12px;
	    border-radius: 8px;
	}
	.a_link{
		
	    text-decoration: none;
	    color: white;
	    text-align: center;
	    margin-left: 21px;
		
	}
</style>
</head>
<body>
	<%@ include file="header.jsp"  %>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pyqdb","root","root");
Statement st = con.createStatement();
%>

		<div class="card" style="margin-left: auto;margin-right: auto;width:90%;">
  <div class="card-body" style="background-color: #0080ff;padding: 2px;">
    <h3 style="color: white;margin-left: 14px;">Requested papers</h3>
  </div>
</div>

	<br>
<div class="table_box">
	<p class="box_p"></p>
	<table class="table" style="width: 98.6%;background-color: white;margin-left: 9px;">
	  <thead>
	    <tr>
	      <th scope="col" width="20%">Student Name</th>
	      <th scope="col" width="20%">Student Email</th>
	      <th scope="col" width="40%">Student Message</th>
	      <th scope="col" width="10%">Date</th>
	      <th scope="col" width="20%" >Reply Student</th>
	      
	    </tr>
	  </thead>
	  <tbody>

	    
	<%
	
	
	
	ResultSet r=st.executeQuery("SELECT cname,email,message,date(entrydate) FROM contactus ORDER BY cid DESC");
	
	
		if(r.next()!=false){
		do{ %>
	    <tr>
	     <td><%out.println(r.getString("cname")); %></td>
	     <td><%out.println(r.getString("email")); %></td>
	     <td><%out.println(r.getString("message")); %></td>
	     <td><%out.println(r.getString("date(entrydate)")); %></td>
	     <td><div class="a_container" ><a class="a_link" style="color:white;" href="https://mail.google.com/mail/?view=cm&fs=1&to=<%=r.getString("email")%>&su=Regarding Your Question Paper Request&body=Hi <%=r.getString("cname")%>, %0D%0DThe paper you have requested will be soon uploaded on our website, please check our website on regular basis.%0D%0DRegards pyq@help" target="_blank" style="text-decoration: none; color: black;">Mail <i class='far fa-envelope' style="color: white;"></i></a> 
	    </div></td>
	    </tr>
	    <%}while(r.next());
		}
					r.close();
					con.close();
					st.close();
				%>		
	  </tbody>
	
	</table>
	<p style="padding-bottom: 1px;"></p>
	</div> 
	
</body>
</html>