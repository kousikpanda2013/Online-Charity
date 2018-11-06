<!DOCTYPE HTML>
<html>
<head>
    <style>
        body{
            text-align: center;
        }

        #outer-div{

            text-align:center;
            background-color:#EEEEE9;
            width:80%;
            min-height: 200px;
            margin:30px 10%;
            border-radius: 7px;
            border: 2px solid;

        }

        #inner-left{
            width:150px;
            left:5px;
            background-color:#545B62;
            float:left;
            clear: right;
            margin:5px;
            border-radius: 30px;
            color: white;
        }
        #inner-right{
            width:150px;
            right:5px;
            background-color:yellow;
            float:right;
            margin:5px;
            border-radius: 30px;
        }
        #inner-center{
            clear:both;
            text-align:center;

            word-break: break-all;
            padding:50px 80px;
        }

    </style>
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
    <script type='text/javascript' src="js/jquery-1.11.1.min.js"></script>
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event){
                event.preventDefault();
                $('html,body').animate({scrollTop:$(this.hash).offset().top},1200);
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function() {
            $().UItoTop({ easingType: 'easeOutQuart' });
        });
    </script>
</head>
<body>
<!-- header -->
<div class="header">
    <div class="logo">
        <h1><a href="index.html">Charity</a></h1>
    </div>
    <div class="header-top">
        <div class="head-nav">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="index.html">Home </a></li>
                            <li><a href="news.jsp">News</a></li>
                            <li><a href="gallery.jsp">Gallery</a></li>
                            <li><a href="contact.html">Contact</a></li>
                            <li><a href="volunteer.html">Volunteer</a></li>
                            <li><a href="donorlogin.html">Donate</a></li>
                            <li><a href="adminlogin.html">Admin</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <div class="clearfix"> </div>
    </div>
    <div class="clearfix"> </div>
</div>

<div class="news-bg" >
    <div class="distracted">
        <%@ page import ="java.sql.*" %>
        <%
            Connection con=null;
            Statement st=null;
            ResultSet rs=null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
            st=con.createStatement();
            rs=st.executeQuery("select * from news ORDER BY publish_date DESC");
            boolean a=rs.next();
                while(a)
                {
                  %>
        <div id='outer-div'>
            <div id='inner-left'>
               News Id:<%=rs.getString(1)%>
            </div>
            <div id='inner-right'>
               Posted On:<%=rs.getString(3)%>
            </div>
            <div id='inner-center'>
                <h2><%=rs.getString(2)%></h2>

            </div>
        </div>



          <%
                  a=rs.next();

            }
        %>
    </div>
    <div class="clearfix"></div>

</div>



<div class="footer">
    <div class="container">
        <div class="col-md-3 footer-left">
            <h3>Mobile</h3>
            <p>8001993699</p>
        </div>
        <div class="col-md-3 footer-left">
            <h3>E-Mail Us</h3>
            <p>onlinecharity1@gmail.com</p>
        </div>
        <div class="col-md-3 footer-left">
            <h3>Follow Us</h3>
            <ul>
                <li><a href="https://www.facebook.com/Online-charity-578452189177752/"><i class="facebok"> </i></a></li>
                <li><a href="https://twitter.com/?request_context=signup"><i class="twiter"> </i></a></li>
                <li><a href="https://plus.google.com/u/2/discover"><i class="goog"> </i></a></li>
                <div class="clearfix"></div>
            </ul>
        </div>
        <div class="col-md-3 footer-left">
            <h3>Address</h3>
            <p>Koel Campus,KIIT,Bhubaneswar,India</p>
        </div>
        <div class="clearfix"></div>
        <div class="foot-bottom" id="footbottom">
            <p>Copyrights © 2018 Charity. All rights reserved </p>
        </div>
    </div>
</div>
<!-- footer -->
</body>
</html>