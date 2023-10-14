<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String fname=request.getParameter("fname");
	String lname=request.getParameter("lname");
	String email=request.getParameter("email");
	String uname=request.getParameter("uname");
	String pass=request.getParameter("pass");
	
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pyqdb","root","root");
Statement st = con.createStatement();	

st.executeUpdate("insert into register (fname,lname,email,uname,pass) values('"+fname+"','"+lname+"','"+email+"','"+uname+"','"+pass+"')");
session.setAttribute("regMsg", "Registered successfully!");

response.sendRedirect("login.jsp");
%>
</body>
</html>