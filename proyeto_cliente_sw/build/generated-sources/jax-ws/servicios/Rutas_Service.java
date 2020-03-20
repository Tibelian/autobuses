
package servicios;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceException;
import javax.xml.ws.WebServiceFeature;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.11-b150120.1832
 * Generated source version: 2.2
 * 
 */
@WebServiceClient(name = "Rutas", targetNamespace = "http://Servicios/", wsdlLocation = "http://localhost:8080/autobuses/Rutas?wsdl")
public class Rutas_Service
    extends Service
{

    private final static URL RUTAS_WSDL_LOCATION;
    private final static WebServiceException RUTAS_EXCEPTION;
    private final static QName RUTAS_QNAME = new QName("http://Servicios/", "Rutas");

    static {
        URL url = null;
        WebServiceException e = null;
        try {
            url = new URL("http://localhost:8080/autobuses/Rutas?wsdl");
        } catch (MalformedURLException ex) {
            e = new WebServiceException(ex);
        }
        RUTAS_WSDL_LOCATION = url;
        RUTAS_EXCEPTION = e;
    }

    public Rutas_Service() {
        super(__getWsdlLocation(), RUTAS_QNAME);
    }

    public Rutas_Service(WebServiceFeature... features) {
        super(__getWsdlLocation(), RUTAS_QNAME, features);
    }

    public Rutas_Service(URL wsdlLocation) {
        super(wsdlLocation, RUTAS_QNAME);
    }

    public Rutas_Service(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, RUTAS_QNAME, features);
    }

    public Rutas_Service(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public Rutas_Service(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     * 
     * @return
     *     returns Rutas
     */
    @WebEndpoint(name = "RutasPort")
    public Rutas getRutasPort() {
        return super.getPort(new QName("http://Servicios/", "RutasPort"), Rutas.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns Rutas
     */
    @WebEndpoint(name = "RutasPort")
    public Rutas getRutasPort(WebServiceFeature... features) {
        return super.getPort(new QName("http://Servicios/", "RutasPort"), Rutas.class, features);
    }

    private static URL __getWsdlLocation() {
        if (RUTAS_EXCEPTION!= null) {
            throw RUTAS_EXCEPTION;
        }
        return RUTAS_WSDL_LOCATION;
    }

}
