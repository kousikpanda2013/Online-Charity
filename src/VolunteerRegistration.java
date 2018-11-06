
import java.io.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.util.*;
import javax.servlet.http.*;
public class VolunteerRegistration extends  HttpServlet
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
            String name=request.getParameter("name");
            String mobile=request.getParameter("mobile");
            String email=request.getParameter("email");
            String gender=request.getParameter("gender");
            String aadhaar=request.getParameter("aadhaar");
            String village=request.getParameter("village");
            String post=request.getParameter("post");
            String ps=request.getParameter("ps");
            String dist=request.getParameter("dist");
            String state=request.getParameter("state");
            String pin=request.getParameter("pin");
            String password=request.getParameter("password");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
            st=con.createStatement();
            st1=con.createStatement();
            rs=st.executeQuery("insert into volunteer values('"+name+"','"+mobile+"','"+email+"','"+gender+"','"+aadhaar+"','"+village+"','"+post+"','"+ps+"','"+dist+"','"+state+"','"+pin+"','"+password+"','"+null+"')");
            boolean a=rs.next();


            if(a){
                out.println("<script>alert(\"your account is create successfully,After verifying all documents you can login\");\n" +
                              " window.location=\"volunteerregistration.html\";\n" +
                            "</script>");
            }
            else{
                out.println("<script>alert(\"Something went wrong!\");\n" +
                        " window.location=\"volunteerregistration.html\";\n" +
                        "</script>");
            }
        }
        catch (Exception e){
            out.println("<script>alert(\"Email is already exist!\");\n" +
                    " window.location=\"volunteerregistration.html\";\n" +
                    "</script>");
        }
    }
}