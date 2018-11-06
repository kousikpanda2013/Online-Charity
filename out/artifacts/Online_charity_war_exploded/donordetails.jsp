
<!DOCTYPE HTML>
<html>
<head>

    <link rel="stylesheet" href="css/donordetails.css" type="text/css" media="all" />


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
<!-- co-ntact -->
<button class="accordion">Cloth Donor Details</button>
<div class="panel">
<div class="donordetails-bg" id="clothdonordetails" >
    <%@ page import ="java.sql.*" %>
    <%
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
        st=con.createStatement();
        rs=st.executeQuery("select * from donatecloth");
        boolean a=rs.next();
        if(a){
    %>
    <table id="admindonordetails">
        <tr>
            <th style='text-align:center'>Name</th>
            <th style='text-align:center'>Email</th>
            <th style='text-align:center'>Mobile</th>
            <th style='text-align:center'>Item</th>
            <th style='text-align:center'>Village</th>
            <th style='text-align:center'>Post</th>
            <th style='text-align:center'>Pincode</th>
            <th style='text-align:center'>P.S</th>
            <th style='text-align:center'>City</th>
            <th style='text-align:center'>District</th>
            <th style='text-align:center'>State</th>
            <th style='text-align:center'>Date And Time</th>
            <th style='text-align:center'>Message</th>
        </tr>
            <%
            while(a)
            {
                %>
        <tr>
            <td><%=rs.getString(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getString(4)%></td>
            <td><%=rs.getString(5)%></td>
            <td><%=rs.getString(6)%></td>
            <td><%=rs.getString(7)%></td>
            <td><%=rs.getString(8)%></td>
            <td><%=rs.getString(9)%></td>
            <td><%=rs.getString(10)%></td>
            <td><%=rs.getString(11)%></td>
            <td><%=rs.getString(12)%></td>
            <td><%=rs.getString(13)%></td>
        </tr>
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
</div>
    <input type="submit" class="button2" onclick="printDiv('clothdonordetails')" value="Print"/>
        <script type="text/javascript">
    function printDiv(clothdonordetails) {
    var printContents = document.getElementById(clothdonordetails).innerHTML;
    var originalContents = document.body.innerHTML;
    document.body.innerHTML = printContents;
    window.print();
    document.body.innerHTML = originalContents;
    }
        </script>

 </div>

<button class="accordion">Money Donor Details</button>
<div class="panel">
<div class="donordetails-bg" id="moneydonordetails">
    <%@ page import ="java.sql.*" %>
    <%
        Connection con1=null;
        Statement st1=null;
        ResultSet rs1=null;
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con1=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
        st1=con1.createStatement();
        rs1=st1.executeQuery("select * from paymentdetails ORDER BY transaction_date ASC");
        boolean b=rs1.next();
        if(b){
    %>
    <table id="admindonordetails">
        <tr>
            <th style='text-align:center'>Name</th>
            <th style='text-align:center'>Email</th>
            <th style='text-align:center'>Mobile</th>
            <th style='text-align:center'>Transaction Id</th>
            <th style='text-align:center'>Amount</th>
            <th style='text-align:center'>Payment Method</th>
            <th style='text-align:center'>Transaction Date</th>
            <th style='text-align:center'>Status</th>
            <th> </th>
        </tr>
        <%
            while(b)
            {
        %>
        <form action="paymentAcceptOrReject.jsp" method="post">
        <tr>
            <td><%=rs1.getString(1)%></td>
            <td><%=rs1.getString(2)%></td>
            <td><%=rs1.getString(3)%></td>
            <td> <input type="text" id="transaction" name="transaction" value="<%=rs1.getString(4)%>" readonly></td>
            <td><%=rs1.getString(5)%></td>
            <td><%=rs1.getString(6)%></td>
            <td><%=rs1.getString(7)%></td>
            <td><%=rs1.getString(8)%></td>
            <td> <input type="submit" class="button1" name="accept" value="Accept"> <input type="submit" name="reject" class="button2" value="Reject"> </td>
        </tr>
        </form>
        <%
                b=rs1.next();
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
  </div>
    <input type="submit" class="button2" onclick="printDiv('moneydonordetails')" value="Print" />
    <script type="text/javascript">
        function printDiv(moneydonordetails) {
            var printContents = document.getElementById(moneydonordetails).innerHTML;
            var originalContents = document.body.innerHTML;
            document.body.innerHTML = printContents;
            window.print();
            document.body.innerHTML = originalContents;
        }
    </script>

</div>
<script>
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.display === "block") {
                panel.style.display = "none";
            } else {
                panel.style.display = "block";
            }
        });
    }
</script>



<!-- co-ntact -->
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