<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	
<title>Add Broadcast</title>

<style>

body{
	background-color: white;
}

* {
	padding: 0;
	margin: 0;
}



/*Form CSS:  */
.card-registration .select-input.form-control[readonly]:not ([disabled]
	) {
	font-size: 1rem;
	line-height: 2.15;
	padding-left: .75em;
	padding-right: .75em;
}

.card-registration .select-arrow {
	top: 13px;
}


.msg{
	color: #00ce00;
    text-align: center;
    margin-bottom: -132px;
    margin-top: 25px;
}

form{

	    margin-left: auto;
    width: 87%;
    margin-right: auto;
    padding: 30px;
    margin-top: 199px;
    border-radius: 10px;
    background-color: white;
}
</style>

</head>




<body>
	<%@include file="header.jsp"%>
	<br>
<div class="card" style="margin-left: 70px;width:90%;">
  <div class="card-body" style="background-color: #0080ff;padding: 2px;">
    <h3 style="color: white;margin-left: 14px;text-align: left;">Broadcast the message</h3>
  </div>
</div>

	<div class="msg">
		<p style="font-size:20px;font-weight: 700">
			<%
		String msg=(String)session.getAttribute("Message1");
	
		if(msg==null){
			out.println();
		}
		else{
			out.println(msg);	
		}
		session.removeAttribute("Message1");
	
		
	%> </p>
	</div>
		
		<form action="insertBroadcast.jsp">
    

	 <div class="mb-3">
			<label for="address" class="form-label"
				style="font-size: larger; font-weight: 500;">Add Broadcast Description* <p style="font-size: 14px;color: red;margin-left: 242px;margin-top: -23px;">(max 500 characters)</p>
			</label>
			<textarea class="form-control form-control-lg" name="desc" id="floatingTextarea2" style="height: 65px" required></textarea> 
 </div>
  <button type="submit" class="btn btn-primary">Add</button>
</form>

</body>
</html>