
package BLL;

import DAO.HibernateUtil;
import DAO.Operacion;
import Modelo.Localizador;
import Modelo.Reserva;
import POJOS.Cliente;
import POJOS.Compra;
import POJOS.Tarjeta;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;

public class confirmarPago extends HttpServlet {
    
    private SessionFactory SessionBuilder;
    
    @Override
    public void init(){
        SessionBuilder = HibernateUtil.getSessionFactory();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            if (request.getParameter("id") != null) {
                
                int id = Integer.parseInt(request.getParameter("id"));
                HttpSession session = request.getSession(true);
                if (session.getAttribute("cliente") != null) {
                    if (session.getAttribute("reserva") != null) {
                        
                        Cliente cliente = (Cliente) session.getAttribute("cliente");
                        Reserva reserva = (Reserva) session.getAttribute("reserva");
                        Compra compra = new Compra();
                        
                        compra.setFecha(new Date());
                        compra.setImporte(reserva.getViajeros().size() * reserva.getRuta().getPrecio());
                        compra.setViaje(reserva.getViaje());
                        compra.setViajeros(reserva.getViajeros().size());
                        compra.setLocalizador(Localizador.generar(8)); // genera un string aleatorio de 8 carácteres
                        
                        Iterator itTarjetas = cliente.getTarjetas().iterator();
                        while (itTarjetas.hasNext()) {
                            Tarjeta xTarjeta = (Tarjeta) itTarjetas.next();
                            if (xTarjeta.getId() == id) {
                                compra.setTarjeta(xTarjeta);
                                break;
                            }
                        }
                        
                        try {
                            
                            new Operacion().guardarCompra(SessionBuilder, compra);
                            session.setAttribute("compra", compra);
                            session.setAttribute("pagina", "completado.jsp");
                            response.sendRedirect("./completado.jsp");
                            
                        } catch(HibernateException ex) {
                            out.println("EXCEPTION: " + ex.getMessage());
                        }
                        
                    } else {
                        out.println("LA RESERVA NO EXISTE");
                    }
                } else {
                    out.println("DEBES INICIAR SESIÓN");
                }
                
            } else {
                out.println("FALTA INDICAR EL ID DE LA TARJETA");
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
