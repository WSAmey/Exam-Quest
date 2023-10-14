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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Users</title>
<style>

	.table_box{
		width: 90%;
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
	    margin-top: 34px;
	    margin-left: 75px;
	    margin-bottom: -16px;
	}
	.count2{
		margin-left: 779px;
	}
	.p1{
		color: #0d7eee;
    font-size: larger;
    font-weight: 700;
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
    <h3 style="color: white;margin-left: 14px;">Registered Users</h3>
  </div>
</div>
	<div class="count_container">
		<div class="count1">
		
		<p class="p1">&#10148; Total Users: 
		<%
			ResultSet r1=st.executeQuery("select count(*) as rowcount from register");
		r1.next();
		out.println(r1.getInt("rowcount"));
		%>
		</p>
		</div>
		<div class="count2">
		
		<p class="p1">&#10148; Recently Registered Users(in last 4 days): 
		<%
			ResultSet r2=st.executeQuery("SELECT COUNT(*) AS rowcount FROM register WHERE entrydate >= DATE_ADD(CURDATE(), INTERVAL '-3' DAY)");
		r2.next();
		out.println(r2.getInt("rowcount"));
		%>
		</p>
		</div>
	</div>
<!--  Total number of users-->
<!--  Total number of users recently registered-->
	
<div class="table_box">
	<p class="box_p"></p>
	<table class="table" style="width: 98.2%;background-color: white;margin-left: 9px;">
	  <thead>
	    <tr>
	      <th scope="col">First Name</th>
	      <th scope="col">Last Name</th>
	      <th scope="col">Email</th>
	      <th scope="col">User Name</th>
	      <th scope="col" style="width: 17%">Registration Date</th>
	    </tr>
	  </thead>
	  <tbody>

	    
	<%
	
	
	
	ResultSet r=st.executeQuery("SELECT fname,lname,email,uname,date(entrydate) FROM register ORDER BY rid DESC");;
	
	
		if(r.next()!=false){
		do{ %>
	    <tr>
	     <td width="20%"><%out.println(r.getString("fname")); %></td>
	     <td width="22%"><%out.println(r.getString("lname")); %></td>
	     <td width="27%"><%out.println(r.getString("email")); %></td>
	     <td width="19%"><%out.println(r.getString("uname")); %></td>
	     <td><%out.println(r.getString("date(entrydate)")); %></td>
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