<%@page import="java.sql.*"  %>
<html>
<head>
<title>home</title>
</head>
<body>
<%
try{

Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","wtlab","wtlab");
		Statement st=con.createStatement();
		
		String a=request.getParameter("uname");
		String b=request.getParameter("pack");
	        String c=request.getParameter("dob");
       		String d=request.getParameter("message");
		
		String sqlstr="insert into acharana4(username,No_of_Packets,Date_time,message) values('"+a+"','"+b+"','"+c+"','"+d+"')";
		//out.println(sqlstr);
		int i=st.executeUpdate(sqlstr);
		if(i>0)
		{
                   out.println("Data Inserted successfully....!");
		   
		}
		else
                   out.println("Failed....!");
	        
}
 catch(Exception ae)
{
out.println(ae);
}
%>
<a href="index.html">logout</a>
</body>
</html>