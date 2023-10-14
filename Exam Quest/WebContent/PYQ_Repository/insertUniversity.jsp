<%@page import="java.math.BigInteger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Employees</title>
</head>
<body>
<%
String univname=request.getParameter("univname");
String address=request.getParameter("address");


session.setAttribute("Message1", "University Registered Successfully!");


Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pyqdb","root","root");
Statement st = con.createStatement();
st.executeUpdate("insert into university (univname,address) values ('"+univname+"','"+address+"')");
	response.sendRedirect("addUniversity.jsp");
	con.close();
	st.close();


%>
</body>
</html>