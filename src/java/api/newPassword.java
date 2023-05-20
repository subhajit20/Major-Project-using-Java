/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;



public class newPassword extends HttpServlet {

    String vpass;
    
    OracleConnection oconn;
    OraclePreparedStatement ost;
    RequestDispatcher dis=null;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        String htmlFilePath = "/html/auth/newPassword.jsp";
        request.getRequestDispatcher(htmlFilePath).forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
		
	
        String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		RequestDispatcher dispatcher = null;
		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {
                
        try {
            DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
            
            oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-1B6LLCK:1521:orcl","soumadri","biswas");
            
            PreparedStatement pst = oconn.prepareStatement("update register set PASSWORD = ? where EMAIL = ? ");
				pst.setString(1, confPassword);
				pst.setString(2, (String) session.getAttribute("email"));
                                

				int rowCount = pst.executeUpdate();
				if (rowCount > 0) {
					request.setAttribute("status", "resetSuccess");
					request.getRequestDispatcher("/html/auth/Login.jsp").forward(request, response);
				} else {
					request.setAttribute("status", "resetFailed");
					request.getRequestDispatcher("/html/auth/Login.jsp").forward(request, response);
                                       
				}
                                out.println((String) session.getAttribute("email"));
        out.println(confPassword);
        } catch (SQLException ex) {
            Logger.getLogger(newPassword.class.getName()).log(Level.SEVERE, null, ex);
        }}
        
        processRequest(request, response);
        
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    }
