import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class MailApp extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String to = request.getParameter("email");
        String subject = request.getParameter("subject");
        String message =  request.getParameter("message");
        SendMail.send(to,subject, message);
        out.println("<script>alert(\"Mail Send Sucessfully!\");\n" +
                " window.location=\"message.jsp\";\n" +
                "</script>");

    }
}