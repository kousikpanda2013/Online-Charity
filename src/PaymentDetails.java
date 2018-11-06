
import java.io.*;
import java.util.*;
import javax.servlet.*;
import java.sql.*;
import java.util.*;
import javax.servlet.http.*;
public class PaymentDetails extends  HttpServlet
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
            String transaction=request.getParameter("transaction");
            String amount=request.getParameter("amount");
            String paymentmethod=request.getParameter("paymentmethod");
            String transactiondate=request.getParameter("transactiondate");
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
            st=con.createStatement();
            rs=st.executeQuery("insert into paymentdetails values('"+name+"','"+email+"','"+mobile+"','"+transaction+"','"+amount+"','"+paymentmethod+"','"+transactiondate+"','"+null+"')");
            boolean a=rs.next();
            if(a){
                out.println("<script>alert(\"Thank You For Your Donation\");\n" +
                        " window.location=\"donatemoney.html\";\n" +
                        "</script>");
                //request.getRequestDispatcher("signup.html").include(request, response);
            }
            else{
                out.println("<script>alert(\"Unable to submit details! Please try again\");\n" +
                        " window.location=\"paymentdetails.html\";\n" +
                        "</script>");
            }
        }
        catch (Exception e){
            out.println("<script>alert(\"This Transaction Id is already Exist!\");\n" +
                    " window.location=\"paymentdetails.html\";\n" +
                    "</script>");
        }
    }
}