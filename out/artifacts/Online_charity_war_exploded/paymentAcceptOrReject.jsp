<%@ page import ="java.sql.*" %>
<%
    if(request.getParameter("accept")!=null) {
        Connection con = null;
        Statement st = null;
        Statement st1 = null;
        ResultSet rs = null;
        try {
            String transaction = request.getParameter("transaction");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");
            st = con.createStatement();
            rs = st.executeQuery("UPDATE paymentdetails SET status='accept' WHERE transaction_id ='" + transaction + "' ");
            boolean a = rs.next();
            if (a) {
                out.println("<script>alert(\"This Transaction Has Accepted\");\n" +
                        " window.location=\"donordetails.jsp\";\n" +
                        "</script>");
                //request.getRequestDispatcher("signup.html").include(request, response);
            } else {
                out.println("<script>alert(\"Unable to accept! Please try again\");\n" +
                        " window.location=\"donordetails.jsp\";\n" +
                        "</script>");
            }
        } catch (Exception e) {
            out.println("<script>alert(\"Something went wrong!\");\n" +
                    " window.location=\"donordetails.jsp\";\n" +
                    "</script>");
        }
    }
    else if (request.getParameter("reject") != null){
        Connection con = null;
        Statement st = null;
        Statement st1 = null;
        ResultSet rs = null;
        try {
            String transaction = request.getParameter("transaction");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");
            st = con.createStatement();
            rs = st.executeQuery("UPDATE paymentdetails SET status='reject' WHERE transaction_id ='" + transaction + "' ");
            boolean a = rs.next();
            if (a) {
                out.println("<script>alert(\"This Transaction Has Rejected\");\n" +
                        " window.location=\"donordetails.jsp\";\n" +
                        "</script>");
                //request.getRequestDispatcher("signup.html").include(request, response);
            } else {
                out.println("<script>alert(\"Unable to reject! Please try again\");\n" +
                        " window.location=\"donordetails.jsp\";\n" +
                        "</script>");
            }
        } catch (Exception e) {
            out.println("<script>alert(\"Something went wrong!\");\n" +
                    " window.location=\"donordetails.jsp\";\n" +
                    "</script>");
        }
    }
%>