<%@page import="java.math.BigInteger"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert Subject</title>
</head>
<body>
<%
String univname=request.getParameter("univname");
String branch=request.getParameter("branch");
String subname=request.getParameter("subname");
String subcode=request.getParameter("subcode");
String year=request.getParameter("year");
String sess=request.getParameter("sess");
String sem=request.getParameter("sem");
String link=request.getParameter("link");
//out.println(link);

session.setAttribute("Message1", "Exam Paper Added Successfully!");


Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pyqdb","root","root");
Statement st = con.createStatement();
st.executeUpdate("insert into subject (univname,subname,subcode,sess,sem,branch,link,examyear) values ('"+univname+"','"+subname+"','"+subcode+"','"+sess+"','"+sem+"','"+branch+"','"+link+"','"+year+"')");
	response.sendRedirect("addSubject.jsp");
	con.close();
	st.close();


%>
</body>
</html>