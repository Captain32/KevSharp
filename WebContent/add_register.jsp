<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.*,javax.servlet.http.*" %>
<%@ page import="java.rmi.ServerException" %>
<%@ page import="com.jspsmart.upload.*" %>
<html>
<head>
    <title></title>
</head>
<body>
<%
try{
	String dbip="",rootpath="",dbpassword="";
	Properties prop=new Properties();
	    try
	    {
	        InputStream in=new BufferedInputStream(new FileInputStream("C:/Users/22295/Desktop/java/WebContent/WebContent/settings.properties"));
	        prop.load(in);
	        dbip=prop.getProperty("dbip");
	        rootpath=prop.getProperty("rootpath");
	        dbpassword=prop.getProperty("dbpassword");
	        System.out.println(dbip+" "+rootpath+" "+dbpassword);
	    }
	
	    catch(Exception e){
	        System.out.println(e);
       }
    String user_name=new String(request.getParameter("username"));
    String gender=new String(request.getParameter("gender"));
    String birthday=new String(request.getParameter("birthday"));
    String password=new String(request.getParameter("password"));
    String email=new String(request.getParameter("email"));

    if (user_name.equals("")||password.equals("")||email.equals("")||password == null){
        %>
                    <script>
                        alert("所有输入均不能为空！");
                        window.location.href = "register.jsp";
                    </script>
                    <%
    }
    java.sql.Connection conn;
	java.sql.Statement stmt;
    java.sql.ResultSet rst;
    
    Class.forName("com.mysql.jdbc.Driver").newInstance();
	conn = java.sql.DriverManager.getConnection("jdbc:mysql://"+dbip+":3306/mydb?serverTimezone=UTC", "root", dbpassword);
	stmt = conn.createStatement();
    String sql = "insert into users(user_name, gender, level, birthday, password, email, reg_date) values('" + user_name+"','"+gender+"',"+"0"+",'"+birthday+"','"+password+"','"+email+"',current_timestamp())";
    stmt.executeUpdate(sql);
    
    String sql1= "select max(user_id) from users";
    rst = stmt.executeQuery(sql1);
    System.out.println(sql1);
    rst.next();
    int user_id = rst.getInt("max(user_id)");
	System.out.println(user_id);
    stmt.close();
    conn.close();
    rst.close();
    %>

    		<script>
            alert("申请账号成功！请记住您的账号："+<%=user_id%>+"前往登录页面");
            window.location.href = "welcome.jsp";
         	</script>
            <%
        
    } catch (Exception ex) {
        throw new ServerException(ex.getMessage());
    }
    
%>
</body>
</html>