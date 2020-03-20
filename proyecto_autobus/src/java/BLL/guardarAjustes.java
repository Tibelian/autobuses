
package BLL;

import DAO.HibernateUtil;
import DAO.Operacion;
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

public class guardarAjustes extends HttpServlet {
    
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
            
            String nombre = request.getParameter("nombre");
            String apellidos = request.getParameter("apellidos");
            String dni = request.getParameter("dni");
            String telefono = request.getParameter("telefono");
            String passwordIntroducida = request.getParameter("password");
            
            if(nombre != null && apellidos != null && dni != null && telefono != null && passwordIntroducida != null){
            
                HttpSession session = request.getSession(true);
                if(session.getAttribute("cliente") != null){

                    Cliente cliente = (Cliente) session.getAttribute("cliente");
                    String claveEncriptada = MyHash.sha1(passwordIntroducida);
                    if(cliente.getClave().equals(claveEncriptada)){
                    
                        cliente.setNombre(nombre);
                        cliente.setApellidos(apellidos);
                        cliente.setDni(dni);
                        cliente.setTelefono(telefono);
                        new Operacion().actualizarCliente(SessionBuilder, cliente);
                        response.sendRedirect("./usuario-ajustes.jsp?ok=1");
                        
                    }else{
                        response.sendRedirect("./error.jsp?code=La clave que has introducido no es correcta");
                    }

                }else{
                    response.sendRedirect("./error.jsp?code=Debes iniciar sesión para modificar los datos de tu cuenta");
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
