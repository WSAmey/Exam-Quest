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

<title>View Subject Paper</title>
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
	form, input {
	margin-left: 76px;
    width: 270%;
    margin-bottom: 10px;
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
    <h3 style="color: white;margin-left: 14px;">University Exam Papers</h3>
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
	
	<form action="viewSubject.jsp">

		<div class="col-md-4" style="background-color: white;">
			  <input type="text"
				class="form-control" id="search"
				placeholder="&#128269; Search By Subject Name or University Name..." name="search"
				>
			<div class="input-group-append"></div>

		</div>
	</form>
<div class="table_box">
	<p class="box_p"></p>
	<table class="table" style="width: 98.6%;background-color: white;margin-left: 9px;">
	  <thead>
	    <tr>
	      <th scope="col">University</th>
	      <th scope="col">Branch</th>
	      <th scope="col">Subject Name</th>
	      <th scope="col" style="text-align: center;">Subject Code</th>
	      <th scope="col">Semester</th>
	      <th scope="col" style="text-align: center;">Session</th>
	      <th scope="col" style="text-align: center;">Year of Exam</th>
	      <th scope="col" style="text-align: center;">Upload Date</th>
	      <th scope="col">Paper Link</th>
	      <th scope="col">Action</th>
	      
	    </tr>
	  </thead>
	  <tbody>

	    
	<%
	    		String search = request.getParameter("search");
	    		
	    		//ResultSet r = st.executeQuery("SELECT univname,subname,subcode,branch,sem,sess,year,DATE(entrydate),link FROM subject where subname like '%"+search+"%' or univname like'%"+search+"%' ORDER BY sid DESC");
	    		ResultSet r = st.executeQuery("SELECT univname,subname,subcode,branch,sem,sess,examyear,DATE(entrydate),link FROM subject ORDER BY sid DESC");
	    		if (search != null) {

	    			r=st.executeQuery("SELECT sid,univname,subname,subcode,branch,sem,sess,examyear,DATE(entrydate),link FROM subject where subname like '%"+search+"%' or univname like'%"+search+"%' ORDER BY sid DESC");
					//*Note:- also select id column along with other columns in sql database table else it will throw sql error that bid not found in update button

	    		} else {
	    			r=st.executeQuery("SELECT sid,univname,subname,subcode,branch,sem,sess,examyear,DATE(entrydate),link FROM subject ORDER BY sid DESC");
	    		} 
	    		if (r.next() != false) {
	    			do {
	    	%>
	    <tr>
	     <td><%out.println(r.getString("univname")); %></td>
	     <td><%out.println(r.getString("branch")); %></td>
	     <td><%out.println(r.getString("subname")); %></td>
	     <td style="text-align: center;"><%out.println(r.getString("subcode")); %></td>
	     <td style="text-align: center;"><%out.println(r.getString("sem")); %></td>
	     <td><%out.println(r.getString("sess")); %></td>
	     <td style="text-align: center;"><%out.println(r.getString("examyear")); %></td>
	     <td><%out.println(r.getString("date(entrydate)")); %></td>
	     <td style="width: 9%"><div class="btn" style="padding:7px;background-color: red;"><a href="<%= r.getString("link") %>" style="text-decoration: none; color: white;font-weight:500" target="_blank">Test Link</a> </div></td>
	     
	    <td><button type="button"  class="btn btn-success" style="width: 100%;font-weight: 500;text-align: center;" onclick="window.location.href='updateSubjectForm.jsp?id=<%=r.getInt("sid")%>&univname=<%=r.getString("univname")%>&subname=<%=r.getString("subname")%>&subcode=<%=r.getString("subcode")%>&branch=<%=r.getString("branch")%>&sess=<%=r.getString("sess")%>&sem=<%=r.getString("sem")%>&year=<%=r.getString("examyear")%>&link=<%=r.getString("link")%>';">Update
				</button> </td> 
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
	<br>
<%@include file="footer.jsp" %>
</body>
</html>