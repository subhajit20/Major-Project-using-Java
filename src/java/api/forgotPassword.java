package api;

import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import oracle.jdbc.OracleConnection;
import oracle.jdbc.OraclePreparedStatement;
import oracle.jdbc.OracleResultSet;

/**
 *
 * @author SOUMADRI
 */
public class forgotPassword extends HttpServlet {
    RequestDispatcher dispatcher = null;
		int otpvalue = 0;
                String vto, vfrom, vcc, vbcc, vsubject, vbody,con;
                OracleConnection oconn=null;
                OraclePreparedStatement ost;
                OracleResultSet ors = null;


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
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
        String htmlFilePath = "/html/auth/forgotPassword.jsp";
        request.getRequestDispatcher(htmlFilePath).forward(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        HttpSession mySession = request.getSession();
       try{
           DriverManager.registerDriver(new oracle.jdbc.OracleDriver());
       
                oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@Subhajit_Ghosh:1521:orcl","subhajit","ghosh");
//                 oconn = (OracleConnection)DriverManager.getConnection("jdbc:oracle:thin:@DESKTOP-1B6LLCK:1521:orcl","soumadri","biswas");
                 ost =(OraclePreparedStatement) oconn.prepareStatement("SELECT * FROM register where email=?");
            ost.setString(1, email);
            ors = (OracleResultSet) ost.executeQuery();
       
        

			String to = email;// change accordingly
			// Get the session object
			 Properties props = new Properties();
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.host", "smtp.gmail.com");
                props.put("mail.smtp.port", "587");
			Session session = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("sbiswas14.2001@gmail.com", "dnbxkkqkjujugytg");// Put your email
                                }
			});
			// compose message
			
				Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(email));
			message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
  //                                                      message.setRecipients(Message.RecipientType.CC,
//				InternetAddress.parse(vcc));
//                                                        message.setRecipients(Message.RecipientType.CC,
//				InternetAddress.parse(vbcc));
			message.setSubject("Hello");
                                                        Random random = new Random();
                                                         int x = 0;
                                                         while(x < 1000)
                                                         {
                                                             x = random.nextInt(9999);
                                                         }
                                                         //out.println("<h2 style='color:darkblue'>New OTP generated in Website : " + x + "</h2>");
                                                         vbody= "\nYour new OTP is " + x;
                                                         // no need to give coding lines 78-85 if you do not want an OTP
			message.setText(vbody);
                                                         
			Transport.send(message);
                        dispatcher = request.getRequestDispatcher("/html/auth/EnterOtp.jsp");
			request.setAttribute("message","OTP is sent to your email id");
			//request.setAttribute("connection", con);
			mySession.setAttribute("otp", x); 
			mySession.setAttribute("email",email); 
			dispatcher.forward(request, response);
                        //sendRedirect("/html/auth/EnterOtp.jsp");
                        ost.close();
                        oconn.close();
                        //out.println("<h2 style='color:green'>Mail with new OTP sent successfully</h2>");
			
       }catch (SQLException ex) {
            Logger.getLogger(signup.class.getName()).log(Level.SEVERE, null, ex);

       } catch (AddressException ex) {
            Logger.getLogger(forgotPassword.class.getName()).log(Level.SEVERE, null, ex);
        } catch (MessagingException ex) {
            Logger.getLogger(forgotPassword.class.getName()).log(Level.SEVERE, null, ex);
        }
                        out.println(email);
                        out.println(vbody);
			
       
        }
}
