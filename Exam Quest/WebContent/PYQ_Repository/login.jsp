<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
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
.regmsg{
	color: green;
	text-align: center;
	background-color: white;
	font-size: 14px;
    font-weight: 500;

}
.form_card{
	margin-top: 60px; 
    margin-left: auto;
    margin-right: auto;
    width: 40%;
    background-color: white;
    box-shadow: 0px 4px 22px -6px rgba(0,0,0,0.75);
    padding: 25px;
    border-radius: 14px;
}
</style>

<body>

		<br>	
		<div class="card" style="margin-left: 70px;width:90%;">
  <div class="card-body" style="background-color: #0080ff;padding: 2px;">
    <h3 style="color: white;margin-left: 14px;text-align: center;">Login To Access The Website</h3>
  </div>
</div>
<br>

<div class="form_card">
 <form action="verify.jsp" style="margin-bottom: 11px;">
 
 		<h2 style="text-align:center;color: blue;margin-top: -20px;text-align: center;">Login</h2>
 	

<div class="regmsg">
	

	<p>
	<%
	
		 String regmsg=(String) session.getAttribute("regMsg");
			
			if(regmsg==null){
				out.println();
			}
			else{
				out.println(regmsg);	
			}
			session.removeAttribute("regMsg");	
		
		
		%>
	</p>

</div>
<div class="msg">
	

	<p>
	<%
	 String flag=request.getParameter("flag");

	 String message=(String) session.getAttribute("Message");

		
		 if(flag!=null){
				if(message==null || flag.equals("logout") || flag.equals("register") || flag.equals("resetpass")){
					out.println();
				}
				else if(message.equals(message) || flag.equals("verify")){
					out.println(message);
				}
				else {
					out.println();
				}
			
				 session.removeAttribute("Message"); 
		} 
		
		%>
	</p>

</div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label"><i class="fa-solid fa-user"></i> User Name</label>
    <input type="text" class="form-control" name="uname1" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label"><i class="fa-solid fa-lock"></i>  Password</label>
    <input type="password" class="form-control" name="pass1" id="exampleInputPassword1">
  </div>
 	
  <button type="submit" style="width: 100%;font-weight: 700;font-size: large;" class="btn btn-primary">Login</button>
</form>
<div class="a" style="margin-bottom: auto;text-align: center;">
           		<a href="addRegister.jsp?flag=login" style="text-decoration: none;">New User? Click here to Register</a>
            </div>
 </div>

 
</body>
</html>