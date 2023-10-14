<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Home</title>
<style>
	
	.container{
		display:flex;
		margin-left: 121px;
		width: 94%;
		margin-top: 30px;
	}	
	.navbarfooter {
 		overflow: hidden;
	  background-color: #333;
	  bottom: 0;
	  width: 100%;
}
	.card1{
	    background-color: #003cffb3;
    color: white;
    margin-right: 20px;
    border-radius: 7px;
    width: 80%;
    margin-left: 13px;
    margin-bottom: auto;
	}
	
	.card1_p{
		    padding-top: 7px;
    text-align:center;
    margin-bottom: 7px;
    font-weight: 700;
	}
	
	
	.card2{
	    background-color: #003cffb3;
	    color: white;
	    margin-right:20px;
	    border-radius: 7px;
	    width:60.1%;
	    margin-bottom: auto;
	}
	
	.card2_p{
		    padding-top: 7px;
    text-align:center;
    margin-bottom: 7px;
    font-weight: 700;
	}
	.about_text{
		    margin-top: 26px;
		    width: 83.2%;
		    margin-left: 124px;
		    font-size: 17px;
		    text-align: justify;
	}
	.marq1{
		margin-left: 221px;
		width: 71%;
		color: red;
		background-color: whitesmoke;
	}
	
</style>

</head>

<body>

	<%@include file="header.jsp"  %>

	<div class="card" style="margin-left: 70px;width:90%;">
  <div class="card-body" style="background-color: #0080ff;padding: 2px;">
    <h3 style="color: white;margin-left: 14px;">Home</h3>
  </div>
</div>
	
	<div class="about_text">Candidates can get all the <b>Recent and Previous Year
		University Exam Question Papers </b> here. The Question Paper plays a vital role
		in the preparation of the semester exams. The <b>University Question Papers</b> are <b>free</b> to download.
		With the help of the Question Paper, you will get to know
		the exam pattern and marking scheme of various Universities. In <b>near future</b>  we are soon going to provide <b>University Exam Papers</b>
		for other <b>Under Graduate Degrees</b> as well.
		
		</div>
		<marquee class="marq1" direction="right" height="35px">
			**Best of luck for your University Exams!! <i class="fa fa-thumbs-up" style="font-size: 20px; color: red"></i>
			
		</marquee> 


	<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pyqdb","root","root");
	Statement st = con.createStatement();

	
%>

<!--  Container 1  -->
	
	
	<div class="container">
	<!--Card 1  -->
	
	<div class="card1">
	<p class="card1_p">Latest Updates</p>
	<table class="table" style="width: 96.4%;background-color: white;margin-left: 13px;">
	  <thead>
	   <tr>

	   </tr>
	  </thead>
	  <tbody>
	<%
	 ResultSet r1=st.executeQuery("select date(entrydate),message from broadcast order by bid desc");
	if(r1.next()!=false){
	do{ %>
	    	<tr>    
	     
	<td style="font-weight: 700"><p><%out.println("<img src='../image/arrowGif.gif' /> "+r1.getString("date(entrydate)")); %></p>
		<p style="margin-left:24px; margin-top: -20px"><% out.println(r1.getString("message"));%></p>
		
	</td>
	   	    	    </tr>
	     
	    <%}while(r1.next());
	}
	else{
		%>
		<tr>
		<td>
		No Updates Yet!
		</td>
		</tr>
	<%
	}
	    r1.close(); 
	    %> 
	    
	  </tbody>
	
	</table>
			
	</div>
 	<div class="card2">
	<p class="card2_p">Available Universities</p>
	<table class="table" style="width: 96%;background-color: white;margin-left: 13px;">
	  <thead>
	   <tr>

	   </tr>
	  </thead>
	  <tbody>
	<%
	 ResultSet r2=st.executeQuery("select distinct univname from subject order by sid desc");
	if(r2.next()!=false){
	do{ %>
	    	<tr>    
	     
	<td style="width: 85%;font-weight: 700;text-align: center;"><%out.println(r2.getString("univname")); %></td><!-- Display top 3 messages only -->

	   	    	    </tr>
	     
	    <%}while(r2.next());
	}
	else{
		%>
		<tr>
		<td>
		No Updates Yet!
		</td>
		</tr>
	<%
	}
	    r2.close(); 
	    %> 
	    
	  </tbody>
	
	</table>
	</div>
	</div>	
<br>
<%@include file="footer.jsp" %>
</body>
</html>