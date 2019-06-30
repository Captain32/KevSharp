<%@ page contentType="text/html; charset=utf-8" language="java"  errorPage="" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.*,javax.servlet.http.*" %>
<html lang="zh-cmn-Hans">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>KevSharp</title>

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
	<style type="text/css">


#video.min {
    width: 320px;
    height: 200px;
    position: fixed;
    left: auto;
    top: auto;
    right: 0;
    bottom: 0;
}
     
</style>
</head>

<%
String video_id = (String)request.getParameter("video_id");
if (video_id == null){
    %> <script>alert("视频id为空");</script> <%
}
else{
// TODO 
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
java.sql.Connection conn;
java.sql.Statement stmt;
java.sql.ResultSet rst;
try {
Class.forName("com.mysql.jdbc.Driver").newInstance();
conn = java.sql.DriverManager.getConnection("jdbc:mysql://"+dbip+":3306/mydb?serverTimezone=UTC", "root", dbpassword);
stmt = conn.createStatement();
String sql = "select * from videos where video_id=" + video_id;
rst = stmt.executeQuery(sql);
rst.next();
String path = rst.getString("path");
int block_id = rst.getInt("block_id");
int video_user_id=rst.getInt("video_user_id");
String video_user_name = rst.getString("video_user_name");
String title=rst.getString("title");
int visit_num = rst.getInt("visit_num");
String video_time = rst.getString("time");

int idx = 0;
/*while(true)
{
idx = path.indexOf("/");
if(idx==-1) break;
path = path.substring(0,idx-1)+"\\"+ path.substring(idx+1);
}*/
String video_path = "\"./"+path+"\"";
System.out.println(video_path);

String sql_update="update videos set visit_num = visit_num + 1 where video_id=" + video_id;
stmt.executeUpdate(sql_update);
    %>


<body data-spy="scroll" data-target=".nav-top">
<script type="text/javascript">
window.onscroll = function () {
    var top = document.documentElement.scrollTop||document.body.scrollTop;
    document.getElementById("video").className = top>400 ? "min" : "";
}
</script>
	
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

    <!--======== end header =========-->

    <section class="support">
        <img src="Pictures/back-narrow.png" style="vertical-align: middle" align=right />
    
    <section>
		<br>
        <div class="container" style="background: #FFFFFF">
            <div class="container">
            <div class="row">
				<div class="about-content">
					<br>
                        <h1 class="section-title"><em class="fa fa-video-camera"></em><%
                            switch (block_id){
                                case 1: %><em class="fa fa-superscript"></em>数学 <% break;
                                case 2: %><em class="fa fa-laptop"></em>计算机 <% break;
                                case 3: %><em class="fa fa-language"></em>英语 <% break;
                            }
                            %> > <%=title %></h1>
                        <div class="col-md-10 col-md-offset-1">
                    
                </div>

                    </div>
                <div class="col-md-10 col-md-offset-1">
                  <div class="row">
                <div class="col-md-5 col-xs-12 col-lg-9">
                    <!--<div class="about-content">-->
                        <%
                        if (video_id == null){
                            %> <span>视频id为空</span> <%
                        }
                        %>
                        <video id="video" controls="controls" height=400><source  src=<%=video_path %> ></source></video>

							<% 
	
						
						
							%>
                    <!--</div>http://qty83k.creatby.com/materials/127487/video/56f7870b3bb5a55d3d3574695bbdf658.mp4-->
                </div>
				<span>
					<br>
					<font size=5>Up主：</font>
					<br><br>
					<a href="user.jsp?show_user_id=<%=video_user_id%>" align=right><%=video_user_name%></a><br><hr>
                    播放量：<%=visit_num%><br>
                    上传日期：<%=video_time%>
					</span>
<%
}catch (java.sql.SQLException e) {
	out.println(e.toString());
}
} %>                
            </div>
                </div>
            </div>
        </div>
		<hr>
		
        </div>
        
        <hr>
        
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