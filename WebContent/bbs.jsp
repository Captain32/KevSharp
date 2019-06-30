<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,javax.servlet.*,javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>论坛</title>
</head>
<body>
	<%
		//String user_id=new String(request.getParameter("user_id"));
		//int blockNo = Integer.parseInt(request.getParameter("BlockNo"));
		//String BlockName = new String(request.getParameter("BlockName").getBytes("iso-8859-1"), "utf-8");
		java.sql.Connection conn;
		java.sql.Statement stmt;
		java.sql.ResultSet rst;

		try {
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
			conn = java.sql.DriverManager.getConnection("jdbc:mysql://"+dbip+":3306/mydb?serverTimezone=UTC", "root", dbpassword);
			stmt = conn.createStatement();
			String sql = "select post_id,post_user_id,post_user_name,title,time,reply_num from posts order by reply_num desc limit 6";
			rst = stmt.executeQuery(sql);
			%>
	<%
	while(rst.next()){
		String title = rst.getString("title");
		//String content = rst.getString("Content");
		int post_id = rst.getInt("post_id");
		String post_user_name = rst.getString("post_user_name");
		String time = rst.getString("time");
		int reply_num = rst.getInt("reply_num");
		%>
		<div class="one_post">
		<hr>
		<a>
		<p>#<%=post_id %></p>
		<p><a href="post.jsp?post_id=<%=post_id %>"><%=title %></a></p>
		<p>作者：<%=post_user_name %></p>
		<p>回复数：<%=reply_num %></p>
		<p><%=time %></p><hr>
		</a>
		</div>
		<%
	}	
	rst.close();
	stmt.close();
	conn.close();
	
		} catch (java.sql.SQLException e) {
			out.println(e.toString());
		}
	%>
	
</body>
</html>