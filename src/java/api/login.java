package api;

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.resource.cci.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;
/**
 *
 * @author subha
 */
public class login extends HttpServlet {

String vemail,vpass;
OracleConnection oconn;
    OraclePreparedStatement ost;
    RequestDispatcher dis=null;
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            //out.println("/html/home/home.html");
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet signup</title>");            
            out.println("</head>");
            out.println("<body>");
            
            out.println("</body>");
            out.println("</html>");
        }
        
    }


   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html");

        String htmlFilePath = "/html/auth/Login.jsp";
        request.getRequestDispatcher(htmlFilePath).forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {   
        Connection oconn = null;
        response.setContentType("text/html");
        try {
                
                DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
                vemail = request.getParameter("tbemail");
                vpass= request.getParameter("tbpass");
                HttpSession session= request.getSession();

                System.out.println("Email -- "+vemail);
                System.out.println("Pass -- "+vpass);

//                oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-1B6LLCK:1521:orcl","soumadri","biswas");
                oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@Subhajit_Ghosh:1521:orcl","subhajit","ghosh");

                String q = "SELECT * FROM register WHERE EMAIL=? AND PASSWORD=?";
                PreparedStatement  ost = oconn.prepareStatement(q);
                ost.setString(1,vemail);
                ost.setString(2,vpass);
                java.sql.ResultSet  rs = ost.executeQuery();

                if(rs.next()){
                    request.setAttribute("email",rs.getString("EMAIL")); 
                    request.setAttribute("address",rs.getString("ADDRESS")); 
                    request.setAttribute("phone",rs.getString("PHONENO"));
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }else{
                    request.setAttribute("status","failed"); 
                    request.getRequestDispatcher("/html/auth/Login.jsp").forward(request, response);
                }
        } catch (SQLException e) {
            request.setAttribute("status","failed"); 
            request.getRequestDispatcher("/html/auth/Login.jsp").forward(request, response);
        }
            
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}