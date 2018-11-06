
import java.io.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.util.*;
import javax.servlet.http.*;
public class Signin extends  HttpServlet
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
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
            st=con.createStatement();
            st1=con.createStatement();
            rs=st.executeQuery("select * from donor where email='"+email+"' and password='"+password+"'");
            boolean a=rs.next();
            HttpSession session=request.getSession();
            session.setAttribute("email",email);

            if(a){
                response.sendRedirect("donorafterlogin.html");
                //request.getRequestDispatcher("signup.html").include(request, response);
            }
            else{
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Email or password incorrect');");
                out.println("location='donorlogin.html';");
                out.println("</script>");
                //out.println("failed to login");
               // response.sendRedirect("signup.html");
            }
        }
        catch (Exception e){
            out.println("<script>alert(\"Something went wrong!\");\n" +
                    " window.location=\"donorlogin.html\";\n" +
                    "</script>");
        }
    }
}