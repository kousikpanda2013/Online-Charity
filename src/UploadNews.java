
import java.io.*;
import javax.servlet.*;
import java.sql.*;
import javax.servlet.http.*;
public class UploadNews extends  HttpServlet
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
            String news_serial_no=request.getParameter("newsserialno");
            String news_briefly=request.getParameter("newsbriefly");
            String publish_date=request.getParameter("date");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
            st=con.createStatement();
            st1=con.createStatement();
            rs=st.executeQuery("insert into news values('"+news_serial_no+"','"+news_briefly+"','"+publish_date+"')");
            boolean a=rs.next();


            if(a){
                out.println("<script>alert(\"News add successfully\");\n" +
                        " window.location=\"uploadnews.jsp\";\n" +
                        "</script>");
                //response.sendRedirect("uploadnews.html");
                //request.getRequestDispatcher("signup.html").include(request, response);
            }
            else{
                out.println("<script>alert(\"Something went wrong!\");\n" +
                        " window.location=\"uploadnews.jsp\";\n" +
                        "</script>");
            }
        }
        catch (Exception e){
            out.println("<script>alert(\"This Newsid is already exist!\");\n" +
                    " window.location=\"uploadnews.jsp\";\n" +
                    "</script>");
        }
    }
}