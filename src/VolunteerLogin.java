
import java.io.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.util.*;
import javax.servlet.http.*;
public class VolunteerLogin extends  HttpServlet
{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        Connection con=null;
        Statement st=null;
        ResultSet rs=null;
        try
        {
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
            st=con.createStatement();
            rs=st.executeQuery("select * from volunteer where email='"+email+"' AND password='"+password+"' AND status LIKE '%accept%'");
            boolean a=rs.next();
            HttpSession session=request.getSession();
            session.setAttribute("email",email);

            if(a){
                response.sendRedirect("volunteerafterlogin.html");
                //request.getRequestDispatcher("signup.html").include(request, response);
            }
            else{
                out.println("<script>alert(\"Username or password incorrect!\");\n" +
                        " window.location=\"volunteerregistration.html\";\n" +
                        "</script>");
                //out.println("failed to login");
                // response.sendRedirect("signup.html");
            }
        }
        catch (Exception e){
            out.println("<script>alert(\"Something went wrong!\");\n" +
                    " window.location=\"volunteerregistration.html\";\n" +
                    "</script>");
        }
    }
}