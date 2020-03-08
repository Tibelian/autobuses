
package Servicios;

import java.util.ArrayList;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

@WebService(serviceName = "Rutas")
public class Rutas {

    
    @WebMethod(operationName = "devuelveListado")
    public ArrayList<RutaSW> devuelveListado() {
        return (ArrayList<RutaSW>) new OperacionSW().devuelveRutas();
    }
    
    
}
