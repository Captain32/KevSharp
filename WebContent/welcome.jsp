<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>

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
        <img src="Pictures/back1.png" width=60% style="vertical-align: middle" align=right />
        <span><br><br><br><br><br>
            <p align="right">
                <font size="+3">Share, Gain and Succeed</font>
            </p><br><br>
            <p align="right">
                <font size="+2">在这里，收获你想要的</font>
            </p>
        </span>
    </section>
    <section class="support">
        <div class="container" align="center">
            <form class="center" action="" method="post">
                <label>
                    <font color="white">账号：</font>
                </label>
                <input name="user_id" type="text">
                <br>
                <label>
                    <font color="white">密码：</font>
                </label>
                <input name="password" type="password">
                <br>
                <input id="submitButton" type="submit" class="btn btn-primary navbar-btn" value="登录"
                    onclick="javascript:this.form.action='login.jsp'" />
                <input id="registerButton" class="btn btn-primary navbar-btn" type="submit" value="注册"
                    onclick="javascript:this.form.action='register.jsp'" />
            </form>
        </div>
    </section>
    <!--======== end support =========-->

    <!--======== Our Services =========-->

    <!--======== end Our Services =========-->



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