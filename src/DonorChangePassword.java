
import java.io.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.util.*;
import javax.servlet.http.*;
public class DonorChangePassword extends  HttpServlet
{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        Connection con=null;
        Statement st=null;
        Statement st1=null;
        ResultSet rs=null;
        try
        {
            HttpSession session = request.getSession(true);
            String email=(String)session.getAttribute("email");
            String password=request.getParameter("password");
            String password2=request.getParameter("password2");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
            st=con.createStatement();
            st1=con.createStatement();
            rs=st.executeQuery("UPDATE donor SET PASSWORD='"+password2+"' WHERE EMAIL ='" +email +"' AND PASSWORD='"+password+"' ");
            boolean a=rs.next();

            if(a){
                out.println("<script>alert(\"Change Password Successfully!\");\n" +
                        " window.location=\"donorchangepassword.html\";\n" +
                        "</script>");
            }
            else{
                out.println("<script>alert(\"Unable to Change Password!\");\n" +
                        " window.location=\"donorchangepassword.html\";\n" +
                        "</script>");
                //out.println("failed to login");
                // response.sendRedirect("signup.html");
            }
        }
        catch (Exception e){
            out.println("<script>alert(\"Something went wrong!\");\n" +
                    " window.location=\"donorchangepassword.html\";\n" +
                    "</script>");
        }
    }
}