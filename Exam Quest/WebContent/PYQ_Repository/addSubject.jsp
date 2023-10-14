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
	
<title>Add Subject</title>

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
	color: green;
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
    <h3 style="color: white;margin-left: 14px;text-align: left;">Add University Exam Papers</h3>
  </div>
</div>

	<div class="msg">
		<h4>
			<%
		String msg=(String)session.getAttribute("Message1");
	
		if(msg==null){
			out.println();
		}
		else{
			out.println(msg);	
		}
		session.removeAttribute("Message1");
	
		
	%> </h4>
	</div>
		<%
		Class.forName("com.mysql.jdbc.Driver");
		Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/pyqdb","root","root"); 
		Statement st1 = con1.createStatement(); 
		%>
		<form action="insertSubject.jsp">
    
    <div class="mb-3">
      <label for="disabledSelect" class="form-label" style="font-size: larger;font-weight: 500;">University*</label>
      <select id="disabledSelect" class="form-select" name="univname">
        <option selected disabled hidden>-- Select University--</option>
        <%	ResultSet r=st1.executeQuery("select univname from university order by uid desc");
        while(r.next()) {%>
                    <option value="<%=r.getString("univname")%>"><%=r.getString("univname") %></option>
				<% }%>
      </select>
    </div>
   <div class="mb-3">
    <label for="branch" class="form-label" style="font-size: larger;font-weight: 500;">Branch (eg. Computer Engineering)*</label>
    <input type="text" name="branch" class="form-control" id="branch" required >
  </div>
   <div class="mb-3">
    <label for="branch" class="form-label" style="font-size: larger;font-weight: 500;">Subject Name*</label>
    <input type="text" name="subname" class="form-control" id="branch" required >
  </div>
   <div class="mb-3">
    <label for="branch" class="form-label" style="font-size: larger;font-weight: 500;">Subject Code*</label>
    <input type="text" name="subcode" class="form-control" id="branch" required >
  </div>
   <div class="mb-3">
    <label for="branch" class="form-label" style="font-size: larger;font-weight: 500;">Question Paper Year*</label>
    <input type="text" name="year" class="form-control" id="branch" required >
  </div>
    <div class="mb-3">
      <label for="disabledSelect" class="form-label" style="font-size: larger;font-weight: 500;">Session*</label>
      <select id="disabledSelect" class="form-select" name="sess">
        <option selected disabled hidden>-- Select Session --</option>
        <option value="Summer">Summer</option>
        <option value="Winter">Winter</option>
      </select>
    </div>   
    
    <div class="mb-3">
    <label for="branch" class="form-label" style="font-size: larger;font-weight: 500;">Semester*</label>
    <input type="text" name="sem" class="form-control" id="branch" required >
  </div>
	 <div class="mb-3">
			<label for="address" class="form-label"
				style="font-size: larger; font-weight: 500;">Paper Link
				<i class="fa fa-chain" style="font-size: 20px; color: red"></i> &nbsp;(paste paper link here)*
			</label>
			<textarea class="form-control form-control-lg" name="link" id="floatingTextarea2" style="height: 65px" required></textarea> 
 </div>
  <button type="submit" class="btn btn-primary">Add Paper</button>
</form>
<br>
</body>



</html>