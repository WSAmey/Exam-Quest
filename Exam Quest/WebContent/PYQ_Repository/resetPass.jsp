<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reset Password</title>
</head>
<style>

body{
	background-color: whitesmoke;
}
.card{
margin-left:50px;
margin-right: 50px;
 }
.msg{
	color: red;
	text-align: center;
	background-color: white;
	font-size: 14px;
    font-weight: 500;

}

form-lable{
	font-size: larger;
	font-weight: bolder;
}
.form_card{
	margin-top: 36px; 
    margin-left: auto;
    margin-right: auto;
    width: 40%;
    background-color: white;
    box-shadow: 0px 4px 22px -6px rgba(0,0,0,0.75);
    padding: 42px;
    border-radius: 14px;
}
</style>


<body>
<%
	
	String uname1=(String)session.getAttribute("uname");
	session.setAttribute("uname",uname1);
%>
<%@ include file="header.jsp" %>
<br>
<div class="card" style="margin-left: 70px;width:90%;">
  <div class="card-body" style="background-color: #0080ff;padding: 2px;">
    <h3 style="color: white;margin-left: 14px;text-align: left;">Reset Your Password</h3>
  </div>
</div>
<br>


<%
	String dbpass=(String)session.getAttribute("pass");

%>
	<div class="form_card">
 <form action="verifyResetPass.jsp" >
 
 		<h4 style="text-align:center;color: blue;margin-top: -20px;text-align: center;">Change Password</h4>
 	<br>
 	<div class="msg"><p>
		<%
		String flag=request.getParameter("flag");
		String resetmsg=(String)session.getAttribute("passwordmsg");
		if(flag.equals("header") || resetmsg==null){
			out.println();
		}

		else if(flag.equals("verifyreset")){
			out.println(resetmsg);	
		}
		session.removeAttribute("passwordmsg");
		
		%>
					</p></div>
  <div class="mb-3">
    <input type="hidden" class="form-control" name="uname" value="<%=dbpass %>" id="exampleInputEmail1" aria-describedby="emailHelp" required>
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Old Password</label>
    <input type="password" class="form-control" name="oldpass" id="exampleInputEmail1" aria-describedby="emailHelp" required>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">New  Password*</label>
    <input type="password" class="form-control" name="newpass" id="exampleInputPassword1" required>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Confirm Password*</label>
    <input type="password" class="form-control" name="confirmpass" id="exampleInputPassword1" required>
  </div>
 	
  <button type="submit" style="width: 100%;font-weight: 700;font-size: large;" class="btn btn-primary">Reset</button>
</form>

 </div>
	
<br>
</body>
</html>