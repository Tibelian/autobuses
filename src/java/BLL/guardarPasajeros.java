
package BLL;

import DAO.HibernateUtil;
import Modelo.Reserva;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.SessionFactory;
import org.json.JSONArray;

public class guardarPasajeros extends HttpServlet {
    
    private SessionFactory SessionBuilder;
    
    @Override
    public void init(){
        SessionBuilder = HibernateUtil.getSessionFactory();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            if(request.getParameter("data") != null){
                
                String jsonString = request.getParameter("data");
                HttpSession session = request.getSession(true);
                if(session.getAttribute("reserva") != null){
                    
                    out.println("RESERVA OK");
                    
                    JSONArray json = new JSONArray(jsonString);
                    
                    out.println(json.toString());
                    
                    Reserva reserva = (Reserva) session.getAttribute("reserva");
                   
                   //Viajero viajero = new Viajero(json.get("dni"), ....);
                    
                    //reserva.getViajeros().add()
                    
                    
                }else{
                    response.sendRedirect("./error.jsp?code=reserva-404");
                }
                
            }else{
                out.println("FALTAN DATOS");
                out.println("");
                Enumeration<String> prueba = request.getParameterNames();
                while(prueba.hasMoreElements()){
                    out.println(prueba.nextElement());
                }
                
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
