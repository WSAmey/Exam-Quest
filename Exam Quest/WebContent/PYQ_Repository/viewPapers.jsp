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
		padding-bottom: 1px;
}
	.box_p{
		  padding-top: 7px;
    	  margin-left: 11px;
    	  margin-bottom: 7px;
    	  font-weight: 700;
    	  color: white;
	}

	.p1{
		color: #ff4200;
	    font-size: larger;
	    font-weight: 700;
	}
	.form_card{
		margin-top: 50px;
		width: 90%;
	    margin-left: auto;
	    margin-right: auto;
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
    <h3 style="color: white;margin-left: 14px;">University Previous year question papers</h3>
  </div>
</div>
<br>

	<div class="form_card">
<form action="viewPapers.jsp">
<input type="hidden" class="form-control" id="flag" name="flag" value="form">
		<div class="mb-3" style="width: 51%;">
				
      <select id="disabledSelect" class="form-select" name="uniname" style="float:left">
					<option value="all">-- Select University --</option>  <!-- Will display all papers -->
       <%	ResultSet runiv=st.executeQuery("select distinct univname from subject order by univname desc");
        while(runiv.next()) {%>
                    <option value="<%=runiv.getString("univname")%>"><%=runiv.getString("univname") %></option>
				<% }%>
      </select>
    </div>
		<div class="col-md-4" style="background-color: whitesmoke;width: 41%;margin-left: 712px;">
			  <input type="text" 
				class="form-control" id="search" 
				placeholder="&#128269; Search By Subject Name..." name="inputsearch">
		</div>
				
			  
				<div class="sbtn" style="margin-left: 1291px;margin-top: -37px;">
  			<button type="submit" style="font-weight: 700;font-size: medium;" class="btn btn-primary">Search</button>
				</div>
	</form>
	</div>
	
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
	      <th scope="col">Download Link</th>
	      
	    </tr>
	  </thead>
	  <tbody>

	    
	<%
	    	String flag = request.getParameter("flag");
	    	String inputsearch = request.getParameter("inputsearch");
	    		String uniname = request.getParameter("uniname");
	    		 System.out.println("input search: "+inputsearch + " uniname: "+uniname);
	    		 System.out.println("flag"+flag);
	    		
	    		 
	    		ResultSet r = st.executeQuery("SELECT * FROM subject ORDER BY univname,branch,examyear,sid desc");
	    		 
	    		if(flag.equals("header")){
		    		if (inputsearch == null ||  uniname==null) {
	
			    			r=st.executeQuery("SELECT * FROM subject ORDER BY univname,branch,examyear,sid desc");
	
		    		}  
	    		}
	    		else if(flag.equals("form") ){
	   
		    		
					if (uniname.equals("all") && inputsearch!=null) {
	
			    			r=st.executeQuery("SELECT * FROM subject where subname='"+inputsearch+"' ORDER BY univname,branch,examyear,sid desc");
	
		    		}  
		    		 if (inputsearch!=null && !uniname.equals("all")) {
	
			    			r=st.executeQuery("SELECT * FROM subject where subname='"+inputsearch+"'  and univname='"+uniname+"' ORDER BY univname,branch,examyear,sid desc");
	
		    		}  
		    		 if (uniname.equals("all") && inputsearch=="") {
	
			    			r=st.executeQuery("SELECT * FROM subject where univname='"+uniname+"' ORDER BY univname,branch,examyear,sid desc");
	
		    		}  
		    		
	    		}
	    		 else{
		    			r=st.executeQuery("SELECT * FROM subject ORDER BY univname,branch,examyear,sid desc");

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
					<%
					}
						con.close();
						st.close();
						r.close();
					%>

</body>
</html>