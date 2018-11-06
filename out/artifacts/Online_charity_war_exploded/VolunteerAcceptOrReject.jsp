<%@ page import ="java.sql.*" %>
<%
    if(request.getParameter("accept")!=null) {
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            String email= request.getParameter("email");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");
            st = con.createStatement();
            rs = st.executeQuery("UPDATE volunteer SET status='accept' WHERE email='" + email + "' ");
            boolean a = rs.next();
            if (a) {
                out.println("<script>alert(\"This Volunteer is successfully verified and accepted\");\n" +
                        " window.location=\"volunteerdetails.jsp\";\n" +
                        "</script>");
                //request.getRequestDispatcher("signup.html").include(request, response);
            } else {
                out.println("<script>alert(\"Unable to accept! Please try again\");\n" +
                        " window.location=\"volunteerdetails.jsp\";\n" +
                        "</script>");
            }
        } catch (Exception e) {
            out.println("<script>alert(\"Something went wrong!\");\n" +
                    " window.location=\"volunteerdetails.jsp\";\n" +
                    "</script>");
        }
    }
    else if (request.getParameter("reject") != null){
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        try {
            String email = request.getParameter("email");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");
            st = con.createStatement();
            rs = st.executeQuery("UPDATE volunteer SET status='reject' WHERE email ='" + email + "' ");
            boolean a = rs.next();
            if (a) {
                out.println("<script>alert(\"This Volunteer is rejected\");\n" +
                        " window.location=\"volunteerdetails.jsp\";\n" +
                        "</script>");
                //request.getRequestDispatcher("signup.html").include(request, response);
            } else {
                out.println("<script>alert(\"Unable to reject! Please try again\");\n" +
                        " window.location=\"volunteerdetails.jsp\";\n" +
                        "</script>");
            }
        } catch (Exception e) {
            out.println("<script>alert(\"Something went wrong!\");\n" +
                    " window.location=\"volunteerdetails.jsp\";\n" +
                    "</script>");
        }
    }
%>