package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import POJOS.Estacion;

public final class inicio_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");

if(session.getAttribute("listadoOrigen") == null){
    response.sendRedirect("./obtenerOrigen");
    return;
}
List<Estacion> listadoOrigen = (List)session.getAttribute("listadoOrigen");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"./assets/css/all.min.css\"/>\n");
      out.write("        <link rel=\"stylesheet\" href=\"./assets/css/style.css\"/>\n");
      out.write("        <script src=\"./assets/js/main.js\"></script>\n");
      out.write("        <title>Bienvenido al mejor sitio web del mundo</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <header>\n");
      out.write("            <img class=\"logo\" src=\"./assets/img/logo.png\" alt=\"logo\" width=\"auto\" />\n");
      out.write("            <nav class=\"ml-auto\">\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"#\">Iniciar sesión</a></li>\n");
      out.write("                    <li><a href=\"#\">Idioma</a></li>\n");
      out.write("                </ul>\n");
      out.write("            </nav>\n");
      out.write("        </header>\n");
      out.write("        \n");
      out.write("        <main>\n");
      out.write("            \n");
      out.write("            <section class=\"bg-opacity bg-img\" style=\"background-image:url('./assets/img/architecture.jpg')\"> \n");
      out.write("                \n");
      out.write("                <div class=\"text-white bg-opacity shadow p-20 m-auto\">\n");
      out.write("                    <form method=\"post\" action=\"./obtenerRuta\">\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"origen\"><i class=\"fas fa-arrow-right\"></i> Origen:</label>\n");
      out.write("                            <select name=\"origen\" id=\"origen\" onchange=\"buscarDestino(this.value)\">\n");
      out.write("                                <option value=\"\"></option>\n");
      out.write("                                ");

                                for(Estacion estacion:listadoOrigen){
                                
      out.write("\n");
      out.write("                                <option value=\"");
      out.print( estacion.getId() );
      out.write('"');
      out.write('>');
      out.print( estacion.getNombre() );
      out.write(" - ");
      out.print( estacion.getDireccion() );
      out.write("</option>\n");
      out.write("                                ");

                                }
                                
      out.write("\n");
      out.write("                            </select>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"form-group\">\n");
      out.write("                            <label for=\"destino\"><i class=\"fas fa-arrow-left\"></i> Destino:</label>\n");
      out.write("                            <select name=\"destino\" id=\"destino\"></select>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"d-flex\">\n");
      out.write("                            <div class=\"form-group\" style=\"margin-right: 5px;\">\n");
      out.write("                                <label for=\"salida\"><i class=\"fas fa-clock\"></i> Salida:</label>\n");
      out.write("                                <input type=\"date\" name=\"salida\" id=\"salida\">\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label for=\"pasajeros\"><i class=\"fas fa-users\"></i> Pasajeros:</label>\n");
      out.write("                                <input type=\"number\" name=\"pasajeros\" id=\"pasajeros\">\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <button type=\"submit\"><i class=\"fas fa-search\"></i> Buscar</button>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("            </section>\n");
      out.write("            \n");
      out.write("            <section style=\"background-color:#b71c1c;\">\n");
      out.write("                <div class=\"featured\">\n");
      out.write("                    <div class=\"icon\">\n");
      out.write("                        <i class=\"fas fa-globe\"></i>\n");
      out.write("                        <h5>Multilenguaje</h5>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"icon\">\n");
      out.write("                        <i class=\"fas fa-map-marked\"></i>\n");
      out.write("                        <h5>Explore</h5>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"icon\">\n");
      out.write("                        <i class=\"fas fa-flag\"></i>\n");
      out.write("                        <h5>Internacional</h5>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"icon\">\n");
      out.write("                        <i class=\"fas fa-users\"></i>\n");
      out.write("                        <h5>Usuarios</h5>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"icon\">\n");
      out.write("                        <i class=\"fas fa-luggage-cart\"></i>\n");
      out.write("                        <h5>Equipaje</h5>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("                \n");
      out.write("                <div class=\"d-flex p-20\">\n");
      out.write("                    <div class=\"w-50\" style=\"padding-right: 20px;\">\n");
      out.write("                        <h2 style=\"margin-bottom: 20px;\">Quiénes somos</h2>\n");
      out.write("                        <p>\n");
      out.write("                            Consulta los horarios de los autobuses y disfruta de todas las ventajas de organizar tus rutas de autobús, conociendo los horarios de cada trayecto antes de reservar.  <br><br>\n");
      out.write("                            Si tienes en mente algo distinto, ponte en contacto con nosotros, y te ofreceremos las mejores soluciones en transporte. Destacamos por nuestro compromiso y gestión de vehículos para que de lo único que tengas que preocuparte sea de disfrutar de tu acto especial.\n");
      out.write("                        </p>\n");
      out.write("                        <a class=\"btn-contact\" href=\"#\"><i class=\"fas fa-envelope\"></i> Contactar</a>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"w-50\">\n");
      out.write("                        <img class=\"ml-auto\" src=\"./assets/img/bus1.jpg\" width=\"100%\" alt=\"viaja conmigo\">\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                \n");
      out.write("            </section>\n");
      out.write("            \n");
      out.write("        </main>\n");
      out.write("        \n");
      out.write("        <footer>\n");
      out.write("        </footer>\n");
      out.write("        \n");
      out.write("    </body>\n");
      out.write("</html>\n");

session.setAttribute("listadoOrigen", null);

      out.write('\n');
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
