import java.io.*;
import java.sql.*;
import java.util.Collection;
import java.util.Iterator;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;
@MultipartConfig
public class UploadImage extends  HttpServlet
{
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        Connection con=null;
        Statement st=null;
        Statement st1=null;
        ResultSet rs=null;
        try {
            Collection col = request.getParts();
            Iterator itr = col.iterator();
            Part photo = null;
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "system");
            PreparedStatement ps = null;
            int a = 0;
            while (itr.hasNext()) {
                photo = (Part) itr.next();
                //extra code for replace requirement
               // if (photo.getSize()<6)
                 //   break;
                //end extra
            ps = con.prepareStatement("insert into uploadimage values(?)");
            ps.setBinaryStream(1, photo.getInputStream(), (int) photo.getSize());
            a = ps.executeUpdate();
        }


            if(a!=0){
                out.println("<script>alert(\"Photo Upload Successful\");\n" +
                        " window.location=\"uploadimage.html\";\n" +
                        "</script>");
                //response.sendRedirect("donorlogin.html");
                //request.getRequestDispatcher("signup.html").include(request, response);
            }
            else{
                out.println("<script>alert(\"Select any photo\");\n" +
                        " window.location=\"uploadimage.html\";\n" +
                        "</script>");
            }
        }
        catch (Exception e){
            out.println("<script>alert(\"Something went wrong!\");\n" +
                    " window.location=\"uploadimage.html\";\n" +
                    "</script>");
        }
    }
}