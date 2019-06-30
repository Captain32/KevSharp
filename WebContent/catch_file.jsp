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
    int MAX_SIZE = 102400 * 102400;
    DataInputStream in = null;
    FileOutputStream fileOut = null;
    String sqlpath = "webfile/";
    //data type
    String contentType = request.getContentType();
    //String title = (String)(request.getParameter("title"));
	//String block_id = (String)(request.getParameter("block_id"));
	String file_user_id = (String)session.getAttribute("user_id");
	SmartUpload su = new SmartUpload();
	su.initialize(pageContext);
	su.upload();
	String title = new String(su.getRequest().getParameter("title").getBytes("gbk"), "UTF-8");//吹一波！！！！
	String block_id = new String(su.getRequest().getParameter("block_id").getBytes("gbk"), "utf-8");
	System.out.print(block_id+" "+title);
	//block_id = "1";
	//title = "shit";
	java.sql.Connection conn;
	java.sql.Statement stmt;
	java.sql.ResultSet rst;

    try {
    	
        if (contentType.indexOf("multipart/form-data") >= 0) {
            //读入上传数据
            in = new DataInputStream(request.getInputStream());
            int formDataLength = request.getContentLength();
            if (formDataLength > MAX_SIZE) {
                out.print("上传的字节不可以超过" + MAX_SIZE + "字节");
                return;
            }
            
            
    		com.jspsmart.upload.File smartFile = su.getFiles().getFile(0);
            String filename = smartFile.getFileName();
          //检查上传文件的目录是否存在
            java.io.File fileDir = new java.io.File(rootpath+sqlpath);
            if (!fileDir.exists()) {
                fileDir.mkdirs();
            }
            java.io.File checkFile = new java.io.File(rootpath+sqlpath+filename);
            if (checkFile.exists()) {
                out.println("<p>" + filename + "文件已经存在.</p>");
                return;
            }
            if (file_user_id == null) {
                out.println("<p>" +  "未登录.</p>");
                return;
            }
          
     	    // 保存文件
            smartFile.saveAs("./"+sqlpath+filename);           
            //sql
            Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn = java.sql.DriverManager.getConnection("jdbc:mysql://"+dbip+":3306/mydb?serverTimezone=UTC", "root", dbpassword);
			stmt = conn.createStatement();
			String sql = "select user_name from users where user_id=" + file_user_id;
			rst = stmt.executeQuery(sql);
			rst.next();
			String file_user_name = rst.getString("user_name");	             
			sql = "insert into files(block_id,file_user_id,file_user_name,title,path,reply_num,time) values("
    				+ block_id + "," + file_user_id + ",'" + file_user_name + "','" + title + "','" + sqlpath +filename + "'," + 0 + ",current_timestamp())";
			System.out.println(sql);
    		//System.out.print(sql);
    		stmt.executeUpdate(sql);
    		
    		stmt.close();
    		conn.close();
    		rst.close();
    		%>
    		 <script>
             window.location.href = "index.jsp";
         	</script>
             <%
        } 
    } catch (Exception ex) {
        throw new ServerException(ex.getMessage());
    }
    
%>
</body>
</html>