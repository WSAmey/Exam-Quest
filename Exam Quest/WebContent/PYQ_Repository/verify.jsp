<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Verify</title>
</head>
<body>
<%

String uname=request.getParameter("uname1");
String pass=request.getParameter("pass1");
session.setAttribute("uname", uname);
session.setAttribute("pass", pass);

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost/pyqdb","root","root");
Statement st = con.createStatement();

ResultSet rs=st.executeQuery("select fname,lname,email,uname,pass from register where uname='"+uname+"' and pass='"+pass+"'");

session.setAttribute("Message", "Invalid username or password!");



rs.last();
if(rs.getRow()>0){
	session.setAttribute("fname",rs.getString("fname"));
	session.setAttribute("lname",rs.getString("lname"));
	session.setAttribute("email",rs.getString("email"));
	session.setAttribute("uname",rs.getString("uname"));
	response.sendRedirect("index.jsp");
}
else{
	response.sendRedirect("login.jsp?flag=verify");
}

%>
</body>
</html>