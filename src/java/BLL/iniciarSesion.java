
package BLL;

import DAO.HibernateUtil;
import DAO.Operacion;
import Modelo.AutobusesException;
import Modelo.MyHash;
import POJOS.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;

public class iniciarSesion extends HttpServlet {
    
    private SessionFactory SessionBuilder;
    
    @Override
    public void init(){
        SessionBuilder = HibernateUtil.getSessionFactory();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            if(request.getParameter("email") != null && request.getParameter("password") != null){
            
                String email = request.getParameter("email");
                String password = MyHash.encriptar(request.getParameter("password"));
                
                try{
                    
                    Cliente cliente = new Operacion().iniciarSesion(SessionBuilder, email, password);
                    HttpSession session = request.getSession(true);
                    session.setAttribute("cliente", cliente);
                    
                    if(request.getParameter("redirect") != null){
                        response.sendRedirect(request.getParameter("redirect"));
                    }else{
                        out.println("Has iniciado sesión con éxito");
                    }
                
                }catch(AutobusesException ex){
                    out.println("Error: " + ex.getMessage());
                }
                
            }else{
                out.println("Falta parámetros");
            }
            
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
        processRequest(request, response);
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
        processRequest(request, response);
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
