
package servicios;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the servicios package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _DevuelveListado_QNAME = new QName("http://Servicios/", "devuelveListado");
    private final static QName _DevuelveListadoResponse_QNAME = new QName("http://Servicios/", "devuelveListadoResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: servicios
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link DevuelveListado }
     * 
     */
    public DevuelveListado createDevuelveListado() {
        return new DevuelveListado();
    }

    /**
     * Create an instance of {@link DevuelveListadoResponse }
     * 
     */
    public DevuelveListadoResponse createDevuelveListadoResponse() {
        return new DevuelveListadoResponse();
    }

    /**
     * Create an instance of {@link RutaSW }
     * 
     */
    public RutaSW createRutaSW() {
        return new RutaSW();
    }

    /**
     * Create an instance of {@link EstacionSW }
     * 
     */
    public EstacionSW createEstacionSW() {
        return new EstacionSW();
    }

    /**
     * Create an instance of {@link HorarioSW }
     * 
     */
    public HorarioSW createHorarioSW() {
        return new HorarioSW();
    }

    /**
     * Create an instance of {@link ViajeSW }
     * 
     */
    public ViajeSW createViajeSW() {
        return new ViajeSW();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DevuelveListado }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Servicios/", name = "devuelveListado")
    public JAXBElement<DevuelveListado> createDevuelveListado(DevuelveListado value) {
        return new JAXBElement<DevuelveListado>(_DevuelveListado_QNAME, DevuelveListado.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link DevuelveListadoResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Servicios/", name = "devuelveListadoResponse")
    public JAXBElement<DevuelveListadoResponse> createDevuelveListadoResponse(DevuelveListadoResponse value) {
        return new JAXBElement<DevuelveListadoResponse>(_DevuelveListadoResponse_QNAME, DevuelveListadoResponse.class, null, value);
    }

}
