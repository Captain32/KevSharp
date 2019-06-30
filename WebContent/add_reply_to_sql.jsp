<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,javax.servlet.*,javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>回复</title>
</head>
<body>
	<%
		String post_id = new String(request.getParameter("post_id")); 
		String reply_content = new String(request.getParameter("content").getBytes("iso-8859-1"), "utf-8");
		String reply_user_id = (String)session.getAttribute("user_id");
		
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
			String sql = "select user_name from users where user_id=" + reply_user_id;
			rst = stmt.executeQuery(sql);
			rst.next();
			String reply_user_name = rst.getString("user_name");
			sql = "insert into replies(post_id,floor,reply_user_id,reply_user_name,reply_content,reply_time) values("
					+ post_id + ", 0 ," + reply_user_id + ",'" + reply_user_name + "','" + reply_content + "',current_timestamp())";
			stmt.executeUpdate(sql);
			sql = "update mydb.posts set reply_num=reply_num+1 where post_id="+post_id;
			stmt.executeUpdate(sql);
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