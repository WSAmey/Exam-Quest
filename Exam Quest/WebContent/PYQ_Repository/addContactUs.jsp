<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact Us</title>

<style>
.main_container{
	   background-color: #5310bf;
	    padding-bottom: 50px;
	    padding-top: 50px;
}
.card_container{
	   display: flex;
	    width: 85%;
	    margin-left: auto;
	    margin-right: auto;
	    margin-top:auto;
	    margin-bottom:auto;
	    background-color: white;
	    padding: 50px;
	    border-radius: 7px;
}
.pcard{
	    width: 50%;
    	text-align: justify;
}
.formcard{
	    margin-left: 60px;
    	width: 50%;
    	margin-top: auto;
    	margin-bottom: auto;
}
.msg{
		color: green;
		text-align: center;
		background-color:whitesmoke;
}
</style>

</head>
<body>
	<%@include file="header.jsp"  %>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/pyqdb","root","root"); 
		Statement st1 = con1.createStatement(); 
		ResultSet rs =st1.executeQuery("select fname,lname,email from register where uname='"+uname+"'");
		rs.next();
		%>
 	<div class="card" style="margin-left: 70px;width:90%;">
  <div class="card-body" style="background-color: #0080ff;padding: 2px;">
    <h3 style="color: white;margin-left: 14px;">Contact Us</h3>
  </div>
</div> 
	<br>
	<div class="msg">
		<h4>
			<%
		String msg=(String)session.getAttribute("submsg");
	
		if(msg==null){
			out.println();
		}
		else{
			out.println(msg);	
		}
		session.removeAttribute("submsg");
	
		
	%> </h4>
	</div>

 <br>
	<div class="main_container">
	<div class="card_container">
		<div class="pcard">

		<p style="font-size: large;font-weight: 400;">We provide a very smooth way to get University exam
					papers on our website and for free without collecting any personal
					information. Any Indian College Students want to get any Semester
					and any Subject previous year question papers in easy way.
				</p>
					
					<h4>Please fill out this Contact Us form and send us your
					college name, question paper details like semester, branch, subject, 
					so that we can help you by uploading the Question paper link on our website,
					which you are looking for.</h4> 
		</div>
		
		<div class="formcard">
				<h4 style="text-align: center;">Reach out us by filling the form</h4>
				<br>
				<form action="insertContactUs.jsp">
    			  
				   <div class="mb-3">
				    <label for="branch" class="form-label" style="font-size: medium;font-weight: 400;">Your Name*</label>
				    <input type="text" name="name" value="<%out.println(rs.getString("fname")+" "+rs.getString("lname"));%>" style="pointer-events:none;" class="form-control" id="branch">
				  </div>
				   <div class="mb-3">
				    <label for="branch" class="form-label" style="font-size: medium;font-weight: 400;">Your Email*</label>
				    <input type="text" name="email" value="<%out.println(rs.getString("email"));%>" style="pointer-events:none;" class="form-control" id="branch">
				  </div>

					 <div class="mb-3">
							<label for="address" class="form-label"
								style="font-size: medium;font-weight: 400;">Your Message*</label>
							<textarea class="form-control form-control-lg" name="msg" id="floatingTextarea2" style="height: 130px" required></textarea> 
				 </div>
				  <button type="submit" class="btn btn-primary">Submit</button>
				</form>
			
		</div>
	
	</div>
	</div>

</body>
</html>