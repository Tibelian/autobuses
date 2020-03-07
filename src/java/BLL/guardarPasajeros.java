
package BLL;

import Modelo.Reserva;
import POJOS.Viajero;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;

public class guardarPasajeros extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            if(request.getParameter("data") != null){
                
                String jsonString = request.getParameter("data");
                HttpSession session = request.getSession(true);
                if(session.getAttribute("reserva") != null){
                    Reserva reserva = (Reserva)session.getAttribute("reserva");
                    JSONArray json = new JSONArray(jsonString);
                    ArrayList<Viajero> listado = new ArrayList();
                    
                    Iterator jsonIterator = json.iterator();
                    while(jsonIterator.hasNext()){
                        JSONObject obj = (JSONObject)jsonIterator.next();
                        Viajero viajero = new Viajero();
                        viajero.setDni((String)obj.get("dni"));
                        viajero.setApellidos((String)obj.get("apellidos"));
                        viajero.setNombre((String)obj.get("nombre"));
                        viajero.setAsiento(Integer.parseInt((String)obj.get("asiento")));
                        listado.add(viajero);
                    }
                    reserva.setViajeros(listado);
                    session.setAttribute("pagina", "resumen.jsp");
                    out.println("OK");
                    
                }else{
                    response.sendRedirect("./error.jsp?code=La reserva no es válida");
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
