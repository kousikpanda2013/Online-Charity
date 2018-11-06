import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class VolunteerForgotPassword extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        try {
            String to = request.getParameter("email");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");
            st = con.createStatement();
            rs = st.executeQuery("select password from volunteer where email='" + to + "' AND status LIKE '%accept%' ");
            boolean a = rs.next();
            if(a) {
                String message=rs.getString("password");
                SendVolunteerPassword.send(to,message);
                out.println("<script>alert(\"Password Sent Successfully At Your Register MailId!\");\n" +
                        " window.location=\"volunteerregistration.html\";\n" +
                        "</script>");
            }
            else
            {
                out.println("<script>alert(\"Unable To Send Password,Try Again Later\");\n" +
                        " window.location=\"volunteerforgotpassword.html\";\n" +
                        "</script>");
            }
        }
        catch (Exception e)
        {
            out.println("<script>alert(\"Something Went Wrong, Please Try Again Later\");\n" +
                    " window.location=\"volunteerforgotpassword.html\";\n" +
                    "</script>");
        }


    }
}