
package BLL;

import DAO.HibernateUtil;
import DAO.Operacion;
import Modelo.AutobusesException;
import POJOS.Cliente;
import POJOS.Tarjeta;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
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

public class agregarTarjeta extends HttpServlet {
    
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
       
            String numero = request.getParameter("numero");
            String caducidad = request.getParameter("caducidad");
            String cvv = request.getParameter("cvv");
            String tipo = request.getParameter("tipo");
            if(numero != null && caducidad != null && cvv != null && tipo != null){
                
                Tarjeta tarjeta = new Tarjeta();
                Date fechaCaducidad;
                try{
                    fechaCaducidad = new SimpleDateFormat("yyyy-MM").parse(caducidad);
                } catch (ParseException ex) {
                    response.sendRedirect("./error.jsp?codigo=EXCEPTION DATE: " + ex.getMessage());
                    return;
                }
                tarjeta.setNumero(numero.replace(" ", "").getBytes(StandardCharsets.UTF_8)); // elimina los espacios
                tarjeta.setCvv(Integer.parseInt(cvv));
                tarjeta.setTipo(tipo);
                tarjeta.setCaducidad(fechaCaducidad);
                
                HttpSession session = request.getSession(true);
                if(session.getAttribute("cliente") != null){
                    
                    Cliente cliente = (Cliente)session.getAttribute("cliente");
                    tarjeta.setCliente(cliente);
                
                    try{
                        
                        new Operacion().agregarTarjeta(SessionBuilder, tarjeta);
                        
                        // se actualiza el nuevo cliente
                        //cliente.getTarjetas().add(tarjeta);
                        Cliente nCliente = new Operacion().iniciarSesion(SessionBuilder, cliente.getEmail(), cliente.getClave());
                        session.setAttribute("cliente", nCliente);
                        session.setAttribute("pagina", "pagar.jsp");
                        
                        response.sendRedirect("./index.jsp");
                        
                    }catch(HibernateException | AutobusesException he){
                        response.sendRedirect("./error.jsp?code=EXCEPTION: " + he.getMessage());
                        //out.print("Exception: " + he.getMessage());
                    }
                
                }else{
                    response.sendRedirect("./error.jsp?code=Debes iniciar sesión para seguir");
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
