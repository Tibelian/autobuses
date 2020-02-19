
package BLL;

import DAO.HibernateUtil;
import DAO.Operacion;
import Modelo.AutobusesException;
import POJOS.Cliente;
import POJOS.Tarjeta;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;

public class eliminarTarjeta extends HttpServlet {
    
    private SessionFactory SessionBuilder;
    
    @Override
    public void init(){
        SessionBuilder = HibernateUtil.getSessionFactory();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String sId = request.getParameter("id");
            if(sId != null){
            
                int id = Integer.parseInt(sId);
                try{
                    
                    HttpSession session = request.getSession(true);
                    if(session.getAttribute("cliente") != null){
                        
                        Cliente cliente = (Cliente)session.getAttribute("cliente");
                        Tarjeta tarjeta = null;
                        Iterator itTarjetas = cliente.getTarjetas().iterator();
                        while(itTarjetas.hasNext()){
                            Tarjeta xTarjeta = (Tarjeta)itTarjetas.next();
                            if(xTarjeta.getId() == id){
                                tarjeta = xTarjeta;
                                break;
                            }
                        }
                        if(tarjeta != null){
                            
                            new Operacion().eliminarTarjeta(SessionBuilder, tarjeta);
                            // se actualiza el nuevo cliente
                            Cliente nCliente = new Operacion().iniciarSesion(SessionBuilder, cliente.getEmail(), cliente.getClave());
                            session.setAttribute("cliente", nCliente);
                            response.sendRedirect("./pagar.jsp?msg=eliminar-tarjeta-ok");
                            
                        }else{
                            out.print("NO SE HA ENCONTRADO LA TARJETA QUE SE DESEA ELIMINAR");
                        }
                        
                    }else{
                        out.print("DEBES INICIAR SESIÓN PARA REALIZAR ESTA OPERACIÓN");
                    }
                    
                }catch(HibernateException | AutobusesException he){
                    out.println("EXCEPTION: " + he.getMessage());
                }
                
            }else{
                out.print("FALTA EL PARÁMETRO 'ID'");
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
