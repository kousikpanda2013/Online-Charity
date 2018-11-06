
import java.io.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.util.*;
import javax.servlet.http.*;
public class DonateCloth extends  HttpServlet
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
            String email=request.getParameter("email");
            String mobile=request.getParameter("mobile");
            String item=request.getParameter("item");
            String village=request.getParameter("vill");
            String post=request.getParameter("post");
            String pincode=request.getParameter("pin");
            String ps=request.getParameter("ps");
            String city1=request.getParameter("city");
            String city=city1.toUpperCase();
            String dist=request.getParameter("dist");
            String state=request.getParameter("state");
            String date_and_time=request.getParameter("date");
            String message=request.getParameter("message");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
            st=con.createStatement();
            rs=st.executeQuery("insert into donatecloth values('"+name+"','"+email+"','"+mobile+"','"+item+"','"+village+"','"+post+"','"+pincode+"','"+ps+"','"+city+"','"+dist+"','"+state+"','"+date_and_time+"','"+message+"')");
            boolean a=rs.next();
            if(a){
                out.println("<script>alert(\"Thank You For Your Donation\");\n" +
                        " window.location=\"donatecloth.html\";\n" +
                        "</script>");
                //request.getRequestDispatcher("signup.html").include(request, response);
            }
            else{
                out.println("<script>alert(\"Unable to submit details! Please try again\");\n" +
                        " window.location=\"donatecloth.html\";\n" +
                        "</script>");
            }
        }
        catch (Exception e){
            out.println("<script>alert(\"Something went wrong!\");\n" +
                    " window.location=\"donatecloth.html\";\n" +
                    "</script>");
        }
    }
}