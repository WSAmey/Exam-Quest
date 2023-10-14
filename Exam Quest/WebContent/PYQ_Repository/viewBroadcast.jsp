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
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

<title>View Broadcast</title>
<style>
	body{
		overflow-x:hidden; 
	}
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
	    margin-left: 111px;
	    margin-top: 34px;
	    margin-bottom: -16px;
	}
	.p1{
		color: #ff4200;
    font-size: larger;
    font-weight: 700;
	}
	
.msg{
		color: green;
		text-align: center;
		background-color:whitesmoke;
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

		<div class="card" style="margin-left: auto;margin-right: auto; width: 90%;">
  <div class="card-body" style="background-color: #0080ff;padding: 2px;">
    <h3 style="color: white;margin-left: 14px;">Broadcast Messages</h3>
  </div>
</div>
<br>
<div class="msg"><h4>
<% 
	String msg=(String)session.getAttribute("updatemsg");
		
		if(msg==null){
			out.println();
		}
		else{
			out.println(msg);	
		}
		session.removeAttribute("updatemsg");
%>
	</h4></div>
	

<div class="table_box">
	<p class="box_p"></p>
	<table class="table" style="width: 98.6%;background-color: white;margin-left: 9px;">
	  <thead>
	    <tr>
	      <th scope="col">Update Description</th>
	      <th scope="col" style="text-align: center;">Update Date</th>
	      <th scope="col" style="text-align: center;">Action</th>
	      
	    </tr>
	  </thead>
	  <tbody>


				<%
					String search = request.getParameter("search");

							ResultSet r = st.executeQuery("SELECT bid,message,DATE(entrydate) FROM broadcast ORDER BY bid DESC"); 
							
					if (r.next() != false) {
						do {
				%>
				<tr>
					<td width="75%;">
						<%
							out.println(r.getString("message"));
						%>
					</td>
					<td style="text-align: center;">
						<%
							out.println(r.getString("date(entrydate)"));
						%>
					</td>
					<td style="text-align: center;"><button type="button"
							class="btn btn-success" style="width: 100%;font-size: large;font-weight: 600;"
							onclick="window.location.href='updateBroadcastForm.jsp?id=<%=r.getInt("bid")%>&desc=<%=r.getString("message")%>';">Update</button>
					</td>
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