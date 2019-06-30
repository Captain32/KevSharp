<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,javax.servlet.*,javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新增帖子</title>
</head>
<body>
	<%
		String title = new String(request.getParameter("title").getBytes("iso-8859-1"), "utf-8");
		String content = new String(request.getParameter("content").getBytes("iso-8859-1"), "utf-8");
		String user_id = (String)session.getAttribute("user_id");
		int block_id = Integer.parseInt(request.getParameter("block_id"));

		System.out.println(user_id);
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
			String sql = "select user_name from users where user_id=" + user_id;
			rst = stmt.executeQuery(sql);
			rst.next();
			String post_user_name = rst.getString("user_name");
			sql = "insert into posts(block_id,post_user_id,post_user_name,title,content,reply_num,time) values("
					+ block_id + "," + user_id + ",'" + post_user_name + "','" + title + "','" + content + "'," + 0 + ",current_timestamp())";
			stmt.executeUpdate(sql);
			sql = "select post_id from posts where post_user_id ="+user_id+" order by post_id desc limit 1";
			rst = stmt.executeQuery(sql);
			rst.next();
			String post_id = rst.getString("post_id");
			%>
			<script>
			window.location.href="post.jsp?post_id=<%=post_id%>";
			</script>
			<%
			rst.close();
			stmt.close();
			conn.close();
			

		} catch (java.sql.SQLException e) {
			out.println(e.toString());
		}
	%>
</body>
</html>