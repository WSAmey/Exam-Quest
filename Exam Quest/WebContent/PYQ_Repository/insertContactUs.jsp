<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Contact Us</title>
</head>
<body>
<%
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String msg=request.getParameter("msg");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pyqdb","root","root");
	Statement st = con.createStatement();
	st.execute("insert into contactus (cname,email,message) values ('"+name+"','"+email+"','"+msg+"')");
	session.setAttribute("submsg", "Your Details Have Been Successfully Submitted!");
	response.sendRedirect("addContactUs.jsp");
	
%>

</body>
</html>