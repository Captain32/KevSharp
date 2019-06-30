<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,javax.servlet.*,javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>删除帖子</title>
</head>
<body>
<%
	String post_id=new String(request.getParameter("post_id"));
	java.sql.Connection conn;
	java.sql.Statement stmt;
	try{
		String dbip="",rootpath="",dbpassword="";
        Properties prop=new Properties();
            try
            {
                InputStream in=new BufferedInputStream(new FileInputStream("C:/Users/22295/Desktop/java/WebContent/WebContent/settings.properties"));
                prop.load(in);
                dbip=prop.getProperty("dbip");
                //rootpath=prop.getProperty("rootpath");
                dbpassword=prop.getProperty("dbpassword");
                System.out.println(dbip+" "+rootpath+" "+dbpassword);
            }
    
            catch(Exception e){
                System.out.println(e);
            }
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		conn=java.sql.DriverManager.getConnection("jdbc:mysql://"+dbip+":3306/mydb?serverTimezone=UTC", "root", dbpassword);
		stmt=conn.createStatement();
		//mark sure foreign key consistent
		String sql1="delete from replies where post_id="+post_id;
		String sql2="delete from posts where post_id="+post_id;
		stmt.execute(sql1);
		stmt.execute(sql2);
		stmt.close();
		conn.close();

		out.println("<script>alert('删除成功! ');this.location.href='index.jsp';</script>");

	}
	catch(java.sql.SQLException e)
	{
		out.println(e.toString());
	}
%>
</body>
</html>