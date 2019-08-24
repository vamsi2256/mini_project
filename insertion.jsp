<%@page import="java.sql.*"  %>
<%@include file="thankyou2.html"%>
<html>
<head>
<title>home</title>
</head>
<body>
<%
try{

Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
		Statement st=con.createStatement();
		
		String k=request.getParameter("uname");
		String a=request.getParameter("reg");
		String b=request.getParameter("txt");
	    String c=request.getParameter("email");
       	String d=request.getParameter("pnum");
		String e=request.getParameter("bg1");
		String f=request.getParameter("age1");
		String g=request.getParameter("Status");
		String h=request.getParameter("dst");
		String j=request.getParameter("pin");
		
		  
	     session.setAttribute("name", k);
	     session.setAttribute("email", c);
		
  String sqlstr="insert into acharana(username,address,email,phone,blood,age,status,district,pincode) values('"+k+"','"+b+"','"+c+"','"+d+"','"+e+"','"+f+"','"+g+"','"+h+"','"+j+"')";
		//out.println(sqlstr);
		int i=st.executeUpdate(sqlstr);
		if(i>0)
		{
			RequestDispatcher rs=request.getRequestDispatcher("./Sending_Mail_Servlet");
			rs.include(request, response);
		    out.println("<center><middle><h1>Data Inserted successfully....!</h1></middle></center>");
		   
		}
		else
                   out.println("Failed....!");
	        
}
 catch(Exception ae)
{
out.println(ae);
}
%>
<center><middle><h1><a href="index.html" align="center">Back</a></h1></middle></center>
</body>
</html>