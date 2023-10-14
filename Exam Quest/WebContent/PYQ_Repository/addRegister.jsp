<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
	
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
</head>

<style>
body{
	background-color: whitesmoke;
}
.card{
margin-left:50px;
margin-right: 50px;
 }

form-lable{
	font-size: larger;
	font-weight: bolder;
}
</style>

<body>
	
		<br>	
		<div class="card" style="margin-left: 70px;width:90%;">
  <div class="card-body" style="background-color: #0080ff;padding: 2px;">
    <h3 style="color: white;margin-left: 14px;text-align: center;">Sign Up</h3>
  </div>
</div>
 
 <div class="passcontainer">
<section class="vh-100 gradient-custom" style="background-color: whitesmoke;" >
  <div class="container py-5 h-100" style="background-color: whitesmoke;">
    <div class="row justify-content-center align-items-center h-100" style="background: whitesmoke;">
      <div class="col-12 col-lg-9 col-xl-7" style="background-color: whitesmoke;">
        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;border:none;background: white;box-shadow: 0px 4px 22px -6px rgba(0,0,0,0.75);" >
          <div class="card-body p-4 p-md-5" style="background-color: white;border-radius: 15px;border:none;">
                        <form  action="insertRegister.jsp" >

					<h2 style="text-align:center;color: blue;margin-top: -30px;">Registration</h2>
					
			
                  <div class="form-outline" style="background-color: white;">
                    <label class="form-label" for="fname">First Name*</label>
                    <input  type="text" id="oldpass" name="fname"  class="form-control form-control-lg" style="width:100%" autocomplete="off" required/>
                

                </div>
                				<br>
                
                  <div class="form-outline" style="background-color: white;">
                    <label class="form-label" for="uname">Last Name*</label>
                    <input  type="text" id="oldpass" name="lname"  class="form-control form-control-lg" style="width:100%" autocomplete="off" required/>
                

                </div>
                				<br>
                
                  <div class="form-outline" style="background-color: white;">
                    <label class="form-label" for="uname">Email*</label>
                    <input  type="text" id="oldpass" name="email"  class="form-control form-control-lg" style="width:100%" autocomplete="off" required/>
                

                </div>
                				<br>
                
                  <div class="form-outline" style="background-color: white;">
                    <label class="form-label" for="uname">User Name*</label>
                    <input  type="text" id="oldpass" name="uname"  class="form-control form-control-lg" style="width:100%" autocomplete="off" required/>
                

                </div>
				<br>
                  <div class="form-outline" style="background-color: white;">
                    <label class="form-label" for="pass">Password*</label>
                    <input type="password" id="newpass" name="pass" class="form-control form-control-lg" required/>
                     
                </div>
               
                <div class="mt-4 pt-2 text-center" style="background-color: white;">
                <input class="btn btn-primary btn-lg " style="margin-bottom:-20px;" type="submit" value="REGISTER" />
              </div>

            </form>
            
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
 </div>
 	<br>
 	<br>
</body>
</html>