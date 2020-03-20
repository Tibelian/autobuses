
package BLL;

import DAO.HibernateUtil;
import DAO.Operacion;
import Modelo.AutobusesException;
import Modelo.MyHash;
import POJOS.Administrador;
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
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            if(request.getParameter("email") != null && request.getParameter("password") != null){
            
                String email = request.getParameter("email");
                String password = MyHash.sha1(request.getParameter("password"));
                HttpSession session = request.getSession(true);
                boolean ok = false;
                    
                try{
                    
                    Cliente cliente = new Operacion().iniciarSesion(SessionBuilder, email, password);
                    session.setAttribute("cliente", cliente);
                    ok = true;
                
                }catch(AutobusesException ex){
                    
                    if(ex.getCode() == 404){
                        
                        Administrador admin = new Operacion().iniciarSesionAdmin(SessionBuilder, email, password);
                        if(admin != null){
                            session.setAttribute("administrador", admin);
                            ok = true;
                        }
                        
                    }else{
                        out.println("Error: " + ex.getMessage());
                    }
                    
                }
                
                if(ok){
                    if(request.getParameter("redirect") != null){
                        response.sendRedirect(request.getParameter("redirect"));
                    }else{
                        response.sendRedirect("./index.jsp");
                        //out.println("Has iniciado sesión con éxito");
                    }
                }else{
                    response.sendRedirect("./error.jsp?code=login-wrong");
                    //out.println("Los datos que has introducido son incorrectos");
                }
                
            }else{
                response.sendRedirect("./error.jsp?code=login-miss");
                //out.println("Falta parámetros");
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
