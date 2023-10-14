<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form Demo</title>
<style>


	.table_box{
		width: 80%;
		margin-top: 6px;
		background-color: #003cffb3;
		margin-left: auto;
		margin-right: auto;
		border-radius: 7px; 	
		padding-bottom: 1px;
	}
	.box_p{
		  padding-top: 7px;
    	  margin-left: 11px;
    	  margin-bottom: 7px;
    	  font-weight: 700;
    	  color: white;
	}
</style>
</head>

<body>
	
	    	<div>
		<div class="card" style="margin-left: auto;margin-right: auto; width: 80%;">
  <div class="card-body" style="background-color: #0080ff;padding: 2px;">
    <h3 style="color: white;margin-left: 14px;">Papers</h3>
  </div>
</div>
<br>

<div class="table_box">
	<p class="box_p"></p>
	<table class="table" style="width: 98.6%;background-color: white;margin-left: 9px;">
	  <thead>
	    <tr>
	      <th scope="col">University</th>
<!-- 	      <th scope="col">Branch</th>
 -->	      <th scope="col">Subject Name</th>
	      <th scope="col" style="text-align: center;">Subject Code</th>
	      <th scope="col">Semester</th>
	      <th scope="col" style="text-align: center;">Session</th>
	      <th scope="col" style="text-align: center;">Year of Exam</th>
	      <th scope="col">Download Link</th>
	      
	    </tr>
	  </thead>
	  <tbody>

	    	<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pyqdb","root","root");
	Statement st = con.createStatement();
	    		 
	    		ResultSet r = st.executeQuery("SELECT * FROM subject ORDER BY univname,branch desc");
	    		
	    		 
	    		if (r.next() != false) {
	    			do {
	    	%>

	    <tr>
			<th scope="col"><%out.println(r.getString("branch")); %>	
			</th>
	     <td><%out.println(r.getString("univname")); %></td>
<%-- 	     <td><%out.println(r.getString("branch")); %></td>
 --%>	     <td><%out.println(r.getString("subname")); %></td>
	     <td style="text-align: center;"><%out.println(r.getString("subcode")); %></td>
	     <td style="text-align: center;"><%out.println(r.getString("sem")); %></td>
	     <td><%out.println(r.getString("sess")); %></td>
	     <td style="text-align: center;"><%out.println(r.getString("examyear")); %></td>
	     <td style="width: 9%"><div class="btn" style="padding:7px;background-color: red;"><a href="<%= r.getString("link") %>" style="text-decoration: none; color: white;font-weight:500" target="_blank">Click Here</a> </div></td>
	     
	    </tr>
	    <%}while(r.next());
		}
	    		else{
					%>		
					</tbody>
					</table>
					
					</div>
				<div class="alert alert-danger" role="alert" style="margin-left: auto;margin-right: auto;width: 90%;margin-top: 5px;">
						 No Papers Found!
			</div>
				</div>	<%
					}
						con.close();
						st.close();
						r.close();
					%>		
</body>
</html>