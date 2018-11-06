
import java.io.*;
import javax.servlet.*;
import java.sql.*;
import javax.servlet.http.*;
public class Contact extends  HttpServlet
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
            String message=request.getParameter("msg");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
            st=con.createStatement();
            rs=st.executeQuery("insert into contact values('"+name+"','"+email+"','"+mobile+"','"+message+"')");
            boolean a=rs.next();


            if(a){
                out.println("<script>alert(\"Message Send Successfully\");\n" +
                        " window.location=\"contact.html\";\n" +
                        "</script>");
                //response.sendRedirect("uploadnews.html");
                //request.getRequestDispatcher("signup.html").include(request, response);
            }
            else{
                out.println("<script>alert(\"Something went wrong!\");\n" +
                        " window.location=\"contact.html\";\n" +
                        "</script>");
            }
        }
        catch (Exception e){
            out.println("<script>alert(\"Please Try Again!\");\n" +
                    " window.location=\"contact.html\";\n" +
                    "</script>");
        }
    }
}