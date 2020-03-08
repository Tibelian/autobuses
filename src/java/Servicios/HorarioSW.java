
package Servicios;

import java.util.ArrayList;
import java.util.Date;

public class HorarioSW {

    private Integer id;
    private Date hora;
    private String tipo;
    private ArrayList<ViajeSW> viajes;

    public HorarioSW() {
    }
    
    public HorarioSW(Integer id, Date hora, String tipo, ArrayList viajes) {
        this.id = id;
        this.hora = hora;
        this.tipo = tipo;
        this.viajes = viajes;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getHora() {
        return hora;
    }

    public void setHora(Date hora) {
        this.hora = hora;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public ArrayList<ViajeSW> getViajes() {
        return viajes;
    }

    public void setViajes(ArrayList<ViajeSW> viajes) {
        this.viajes = viajes;
    }
    
    
    
}
