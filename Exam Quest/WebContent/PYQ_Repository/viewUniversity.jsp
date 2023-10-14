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
<title>University</title>
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
    <h3 style="color: white;margin-left: 14px;">Registered Universities</h3>
  </div>
</div>
	<div class="count_container">
		<div class="count1">
		
		<p class="p1">&#10148; Total Registered Universities: 
		<%
			ResultSet r1=st.executeQuery("select count(*) as rowcount from university");
		r1.next();
		out.println(r1.getInt("rowcount"));
		%>
		</p>
		</div>

	</div>
<!--  Total number of users-->
<!--  Total number of users recently registered-->
	
<div class="table_box">
	<p class="box_p"></p>
	<table class="table" style="width: 98.6%;background-color: white;margin-left: 9px;">
	  <thead>
	    <tr>
	      <th scope="col" width="40%">University</th>
	      <th scope="col" width="40%">Address</th>
	      <th scope="col" width="20%">Registration Date</th>
	      
	    </tr>
	  </thead>
	  <tbody>

	    
	<%
	
	
	
	ResultSet r=st.executeQuery("SELECT univname,address,DATE(entrydate) FROM university ORDER BY uid DESC");
	
	
		if(r.next()!=false){
		do{ %>
	    <tr>
	     <td><%out.println(r.getString("univname")); %></td>
	     <td><%out.println(r.getString("address")); %></td>
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