/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
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
public class Placeorder extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Order</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Order at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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

        String htmlFilePath = "/html/order/index.jsp";
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        Connection conn = null;
        response.setContentType("text/html");
        
        String[] allField = new String[] {"orderId","userEmail","userPhone","userAddress","service","totalAmount","orderDate","serviceDate","serviceTime","totalOrder"};
        try {
                DriverManager.registerDriver(new oracle.jdbc.OracleDriver());

//                conn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-1B6LLCK:1521:orcl","soumadri","biswas");
                conn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@Subhajit_Ghosh:1521:orcl","subhajit","ghosh");

                String query = "INSERT INTO USER_ORDER VALUES(?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement  ost =(OraclePreparedStatement) conn.prepareStatement(query);
                int tableField = 1;
                int i = 0;
                while(tableField <= 10 && i <= allField.length-1){
                    ost.setString(tableField, request.getParameter(allField[i]));
                    
                    i++;
                    tableField++;
                }
                int rs =  ost.executeUpdate();
                System.out.println(rs);
                
                if(rs > 0){
                    int x = 0;
                    while(x <= allField.length-1){
                        request.setAttribute(allField[x], request.getParameter(allField[x]));

                        x++;
                    }
                    
                    request.setAttribute("orderId",request.getParameter("orderId")); 

                    request.getRequestDispatcher("/html/order/OrderSuccessPage.jsp").forward(request, response);
                }else{
                    request.setAttribute("Failed","Failed to Insert..."); 
                    request.getRequestDispatcher("/html/order/OrderFailPage.jsp").forward(request, response);
                }
//                
            } catch (SQLException e) {
                request.setAttribute("Failed","Something Went Wrong"); 
                request.getRequestDispatcher("/html/order/OrderFailPage.jsp").forward(request, response);
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
