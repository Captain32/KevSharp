<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
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
    <!-- 下拉菜单  -->
    <style>
        #subMenu {
            display: none;
            position: fixed;
            top: 55px;
            left: 10px;
        }
    </style>
    <script>
        function showSubMenu() {
            var m = document.getElementById("subMenu");
            m.style.display = "block";
        }

        function hiddenSubMenu() {
            var m = document.getElementById("subMenu");
            m.style.display = "none";
        }
    </script>

</head>

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
    <!--======== end header =========-->

<%
// 可以看别人的用户页面，不一定只看自己的用户页面
String show_user_id=new String(request.getParameter("show_user_id"));
String show_user;
if (show_user_id.equals(user_id))
    show_user="我";
else
    show_user="TA";
%>
    <!--======== support =========-->
    <section class="support">
        <img src="Pictures/back1.png" width=60% style="vertical-align: middle" align=right />
        <span align=right><br><br><br><br><br>
            <p>
                <font size="+3"><em class="fa fa-user"></em> 
                <%  
                java.sql.Connection conn;
                java.sql.Statement stmt1;
                java.sql.ResultSet rst0,rst1,rst2,rst3,rst4,rst5,rst6;
                try
                {
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
                    //replace sql_password with your own password of sql 
                    stmt1=conn.createStatement(); 
                    String sql0= "select user_id,user_name,gender,level,birthday,email,reg_date from users where (user_id="+show_user_id+")";      
                    rst0=stmt1.executeQuery(sql0);
                    while(rst0.next())
                    {
                        String name = rst0.getString("user_name");
                        String gender = rst0.getString("gender");
                        String level = rst0.getString("level");
                        String birthday = rst0.getString("birthday");
                        String email = rst0.getString("email");
                        String reg_date = rst0.getString("reg_date");
                        // session.setAttribute("user_id", user_id);
                    %>
                    <div class="one_post">
                    <hr>
                    <a>
                    <p><font size="+2"><%=name %></font></p>
                    
                    <p>#ID: <%=show_user_id %> &emsp;
                    等级：<%=level %></p>
                    <p>生日：<%=birthday %>&emsp;
                    email：<%=email %></p>
                    <p>注册时间: <%=reg_date %></p>
                    </a>
                    </div>
                    <%
                    }%>
				
				</font>
        </span>
    </section>
    <section class="support">
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="media">
                                    
                                    <div class="media-body">
                                        <h3><font size="+2"><em class="fa fa-video-camera"></em></font> <%=show_user%>的视频热度榜</h3>
                                        <hr>
                                        <%
                                        String sql4= "select video_id,title from videos where video_user_id="+show_user_id+" order by visit_num limit 6";
                                        rst4=stmt1.executeQuery(sql4);
                                        while(rst4.next())
                                        {
                                            String title = rst4.getString("title");
                                            int video_id = rst4.getInt("video_id");
                                            %>
                                        
                                        <a href="video.jsp?video_id=<%=video_id %>"><%=title %></a><br>
                                        
                                        <%
                                        }
                
                                        %>



                                    </div>
                           
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="media">
                                    
                                    <div class="media-body">
                                        <h3><font size="+2"><em class="fa fa-paperclip"></em></font> <%=show_user%>的资料浏览榜</h3>
                                        <hr>
                                        <%
                                        String sql5= "select file_id,title from files where file_user_id="+show_user_id+" order by reply_num limit 6";
                                        rst5=stmt1.executeQuery(sql5);
                                        while(rst5.next())
                                        {
                                            String title = rst5.getString("title");
                                            int file_id = rst5.getInt("file_id");
                                            %>
                                        
                                        <a href="show_material.jsp?file_id=<%=file_id %>"><%=title %></a><br>
                                        
                                        <%
                                        }

                                        %>
                                    </div>
                              
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="media">
                                
                                    
                                    <div class="media-body">
                                        <h3><font size="+2"><em class="fa fa-bullhorn"></em></font> <%=show_user%>发布的热帖</h3>
                                        <hr>
                                        <%
                                        String sql6= "select post_id,title from posts where post_user_id="+show_user_id+" order by reply_num limit 6";
                                        rst6=stmt1.executeQuery(sql6);
                                        while(rst6.next())
                                        {
                                            String title = rst6.getString("title");
                                            int post_id = rst6.getInt("post_id");
                                            %>
                                        
                                        <a href="post.jsp?post_id=<%=post_id %>"><%=title %></a><br>
                                        
                                        <%
                                        }

                                        %>
                                    </div>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--======== end support =========-->

    <!--======== Our Services =========-->

    <!--======== end Our Services =========-->

    <!--======== 版块速览 =========-->
    <section class="版块速览">
        <div class="container">
            <p align="top" style="font-size: 40"><%=show_user%>的印迹<br><br>
                <hr>
            </p>
        </div>
        <div class="container" id="视频区">
            <div class="row">
                <div class="col-md-5 col-xs-12 col-lg-3 col-lg-offset-1">
                    <div class="about-content">
                        <br><br><br>
                        <h1 class="section-title"><em class="fa fa-video-camera"></em> <%=show_user%>的视频</h1>
                        

                    </div>
                </div>
                <div class="col-md-7 col-xs-12">
                    <div class="about-img">
                        <p>
                        <%
                                    stmt1=conn.createStatement(); 
                                    String sql1= "select video_id,title,video_user_name,path,visit_num,time from videos where video_user_id="+show_user_id+" order by visit_num";
                                    rst1=stmt1.executeQuery(sql1);
                                    while(rst1.next())
                                    {
                                    	int video_id=rst1.getInt("video_id");
                                        String title = rst1.getString("title");
                                        String video_user_name = rst1.getString("video_user_name");
                                        String path = rst1.getString("path");
                                        String visit_num = rst1.getString("visit_num");
                                        String time = rst1.getString("time");

                                        // session.setAttribute("user_id", user_id);
                                    %>
                                    <div class="one_post">
                                    <hr>
                                    <a>
                                    <p><%=title %></p>
                                    <p><a href="video.jsp?video_id=<%=video_id %>"><%=title %></a></p>
                                    <p>访问数<%=visit_num %></p>
                                    <p><%=time %></p>
                                    </a>
                                    </div>
                                    <%
                                    }
                                    %>
                        </p>
		
                                
                            </p>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="container" id="资料区">
            <div class="row">
                <div class="col-md-5 col-xs-12 col-lg-offset-1 col-lg-3">
                    <div class="about-content">
                        <br><br><br>
                        <h1 class="section-title"><em class="fa fa-paperclip"></em> <%=show_user%>的资料</h1>
                   
                    </div>
                </div>
                <div class="col-md-7 col-xs-12">
                    <div class="about-img">
                        <p>
                            <%
                                String sql3= "select file_id,title,file_user_name,reply_num,time from files where file_user_id="+show_user_id+" order by reply_num";
                                rst3=stmt1.executeQuery(sql3);
                                while(rst3.next())
                                {
                                	int file_id=rst3.getInt("file_id");
                                    String title = rst3.getString("title");
                                    String reply_num = rst3.getString("reply_num");
                                    //String content = rst3.getString("content");
                                    String file_user_name = rst3.getString("file_user_name");
                                    String time = rst3.getString("time");
                                    // session.setAttribute("user_id", user_id);
                                %>
                                <div class="one_post">
                                <hr>
                                <a>
                                <p><%=title %></p>
                                <p><a href="show_material.jsp?file_id=<%=file_id %>"><%=title %></a></p>
                                <p>回复数<%=reply_num %></p>
                                <p><%=time %></p>
                                </a>
                                </div>
                                <%
                                }
                                %>
                        </p>
                   </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="container" id="论坛区">
            <div class="row">
                <div class="col-md-5 col-xs-12 col-lg-offset-1 col-lg-3">
                    <div class="about-content">
                        <br><br><br>
                        <h1 class="section-title"><em class="fa fa-bullhorn"></em> <%=show_user%>发布的帖子</h1>
                        
                    </div>
                </div>
                <div class="col-md-7 col-xs-12">
                    <div class="about-img">
                            <p>
                                    <%
                                        String sql2= "select post_id,title,post_user_name,content,reply_num,time from posts where post_user_id="+show_user_id+" order by reply_num";
                                        rst2=stmt1.executeQuery(sql2);
                                        while(rst2.next())
                                        {
                                        	int post_id=rst2.getInt("post_id");
                                            String title = rst2.getString("title");
                                            String reply_num = rst2.getString("reply_num");
                                            String content = rst2.getString("content");
                                            String post_user_name = rst2.getString("post_user_name");
                                            String time = rst2.getString("time");
                                            // session.setAttribute("user_id", user_id);
                                        %>
                                        <div class="one_post">
                                        <hr>
                                        <a>
                                        <p><a href="post.jsp?post_id=<%=post_id %>"><%=title %></a></p>
                                        <p>回复数<%=reply_num %></p>
                                        <p><%=time %></p>
                                        </a>
                                        </div>
                                        
                                        <%
                                        }
                }
                                        catch(java.sql.SQLException e)
                                    	{
                                    		out.println(e.toString());
                                    	}
                                        %>
                                </p>                    </div>
                </div>
            </div>
        </div>
    </section>
			
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