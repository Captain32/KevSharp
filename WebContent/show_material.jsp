<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,javax.servlet.*,javax.servlet.http.*" %>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--======== All Stylesheet =========-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/linearicons.css" rel="stylesheet">
    <!--=== plugins ===-->
    <link href="css/owl.carousel.css" rel="stylesheet">
    <link href="css/owl.theme.css" rel="stylesheet">
    <!--=== end plugins ===-->
    <link rel="shortcut icon" href="Pictures/logo.ico">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Titillium+Web:400,900,700,600,300,200' rel='stylesheet'
        type='text/css'>
    <style>
            .one_post > p{
                color: #120f29;
                font-size: 16px;
                margin-bottom: 35px;
                line-height: 1.7;
                font-weight: 100;
            }	
                </style>
</head>
<% String file_id = new String(request.getParameter("file_id")); %>
<title>查看文件#<%=file_id%></title>
<%
String sql = "select * from files where file_id="+file_id;
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
            rootpath=prop.getProperty("rootpath");
            dbpassword=prop.getProperty("dbpassword");
            System.out.println(dbip+" "+rootpath+" "+dbpassword);
        }

        catch(Exception e){
            System.out.println(e);
       }
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = java.sql.DriverManager.getConnection("jdbc:mysql://"+dbip+":3306/mydb?serverTimezone=UTC", "root", dbpassword);
    stmt = conn.createStatement();
    rst = stmt.executeQuery(sql);
    rst.next();
    String path = rst.getString("path");
    String file_path = "\"./"+ path + "\"";
    int block_id = rst.getInt("block_id");
    String file_user_name = rst.getString("file_user_name");
    int file_user_id = rst.getInt("file_user_id");
    String title=rst.getString("title");
    int reply_num = rst.getInt("reply_num");
    String file_time=rst.getString("time");

    String sql_update="update files set reply_num = reply_num + 1 where file_id=" + file_id;
    stmt.executeUpdate(sql_update);

    conn.close();


%>

<body data-spy="scroll" data-target=".nav-top">
	<!--======== header =========-->
    <header id="home" data-spy="scroll" data-target="#top-nav">
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <!-- menu 4 -->
                <div class="navbar navbar-default navbar-fixed-top default-menu menu-4" role="navigation">
                    <div class="container">
                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                data-target="#menu-4" aria-expanded="false">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                            <a class="scroll" href="index.jsp"><img src="Pictures/logo_sub.png" width="182" height="70"
                                    align=top /> </a>
                        </div>

                        <div class="collapse navbar-collapse top-nav" id="menu-4">
                            <ul class="nav navbar-nav navbar-right">
                                <li></li>
                                <li>
                                    <a class="scroll" href="shipinqv.jsp">
                                        <font size=4 face="Microsoft Yahei light"><em class="fa fa-video-camera"></em>
                                            视频区</font>
                                    </a>
                                </li>
                                <li>
                                    <a class="scroll" href="ziliaoqv.jsp">
                                        <font size=4 face="Microsoft Yahei light"><em class="fa fa-paperclip"></em> 资料区
                                        </font>
                                    </a>
                                </li>
                                <li>
                                    <a class="scroll" href="luntanqv.jsp">
                                        <font size=4 face="Microsoft Yahei light"><em class="fa fa-bullhorn"></em> 论坛区
                                        </font>
                                    </a>
                                </li>
                                <%
    String user_id = (String)session.getAttribute("user_id");
    // String user_id = request.getParameter("user_id");
    if (user_id == null){
        %>
                                <li><button type="button" class="btn btn-default navbar-btn"
                                        onclick="window.location.href = 'welcome.jsp'">注册/登录</button></li>
                                <%
    }
    else{
        %>
        <li> <a class="scroll" href="#" data-toggle="dropdown"><font size=4><em class="fa fa-user"></em>&ensp;</font></a>
			<ul class="dropdown-menu">
            <li><a href="user.jsp?show_user_id=<%=user_id%>"><em class="fa fa-user-md"></em> 我的主页</a>
            </li>
            <li><a href="logout.jsp"><em class="fa fa-power-off"></em> 我要登出</a>
            </li>
        </ul>	</li>

        <li><a class="scroll" href="#" data-toggle="dropdown"><font size=4><em class="fa fa-plus"></em>&ensp;</font></a>
								
        <ul class="dropdown-menu">
            <li><a href="upload_video.jsp?uptype=video"><em class="fa fa-video-camera"></em> 发表视频</a>
            </li>
            <li><a href="upload_file.jsp?uptype=material"><em class="fa fa-paperclip"></em> 分享资料</a>
            </li>
            <li><a href="add_post.jsp"><em class="fa fa-bullhorn"></em> 发表帖子</a>
            </li>
        </ul>
			</li>
									
                                <%
    }                  
                                %>
                            </ul>

                        </div>
                    </div>
                </div>
                <!-- end menu -->
            </div>
        </div>
    </header>

	<section class="support">
	<img src="Pictures/back-narrow.png" style="vertical-align: middle" align=right />
	
	<section>
		<br>
        <div class="container" style="background: #FFFFFF">
            <div class="container">
            <div class="one_post"><h2>
                <%
                switch (block_id){
                    case 1: %>math<% break;
                    case 2: %>cs<% break;
                    case 3: %>English<% break;
                }
                %> >&ensp;
                <%=title%></h2><hr>
                <a href="user.jsp?show_user_id=<%=file_user_id%>"><p>Up主：<%=file_user_name %></p></a>
                <%
                if(path.endsWith("pdf")){
                    // pdf 文件可以直接展示
                %>
				<div class="about-content" style="height: 600px;">
                    <br>
                    <!-- TODO -->

                    <iframe src=<%=file_path %> width="95%" height="95%"></iframe> 
                </div>
                <%
                }
                else{ %>
                    下载文件：<a href= <%=file_path %>> <%=title %></a>
                    <%
                }
} catch (java.sql.SQLException e) {
    out.println(e.toString());
}
                %>
        
</div>
<div class="col-md-10 col-md-offset-1">
<div class="row">



</div>
</div>
</div>
</div>

	  
</section></section>

<!--======== footer =========-->
<footer class="footer">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-md-12 text-center">
				<p>Designed By KevSharp</p>
			</div>
		</div>
	</div>
</footer>
<!--======== end footer =========-->

<!--======== All Javascript =========-->
<script src="js/jquery-2.1.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/custom.js"></script>

</body>
</html>