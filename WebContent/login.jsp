<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,javax.servlet.*,javax.servlet.http.*" %>
<html lang="zh-cmn-Hans">
<!--  -->
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
                            <a class="scroll" href="#home"><img src="Pictures/logo_sub.png" width="182" height="70"
                                    align=top /> </a>
                        </div>

                        <div class="collapse navbar-collapse top-nav" id="menu-4">
                            <ul class="nav navbar-nav navbar-right">
                                <li></li>
                                <li>
                                    <a class="scroll" href="#team">
                                        <font size=4 face="Microsoft Yahei light"><em class="fa fa-video-camera"></em>
                                            视频区
                                        </font>
                                    </a>
                                </li>
                                <li>
                                    <a class="scroll" href="#clients">
                                        <font size=4 face="Microsoft Yahei light"><em class="fa fa-paperclip"></em> 资料区
                                        </font>
                                    </a>
                                </li>
                                <li>
                                    <a class="scroll" href="#contact">
                                        <font size=4 face="Microsoft Yahei light"><em class="fa fa-bullhorn"></em> 论坛区
                                        </font>
                                    </a>
                                </li>
                                <li><button type="button" class="btn btn-default navbar-btn">注册/登录</button></li>
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
            <p style="font-size: 30;" align="right">Share, Gain and Succeed
            </p><br><br>
            <p style="font-size: 24" align="right">在这里，收获你想要的</p>
        </span>
    </section>
    <section class="support">
        <div class="container">
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <%
	String user_id=new String(request.getParameter("user_id"));
	String password=new String(request.getParameter("password"));
	
	//out.print(userno);
	if(user_id.equals("")||user_id==null||password.equals("")||password==null){
		%>
                    <script>
                        alert("输入不能为空！");
                        window.location.href = "welcome.jsp";
                    </script>
                    <%
	}
	
	java.sql.Connection conn;
	java.sql.Statement stmt1;
	java.sql.Statement stmt2;
	java.sql.ResultSet rst1;
	java.sql.ResultSet rst2;
	try{
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
		stmt2=conn.createStatement();
		String sql1= "select user_id from users where (user_id="+user_id+")and (password='"+password+"')";
		String sql2= "select password from users where user_id='"+user_id+"'";
		rst1=stmt1.executeQuery(sql1);
		rst2=stmt2.executeQuery(sql2);
		if(rst1.next())
		{
            session.setAttribute("user_id", user_id);
			%>
                    <script>
                        window.location.href = "index.jsp?UserNo=<%=user_id %>"; //**** is the user page
                    </script>
                    <%
		}
		else if(rst2.next())
		{
			out.println("密码错误，请重新登录！");
			%>
                    <br> <a href="welcome.jsp">返回登录</a>
                    <%
		}
		else
		{
			out.println("用户名不存在，请注册！");	
			%>
                    <br> <a href="register_page.jsp">前往注册</a>
                    <br> <a href="welcome.jsp">返回登录</a>
                    <%
		}
		rst1.close();
		rst2.close();
		stmt1.close();
		stmt2.close();
		conn.close();
	}
	catch(java.sql.SQLException e)
	{
		out.println(e.toString());
	}
%>
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
            <p align="top" style="font-size: 50">今日推荐<br><br>
                <hr>
            </p>
        </div>
        <div class="container" id="视频区">
            <div class="row">
                <div class="col-md-5 col-xs-12 col-lg-5">
                    <div class="about-content">
                        <br><br><br>
                        <h1 class="section-title"><em class="fa fa-video-camera"></em> 视频区</h1>
                        <p>说些什么好呢<br> I don't know what to say...</p>

                    </div>
                </div>
                <div class="col-md-7 col-xs-12">
                    <div class="about-img">
                        <p>这里应该是用JSP提取一些播放量最高的视频放出来链接</p>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="container" id="资料区">
            <div class="row">
                <div class="col-md-5 col-xs-12 col-lg-5">
                    <div class="about-content">
                        <br><br><br>
                        <h1 class="section-title"><em class="fa fa-paperclip"></em> 资料区</h1>
                        <p>说些什么好呢<br> I don't know what to say...</p>

                    </div>
                </div>
                <div class="col-md-7 col-xs-12">
                    <div class="about-img">
                        <p>这里应该是用JSP提取一些浏览量最高的资料放出来链接</p>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="container" id="论坛区">
            <div class="row">
                <div class="col-md-5 col-xs-12 col-lg-5">
                    <div class="about-content">
                        <br><br><br>
                        <h1 class="section-title"><em class="fa fa-bullhorn"></em> 论坛区</h1>
                        <p>说些什么好呢<br> I don't know what to say...</p>

                    </div>
                </div>
                <div class="col-md-7 col-xs-12">
                    <div class="about-img">
                        <p>这里应该是用JSP提取一些回复数最高的帖子放出来链接</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--======== end about us =========-->

    <!--======== Our portfolio =========-->
    <section id="portfolio" class="work">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 text-center">
                    <h1 class="section-title">Our Portfolio</h2>
                        <p class="section-para">Lorem ipsum dolor sit amet reprehenderit, enim eiusmod high life
                            accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard
                            dolor brunch. Food truck quinoa nesciunt laborum eiusmod cusamus terry.</p>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="col-md-3">
                        <div class="single-work"><img src="images/work-1.jpg" alt="">
                            <div class="service-overflow">
                                <ul class="list-inline work-links text-center">
                                    <li><i class="lnr lnr-magnifier"></i></li>
                                    <li><i class="lnr lnr-link"></i></li>
                                    <li><i class="lnr lnr-thumbs-up"></i></li>
                                </ul>
                            </div>
                        </div>

                        <div class="single-work"><img src="images/work-2.jpg" alt="">
                            <div class="service-overflow">
                                <ul class="list-inline work-links text-center">
                                    <li><i class="lnr lnr-magnifier"></i></li>
                                    <li><i class="lnr lnr-link"></i></li>
                                    <li><i class="lnr lnr-thumbs-up"></i></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="single-work"><img src="images/work-2.jpg" alt="">
                            <div class="service-overflow">
                                <ul class="list-inline work-links text-center">
                                    <li><i class="lnr lnr-magnifier"></i></li>
                                    <li><i class="lnr lnr-link"></i></li>
                                    <li><i class="lnr lnr-thumbs-up"></i></li>
                                </ul>
                            </div>
                        </div>

                        <div class="single-work"><img src="images/work-1.jpg" alt="">
                            <div class="service-overflow">
                                <ul class="list-inline work-links text-center">
                                    <li><i class="lnr lnr-magnifier"></i></li>
                                    <li><i class="lnr lnr-link"></i></li>
                                    <li><i class="lnr lnr-thumbs-up"></i></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="single-work"><img src="images/work-1.jpg" alt="">
                            <div class="service-overflow">
                                <ul class="list-inline work-links text-center">
                                    <li><i class="lnr lnr-magnifier"></i></li>
                                    <li><i class="lnr lnr-link"></i></li>
                                    <li><i class="lnr lnr-thumbs-up"></i></li>
                                </ul>
                            </div>
                        </div>

                        <div class="single-work"><img src="images/work-2.jpg" alt="">
                            <div class="service-overflow">
                                <ul class="list-inline work-links text-center">
                                    <li><i class="lnr lnr-magnifier"></i></li>
                                    <li><i class="lnr lnr-link"></i></li>
                                    <li><i class="lnr lnr-thumbs-up"></i></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="single-work"><img src="images/work-2.jpg" alt="">
                            <div class="service-overflow">
                                <ul class="list-inline work-links text-center">
                                    <li><i class="lnr lnr-magnifier"></i></li>
                                    <li><i class="lnr lnr-link"></i></li>
                                    <li><i class="lnr lnr-thumbs-up"></i></li>
                                </ul>
                            </div>
                        </div>

                        <div class="single-work"><img src="images/work-1.jpg" alt="">
                            <div class="service-overflow">
                                <ul class="list-inline work-links text-center">
                                    <li><i class="lnr lnr-magnifier"></i></li>
                                    <li><i class="lnr lnr-link"></i></li>
                                    <li><i class="lnr lnr-thumbs-up"></i></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--======== end Our Work =========-->

    <!--======== our Team =========-->
    <section id="team" class="our-experts">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 text-center">
                    <h1 class="section-title">Our Team</h2>
                        <p class="section-para">Lorem ipsum dolor sit amet reprehenderit, enim eiusmod high life
                            accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard
                            dolor brunch. Food truck quinoa nesciunt laborum eiusmod cusamus terry.</p>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-3">
                    <div class="expert-box">
                        <img src="images/team-1.jpg" alt="">
                        <div class="expert-overflow">
                            <ul class="list-inline text-center">
                                <li><i class="fa fa-facebook"></i></li>
                                <li><i class="fa fa-twitter"></i></li>
                                <li><i class="fa fa-google-plus"></i></li>
                            </ul>
                        </div>
                        <div class="name-plate text-center">
                            <h3 class="expert-name">Peter Bruke</h3>
                            <strong class="expert-tag">Founder / CEO</strong>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="expert-box">
                        <img src="images/team-2.jpg" alt="">
                        <div class="expert-overflow">
                            <ul class="list-inline text-center">
                                <li><i class="fa fa-facebook"></i></li>
                                <li><i class="fa fa-twitter"></i></li>
                                <li><i class="fa fa-google-plus"></i></li>
                            </ul>
                        </div>
                        <div class="name-plate text-center">
                            <h3 class="expert-name">Jack alfred </h3>
                            <strong class="expert-tag">Co - founder</strong>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="expert-box">
                        <img src="images/team-3.jpg" alt="">
                        <div class="expert-overflow">
                            <ul class="list-inline text-center">
                                <li><i class="fa fa-facebook"></i></li>
                                <li><i class="fa fa-twitter"></i></li>
                                <li><i class="fa fa-google-plus"></i></li>
                            </ul>
                        </div>
                        <div class="name-plate text-center">
                            <h3 class="expert-name">Neal Potter</h3>
                            <strong class="expert-tag">Co - founder</strong>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="expert-box">
                        <img src="images/team-2.jpg" alt="">
                        <div class="expert-overflow">
                            <ul class="list-inline text-center">
                                <li><i class="fa fa-facebook"></i></li>
                                <li><i class="fa fa-twitter"></i></li>
                                <li><i class="fa fa-google-plus"></i></li>
                            </ul>
                        </div>
                        <div class="name-plate text-center">
                            <h3 class="expert-name">Neal Potter</h3>
                            <strong class="expert-tag">Co - founder</strong>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </section>
    <!--======== end our Genius =========-->

    <!--======== extra featrue =========-->
    <section class="extra-feature">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 text-center">
                    <h1 class="section-title">Promo Compatibility</h2>
                        <p class="section-para">Lorem ipsum dolor sit amet reprehenderit, enim eiusmod high life
                            accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard
                            dolor brunch. Food truck quinoa nesciunt laborum eiusmod cusamus terry.</p>
                        <ul class="list-inline platform text-center">
                            <li><i class="lnr lnr-screen"></i><span>Relability</span></li>
                            <li><i class="lnr lnr-laptop-phone"></i><span>Responsive</span></li>
                            <li><i class="lnr lnr-smartphone"></i><span>Comfortable</span></li>
                        </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-10 col-md-offset-1">
                    <div class="e-feature">
                        <img class="feature-img" src="images/compatibility-img.png" alt="" />
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--======== end extra featrue =========-->

    <!--======== our sponsors =========-->
    <section id="clients" class="our-sponsors">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 text-center">
                    <h1 class="section-title">Trusted By People</h2>
                        <p class="section-para">Lorem ipsum dolor sit amet reprehenderit, enim eiusmod high life
                            accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard
                            dolor brunch. Food truck quinoa nesciunt laborum eiusmod cusamus terry.</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <ul class="list-inline sponsor-logo text-center">
                        <li><img class="img-responsive" src="images/microsoft.png" alt="client log" /></li>
                        <li><img class="img-responsive" src="images/instagram.png" alt="client log" /></li>
                        <li><img class="img-responsive" src="images/google.png" alt="client log" /></li>
                        <li><img class="img-responsive" src="images/converse.png" alt="client log" /></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="people">
                        <p>Lorem ipsum dolor sit amet reprehenderit, enim eiusmod high life accusamus terry richardson
                            ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch.</p>
                        <div class="media">
                            <div class="media-left">
                                <img class="media-object" src="images/client-1.png" alt="sponsor image">
                            </div>
                            <div class="media-body">
                                <h3 class="media-heading">K.Dutchmane</h3>
                                <strong>Co-Founder- ThemeForest</strong>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="people">
                        <p>Lorem ipsum dolor sit amet reprehenderit, enim eiusmod high life accusamus terry richardson
                            ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch.</p>
                        <div class="media">
                            <div class="media-left">
                                <img class="media-object" src="images/client-1.png" alt="sponsor image">
                            </div>
                            <div class="media-body">
                                <h3 class="media-heading">K.Dutchmane</h3>
                                <strong>Co-Founder- ThemeForest</strong>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="people">
                        <p>Lorem ipsum dolor sit amet reprehenderit, enim eiusmod high life accusamus terry richardson
                            ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch.</p>
                        <div class="media">
                            <div class="media-left">
                                <img class="media-object" src="images/client-1.png" alt="sponsor image">
                            </div>
                            <div class="media-body">
                                <h3 class="media-heading">K.Dutchmane</h3>
                                <strong>Co-Founder- ThemeForest</strong>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--======== end recent evnt =========-->

    <!--======== contact =========-->
    <section id="contact" class="contact">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-md-offset-2 text-center">
                    <h1 class="section-title">Contact Us</h2>
                        <p class="section-para">Lorem ipsum dolor sit amet reprehenderit, enim eiusmod high life
                            accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard
                            dolor brunch. Food truck quinoa nesciunt laborum eiusmod cusamus terry.</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-md-offset-2">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="sr-only" for="exampleInputEmail3">Your Name</label>
                                <input type="text" class="form-control" id="exampleInputEmail3" placeholder="Your Name">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="sr-only" for="exampleInputEmail3">Your Email</label>
                                <input type="Email" class="form-control" id="exampleInputEmail3"
                                    placeholder="Your Email">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="sr-only" for="exampleInputEmail3">Phone</label>
                                <input type="tel" class="form-control" id="exampleInputEmail3" placeholder="Phone">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group">
                                <label class="sr-only" for="exampleInputEmail3">Massage</label>
                                <textarea class="form-control textarea" rows="5" placeholder="Massage"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8 col-md-offset-2">
                    <div class="row">
                        <div class="col-md-8 col-md-offset-2">
                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-default ">Send Massage</button>
                            </div>
                        </div>
                    </div>
                    <ul class="list-inline social-links text-center">
                        <li><i class="fa fa-facebook"></i></li>
                        <li><i class="fa fa-Twitter"></i></li>
                        <li><i class="fa fa-google-plus"></i></li>
                        <li><i class="fa fa-dribbble"></i></li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <!--======== end contact =========-->

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