
package Servicios;

import java.util.ArrayList;

public class RutaSW {
    
    private Integer id;
    private EstacionSW origen;
    private EstacionSW destino;
    private float precio;
    private ArrayList<HorarioSW> horarios;

    public RutaSW() {
    }

    public RutaSW(Integer id, EstacionSW origen, EstacionSW destino, float precio, ArrayList horarios) {
        this.id = id;
        this.origen = origen;
        this.destino = destino;
        this.precio = precio;
        this.horarios = horarios;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public EstacionSW getOrigen() {
        return origen;
    }

    public void setOrigen(EstacionSW origen) {
        this.origen = origen;
    }

    public EstacionSW getDestino() {
        return destino;
    }

    public void setDestino(EstacionSW destino) {
        this.destino = destino;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public ArrayList<HorarioSW> getHorarios() {
        return horarios;
    }

    public void setHorarios(ArrayList<HorarioSW> horarios) {
        this.horarios = horarios;
    }
    
    
    
}
