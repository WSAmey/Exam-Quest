<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About Us</title>

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
	    background-color: white;
	    padding: 50px;
	    border-radius: 7px;
}
.pcard{
	    width: 50%;
    	text-align: justify;
}
.imgcard{
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
	
		<div class="card" style="margin-left: 70px;width:90%;">
  <div class="card-body" style="background-color: #0080ff;padding: 2px;">
    <h3 style="color: white;margin-left: 14px;">About Us</h3>
  </div>
</div>
	
	<br>
	<div class="main_container">
	<div class="card_container">
		<div class="pcard">
		
	
		<p style="font-size: large;font-weight: 400;">The website is developed
					by tech enthusiast guy, who had a dream of digitalizing the
					examination study material for all Indian university students for free of cost.
					As we know that previous year question papers play vital role 
					in understanding the paper pattern and marking scheme to score
					good marks in examination. But this dosn't mean that by only preparing
					previous year question papers for examination one can score the good
					marks in exams. So, We strongly urge all university students to prepare whole 
					syllabus along with the previous year question papers before appearing 
					for the university exam.
					<br> 
					<br> Also, You have seen other sites listed and on clicking their
					download links, you may might have been redirected to the official site of your
					university website for the past question paper links, that actually
					make students inconvenient and frustrated with their search for
					paper download as students don't know the subject code of the past
					year Papers because the subject code keeps changing every year in
					the universities. Our website provides the direct download link of the
					past question papers to which students can access that paper links
					without any hassle for free.


				</p>
									</div>
					
						<div class="imgcard">
		
			<img src="image/examimg.jpg" style="width: 100%;"/>
		</div>
			</div>
		
		
	</div>

</body>
</html>