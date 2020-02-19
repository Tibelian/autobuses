
package BLL;

import DAO.HibernateUtil;
import DAO.Operacion;
import Modelo.MyHash;
import POJOS.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;

public class crearCuenta extends HttpServlet {
    
    private SessionFactory SessionBuilder;
    
    @Override
    public void init(){
        SessionBuilder = HibernateUtil.getSessionFactory();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String dni = request.getParameter("dni");
            String telefono = request.getParameter("telefono");
            
            if(email != null && password != null && nombre != null && apellidos != null && dni != null && telefono != null){
                
                Cliente cliente = new Cliente();
                cliente.setEmail(email);
                cliente.setNombre(nombre);
                cliente.setApellidos(apellidos);
                cliente.setDni(dni);
                cliente.setTelefono(Integer.parseInt(telefono));
                cliente.setClave(MyHash.encriptar(password));
                
                try{
                    
                    new Operacion().crearCuenta(SessionBuilder, cliente);
                    
                    boolean redirect = false;
                    String url = "";
                    if(request.getParameter("redirect") != null){
                        redirect = true;
                        url = request.getParameter("redirect");
                    }
                    if(request.getParameter("login") != null){
                        String otherServlet = "./iniciarSesion";
                        if(redirect){
                            otherServlet = "./iniciarSesion?redirect=" + url;
                        }
                        // redirecciona al servlet de login
                        RequestDispatcher rd = request.getRequestDispatcher(otherServlet);
                        rd.forward(request,response);
                    }else{
                        if(redirect){
                            response.sendRedirect(url);
                        }else{
                            out.println("Cuenta creada con éxito");
                        }
                    }
                    
                    
                }catch(HibernateException ex){
                    out.println("No se ha podido crear la cuenta: " + ex.getMessage());
                }
                
            }else{
                out.println("Faltan parametros");
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
