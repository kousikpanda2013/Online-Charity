
<!DOCTYPE HTML>
<html>
<head>
    <link rel="stylesheet" href="css/uploadnews.css" type="text/css" media="all" />

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
<body onload="myFunction()">
<!-- header -->
<div class="header">
    <div class="logo">
        <h1><a href="adminafterlogin.html">Charity</a></h1>
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
<div class="news">
    <div class="upload">
        <div class="upload-main">
            <h3>Upload News</h3>
            <form action="UploadNews" method="post" style="text-align: center">
                <input type="text" class="text" name="newsserialno" placeholder="Enter News Serial No " required><br>
                <input type="text" class="text" name="newsbriefly" maxlength="200" placeholder="Enter News Briefly" required><br>
                <input type="text" class="text" name="date"  id="demo" readonly required><br>
                <script>
                    function myFunction() {
                        var date_now= new Date();
                        var str_date=date_now.getDate() +'-';
                        str_date+=date_now.getMonth()+'-';
                        str_date+=date_now.getFullYear();
                        document.getElementById('demo').value= str_date;
                    }
                </script>
                <div class="addnews">
                    <input name="submit" class="button1" type="submit" value="Add"><br>
                </div>
            </form>
            <div class="clear"> </div>
            <div class="newsuploaddetails">
                <form action="" method="post">
                <input type="submit" class="button2" name="newsupload" value="News Upload Details">
                </form>
            </div>
        </div>
    </div>
</div>
<div class="adminnewsuploaddetails" id="adminnewsuploaddetails">
    <%@ page import ="java.sql.*" %>
    <%
        if(request.getParameter("newsupload")!=null) {
    %>
    <div id="adminnews">
        <%
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");
            st = con.createStatement();
            rs = st.executeQuery("select * from news ORDER BY publish_date DESC");
            boolean a = rs.next();
            if (a) {
        %>
        <table id="adminupload">
            <tr>
                <th style='text-align:center'>News Id</th>
                <th style='text-align:center'>News</th>
                <th style='text-align:center'>Publish Date</th>
                <th style='text-align:center'></th>
            </tr>
            <%
                while (a) {
            %>
            <form action="newsdelete.jsp" method="post">
            <tr>
                <td> <input type="text" id="newsid" name="newsid" value="<%=rs.getString(1)%>" readonly></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
                <td><input type="submit" class="button3" name="delete" value="Delete"></td>
            </tr>
            </form>
            <%
                    a = rs.next();
                }

            %>
        </table>
        <input type="button" class="button1" onclick="printDiv('adminnews')" value="Print" />
        <%
                }
            }
            else
            {

            }
        %>
        <div class="clearfix"></div>
    </div>
    <script type="text/javascript">
        function printDiv(adminnews) {
            var printContents = document.getElementById(adminnews).innerHTML;
            var originalContents = document.body.innerHTML;
            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
        }
    </script>
</div>

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