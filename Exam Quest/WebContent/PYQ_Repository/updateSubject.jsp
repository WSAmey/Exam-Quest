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
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost/pyqdb","root","root"); 
	Statement st1 = con1.createStatement(); 

	
	int id=Integer.parseInt(request.getParameter("id"));
	String univname=request.getParameter("univname");
	String branch=request.getParameter("branch");
	String subname=request.getParameter("subname");
	String subcode=request.getParameter("subcode");
	String year=request.getParameter("year");
	String sess=request.getParameter("sess");
	String sem=request.getParameter("sem");
	String link=request.getParameter("link");
		
		session.setAttribute("updatemsg", "Paper Details Updated successfully!");
	st1.executeUpdate("update subject set univname='"+univname+"',branch='"+branch+"',subname='"+subname+"',subcode='"+subcode+"',year='"+year+"',sess='"+sess+"',sem='"+sem+"',link='"+link+"' where sid='"+id+"'");
	response.sendRedirect("viewSubject.jsp");
	

}
catch(Exception e){
	
	out.println(e);
	System.out.println(e);
	
}
%>
</body>
</html>