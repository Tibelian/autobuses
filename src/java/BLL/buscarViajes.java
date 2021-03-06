
package BLL;

import DAO.HibernateUtil;
import DAO.Operacion;
import Modelo.AutobusesException;
import Modelo.Reserva;
import POJOS.Ruta;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;

public class buscarViajes extends HttpServlet {
    
    private SessionFactory SessionBuilder;
    
    @Override
    public void init(){
        SessionBuilder = HibernateUtil.getSessionFactory();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try(PrintWriter out = response.getWriter()){
            if(
                request.getParameter("origen") != null && 
                request.getParameter("destino") != null && 
                request.getParameter("salida") != null && 
                request.getParameter("pasajeros") != null
            ){

                try{
                    
                    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                    Date fechaSalida = formatter.parse(request.getParameter("salida"));
                    int pasajeros = Integer.parseInt(request.getParameter("pasajeros"));
                    int idOrigen = Integer.parseInt(request.getParameter("origen"));
                    int idDestino = Integer.parseInt(request.getParameter("destino"));
                    
                    // devuelve la ruta teniendo el origen y destino
                    Ruta ruta = new Operacion().obtenerRuta(SessionBuilder, idOrigen, idDestino);
                    
                    // prepara la reserva
                    Reserva reserva = new Reserva(ruta, fechaSalida, pasajeros);

                    // se crea la sesión con los datos
                    HttpSession session = request.getSession(true);
                    session.setAttribute("reserva", reserva);
                    session.setAttribute("pagina", "viajes.jsp");

                    // redirecciona a la vista
                    response.sendRedirect("./viajes.jsp");

                } catch (ParseException ex) {
                    response.sendRedirect("./error.jsp?code=EXCEPTION DATE: " + ex.getMessage());
                    //out.println("ERROR DATE");
                } catch (AutobusesException ex) {
                    response.sendRedirect("./error.jsp?code=viaje-404");
                } catch(HibernateException hx){
                    response.sendRedirect("./error.jsp?code=EXCEPTION: " + hx.getMessage());
                    //out.println("EXCEPTION HIBERNATE: " + hx.getMessage());
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
