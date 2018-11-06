
import java.io.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.util.*;
import javax.servlet.http.*;
public class Signup extends  HttpServlet
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
            String user=request.getParameter("user");
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
            st=con.createStatement();
            st1=con.createStatement();
            rs=st.executeQuery("insert into donor values('"+user+"','"+email+"','"+password+"')");
            boolean a=rs.next();


            if(a){
                out.println("<script>alert(\"your account is create successfully\");\n" +
                        " window.location=\"donorlogin.html\";\n" +
                        "</script>");
                //response.sendRedirect("donorlogin.html");
                //request.getRequestDispatcher("signup.html").include(request, response);
            }
            else{
                out.println("<script>alert(\"Something went wrong!\");\n" +
                        " window.location=\"signup.html\";\n" +
                        "</script>");
            }
        }
        catch (Exception e){
            out.println("<script>alert(\"Email is already exist!\");\n" +
                    " window.location=\"signup.html\";\n" +
                    "</script>");
    }
    }
}