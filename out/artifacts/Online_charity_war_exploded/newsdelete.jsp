<%@ page import ="java.sql.*" %>
<%
        if(request.getParameter("delete")!=null) {
            Connection con = null;
            Statement st = null;
            ResultSet rs = null;
            try {
                String newsid = request.getParameter("newsid");
                Class.forName("oracle.jdbc.driver.OracleDriver");
                con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");
                st = con.createStatement();
                rs = st.executeQuery("DELETE FROM NEWS where NEWS_SERIAL_NO='"+newsid+"' ");
                boolean a = rs.next();
                if (a) {
                    out.println("<script>alert(\"This news has deleted \");\n" +
                            " window.location=\"uploadnews.jsp\";\n" +
                            "</script>");
                    //request.getRequestDispatcher("signup.html").include(request, response);
                } else {
                    out.println("<script>alert(\"Unable to delete! Please try again\");\n" +
                            " window.location=\"uploadnews.jsp\";\n" +
                            "</script>");
                }
            } catch (Exception e) {
                out.println("<script>alert(\"Something went wrong!\");\n" +
                        " window.location=\"uploadnews.jsp\";\n" +
                        "</script>");
            }
        }
        %>