
package Servicios;

import Servicios.HorarioSW;
import java.util.Date;

public class ViajeSW {
    
    private Integer id;
    private Date fecha;
    private Integer plazas;
    private Integer plazasDisponibles;

    public ViajeSW() {
    }

    public ViajeSW(Integer id, Date fecha, Integer plazas, Integer plazasDisponibles) {
        this.id = id;
        this.fecha = fecha;
        this.plazas = plazas;
        this.plazasDisponibles = plazasDisponibles;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Integer getPlazas() {
        return plazas;
    }

    public void setPlazas(Integer plazas) {
        this.plazas = plazas;
    }

    public Integer getPlazasDisponibles() {
        return plazasDisponibles;
    }

    public void setPlazasDisponibles(Integer plazasDisponibles) {
        this.plazasDisponibles = plazasDisponibles;
    }    
    
    
}
