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

    <!--======== intro =========-->
    <!--======== end intro =========-->

    <!--======== support =========-->
    <section class="support">
        <img src="Pictures/back-narrow.png" width=60% style="vertical-align: middle" align=right />
        
    </section>
    <section class="support">
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
					<br>
					<div class="row" align=right>
						<form action="search.jsp" >
							<input type="text" name = "search_box" id = "search_box" size=24/>&ensp;

							<input type="submit" onclick="search.jsp" class="btn navbar-btn" value="搜索"/>

						</form>
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
            <p align="top" style="font-size: 40"><em class="fa fa-bullhorn"></em> 论坛区<br><br>
                <hr>
            </p>
        </div>
        <div class="container" id="数学">
            <div class="row">
                <div class="col-md-5 col-xs-12 col-lg-4">
                    <div class="about-content">
                        <br><br><br>
                        <h1 class="section-title"><em class="fa fa-superscript"></em> 数学</h1>

                    </div>
                </div>
                <div class="col-md-7 col-xs-12">
                    <div class="about-img">
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
                            java.sql.Connection conn2;
                            java.sql.Statement stmt2;
                            java.sql.ResultSet rst2;
                            try {
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                conn2 = java.sql.DriverManager.getConnection("jdbc:mysql://"+dbip+":3306/mydb?serverTimezone=UTC", "root", dbpassword);
                                stmt2 = conn2.createStatement();
                                String sql2 = "select * from posts where block_id=1 order by reply_num desc";
                                rst2 = stmt2.executeQuery(sql2);
                                %>
                        <%
                        while(rst2.next()){
                        	String title = rst2.getString("title");
                            //String content = rst.getString("Content");
                            int post_id = rst2.getInt("post_id");
                            String post_user_name = rst2.getString("post_user_name");
                               int post_user_id = rst2.getInt("post_user_id");
                            String time = rst2.getString("time");
                            int reply_num = rst2.getInt("reply_num");
                            %>
                            <div class="one_post">
                            
                            <a>
                            <p>#<%=post_id %></p>
                            <p><a href="post.jsp?post_id=<%=post_id %>"><%=title %></a></p>
                                作者：<a href="user.jsp?show_user_id=<%=post_user_id%>"><%=post_user_name %></a>
                            &emsp;回复数：<%=reply_num %>
                            &emsp;<%=time %><hr>
                            </a>
                            </div>
                            <%
                        }	
                        rst2.close();
                        stmt2.close();
                        conn2.close();
                        
                            } catch (java.sql.SQLException e) {
                                out.println(e.toString());
                            }
                        %>
                        


                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="container" id="计算机">
            <div class="row">
                <div class="col-md-5 col-xs-12 col-lg-4">
                    <div class="about-content">
                        <br><br><br>
                        <h1 class="section-title"><em class="fa fa-laptop"></em> 计算机</h1>

                    </div>
                </div>
                <div class="col-md-7 col-xs-12">
                    <div class="about-img">
                            <%
                            java.sql.Connection conn1;
                            java.sql.Statement stmt1;
                            java.sql.ResultSet rst1;
                            try {
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                conn1 = java.sql.DriverManager.getConnection("jdbc:mysql://"+dbip+":3306/mydb?serverTimezone=UTC", "root", dbpassword);
                                stmt1 = conn1.createStatement();
                                String sql1 = "select * from posts where block_id=2 order by reply_num desc";
                                rst1 = stmt1.executeQuery(sql1);
                                %>
                        <%
                        while(rst1.next()){
                        	String title = rst1.getString("title");
                            //String content = rst.getString("Content");
                            int post_id = rst1.getInt("post_id");
                            String post_user_name = rst1.getString("post_user_name");
                               int post_user_id = rst1.getInt("post_user_id");
                            String time = rst1.getString("time");
                            int reply_num = rst1.getInt("reply_num");
                            %>
                            <div class="one_post">
                            
                            <a>
                            <p>#<%=post_id %></p>
                            <p><a href="post.jsp?post_id=<%=post_id %>"><%=title %></a></p>
                                作者：<a href="user.jsp?show_user_id=<%=post_user_id%>"><%=post_user_name %></a>
                            &emsp;回复数：<%=reply_num %>
                            &emsp;<%=time %><hr>
                            </a>
                            </div>
                            <%
                        }	
                        rst1.close();
                        stmt1.close();
                        conn1.close();
                        
                            } catch (java.sql.SQLException e) {
                                out.println(e.toString());
                            }
                        %>

                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="container" id="英语">
            <div class="row">
                <div class="col-md-5 col-xs-12 col-lg-4">
                    <div class="about-content">
                        <br><br><br>
                        <h1 class="section-title"><em class="fa fa-language"></em> 英语</h1>

                    </div>
                </div>
                <div class="col-md-7 col-xs-12">
                    <div class="about-img">
                        <%
                        java.sql.Connection conn;
                        java.sql.Statement stmt;
                        java.sql.ResultSet rst;
                        try {
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            conn = java.sql.DriverManager.getConnection("jdbc:mysql://"+dbip+":3306/mydb?serverTimezone=UTC", "root", dbpassword);
                            stmt = conn.createStatement();
                            String sql = "select * from posts where block_id=3 order by reply_num desc";
                            rst = stmt.executeQuery(sql);
                            %>
                    <%
                    while(rst.next()){
                    	String title = rst.getString("title");
                        //String content = rst.getString("Content");
                        int post_id = rst.getInt("post_id");
                        String post_user_name = rst.getString("post_user_name");
                           int post_user_id = rst.getInt("post_user_id");
                        String time = rst.getString("time");
                        int reply_num = rst.getInt("reply_num");
                        %>
                        <div class="one_post">
                        
                        <a>
                        <p>#<%=post_id %></p>
                        <p><a href="post.jsp?post_id=<%=post_id %>"><%=title %></a></p>
                            作者：<a href="user.jsp?show_user_id=<%=post_user_id%>"><%=post_user_name %></a>
                        &emsp;回复数：<%=reply_num %>
                        &emsp;<%=time %><hr>
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
                        

                    </div>
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