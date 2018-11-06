
<!DOCTYPE HTML>
<html>
<head>
    <style>
        #message {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        #message td, #message th {
            border: 1px solid #ddd;
            padding: 8px;
        }

        #message tr:nth-child(even){background-color: #f2f2f2;}

        #message tr:hover {background-color: #ddd;}

        #message th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: left;
            background-color: #4CAF50;
            color: white;
        }
        .button {
            background-color: #4CAF50;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
        #email{
            width: inherit;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            background-color: transparent;
            border-style: none;
        }

    </style>


    <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- jQuery (necessary JavaScript plugins) -->
    <script type='text/javascript' src="js/jquery-1.11.1.min.js"></script>
    <!-- Custom Theme files -->
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <!-- Custom Theme files -->
    <!--//theme-style-->
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
        <h1><a href="#">Charity</a></h1>
    </div>
    <!-- start header menu -->
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
                            <li><a href="uploadnews.jsp">News</a></li>
                            <li><a href="uploadimage.html">Image</a></li>
                            <li><a href="donordetails.jsp">Donor</a></li>
                            <li><a href="volunteerdetails.jsp">volunteer</a></li>
                            <li><a href="message.jsp">Message</a></li>
                            <li><a href="adminchangepassword.html">Change Password</a></li>
                            <li><a href="AdminLogout">Logout</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <div class="clearfix"> </div>
        <!-- search-scripts -->
        <!-- //search-scripts -->
    </div>
    <div class="clearfix"> </div>
</div>
<!-- header -->
<%@ page import ="java.sql.*" %>
    <%
    Connection con=null;
    Statement st=null;
    ResultSet rs=null;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
    st=con.createStatement();
    rs=st.executeQuery("select * from contact ");
    boolean a=rs.next();
    if(a)
    {
    %>
     <table id="message">
    <tr>
        <th style='text-align:center'>Name</th>
        <th style='text-align:center'>Email</th>
        <th style='text-align:center'>Mobile No</th>
        <th style='text-align:center'>Message</th>
        <th></th>
    </tr>
         <%
    while(a)
    {

        %>
         <form action="reply.jsp" method="post">
    <tr>
        <td><%=rs.getString(1)%></td>
        <td><input type="text" id="email" name="email" value="<%=rs.getString(2)%>" readonly></td>
        <td><%=rs.getString(3)%></td>
        <td style='word-break: break-all;'><%=rs.getString(4)%></td>
        <td><input type="submit" class="button" value="Reply" ></td>
    </tr>
         </form>
    <%
        a=rs.next();

    }
    %>
    </table>
    <%
    }
    else
        {

        }
    %>
<div class="clearfix"></div>
<!-- footer -->
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
</body>
</html>