package api;

import java.io.IOException;
import static java.lang.System.out;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;

public class signup extends HttpServlet {

    
    String vName,vAdd,vEmail,vPh,vPass,vGender;
    OracleConnection oconn=null;
    OraclePreparedStatement ost;
    String query;
    RequestDispatcher disp=null;
    
protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        String htmlFilePath = "/html/auth/Signup.jsp";
        request.getRequestDispatcher(htmlFilePath).forward(request, response);
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        vName = request.getParameter("tbName");
             vAdd = request.getParameter("tbAdd");
             vEmail = request.getParameter("tbEmail");
             vPh = request.getParameter("tbPh");
             vPass = request.getParameter("tbPass");
             vGender = request.getParameter("rbGender");
             
             
            try{
                DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
                 oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@Subhajit_Ghosh:1521:orcl","subhajit","ghosh");
                 String q = "INSERT INTO register values(?,?,?,?,?,?)";
//                 oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-1B6LLCK:1521:orcl","soumadri","biswas");
//                 oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-1B6LLCK:1521:orcl","soumadri","biswas");
                 ost =(OraclePreparedStatement) oconn.prepareStatement(q);
            
             ost.setString(1,vName);
             ost.setString(2,vAdd);
             ost.setString(3,vEmail);
             ost.setString(4,vPh);
             ost.setString(5,vPass);
             ost.setString(6,vGender);
             
             int ra = ost.executeUpdate();
             disp = request.getRequestDispatcher("/html/auth/Signup.jsp");
                if (ra>0)
                {
                    request.setAttribute("status","success");
                out.println("Succ");
                }
                else
                {
                    
                    request.setAttribute("status","failed");
                    out.println("Fail");
                }
                disp.forward(request, response);
                
            
            } catch (SQLException ex) {
            Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            try {
                ost.close();
                
            } catch (SQLException ex) {
                Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);
            }
            }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}