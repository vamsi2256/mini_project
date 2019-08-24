<%@page import="java.sql.*"  %>
<%@include file="thankyou2.html"%>
<html>
<head>
<title>home</title>
</head>
<body>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","tiger");
		Statement st=con.createStatement();
		
		String b=request.getParameter("group");
		String c=request.getParameter("dst");
		String d=request.getParameter("pin");
		String e=request.getParameter("pnum");
		
		out.println("<table border=5>");
		out.println("<tr style=bgcolor=#3d3d3d>");
		out.println("<th>");
		out.println("Name");
		out.println("</th>");
		out.println("<th>");
		out.println("Mobile");
		out.println("</th>");
		out.println("<th>");
		out.println("Address");
		out.println("</th>");
		out.println("<th>");
		out.println("District");
		out.println("</th>");
		out.println("<th>");
		out.println("pincode");
		out.println("</th>");
		out.println("<th>");
		out.println("Blood Group");
		out.println("</th>");
		out.println("</tr>");

		String sqlstr="select * from acharana where blood='"+b+"' and (district='"+c+"' or pincode='"+d+"')";
		ResultSet rs=st.executeQuery(sqlstr);
			while(rs.next()) 
	        {
               String email=rs.getString(3);
               String blood=rs.getString(5);
               String name=rs.getString(1);
               session.setAttribute("mail", email);
      	        session.setAttribute("bloodgroup", blood);
      	       session.setAttribute("name", name);
      	     session.setAttribute("phone", e);
      	   RequestDispatcher rs1=request.getRequestDispatcher("./Send_Blood_Group");
			rs1.include(request, response);
		     out.println("<tr>");
		out.println("<th>");
		out.println(rs.getString(1));
		out.println("</th>");
		out.println("<th>");
		out.println(rs.getString(4));
		out.println("</th>");
		out.println("<th>");
		out.println(rs.getString(2));
		out.println("</th>");
		out.println("<th>");
		out.println(rs.getString(8));
		out.println("</th>");
		out.println("<th>");
		out.println(rs.getString(9));
		out.println("</th>");
		out.println("<th>");
		out.println(rs.getString(5));
		out.println("</th>");
		out.println("</tr>");
                
		}
	
		
			  
%>
<br><center><h1><a href="index.html" >Back</a></h1></center>
</body>
</html>