
package BLL;

import DAO.HibernateUtil;
import DAO.Operacion;
import POJOS.Viaje;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;

public class finalizarViaje extends HttpServlet {
    
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
            
            if(request.getParameter("id") != null){
                
                int idViaje = Integer.parseInt(request.getParameter("id"));
                HttpSession session = request.getSession(true);
                
                if(session.getAttribute("listadoViajes") != null){
                    
                    Viaje elViajeElegido = null;
                    List<Viaje> listadoViajes = (List)session.getAttribute("listadoViajes");
                    for (Viaje viaje : listadoViajes) {
                        if(viaje.getId() == idViaje){
                            elViajeElegido = viaje;
                        }
                    }
                    try{
                        
                        new Operacion().guardarViajeBackup(SessionBuilder, elViajeElegido);
                        new Operacion().borrarViaje(SessionBuilder, elViajeElegido);
                        session.setAttribute("listadoViajes", null);
                        response.sendRedirect("./admin/");
                        
                    }catch(HibernateException he){
                        out.print(he.getMessage());
                    }
                    
                }else{
                    response.sendRedirect("./error.jsp?code=Falta la sessión 'listadoViajes'");
                }
                
            }else{
                response.sendRedirect("./error.jsp?code=data-miss");
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
