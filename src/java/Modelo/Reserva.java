
package Modelo;

import POJOS.Ocupacion;
import POJOS.Ruta;
import POJOS.Viaje;
import POJOS.Viajero;
import java.util.ArrayList;
import java.util.Date;

public class Reserva {
    
    private Ruta ruta;
    private Date fechaSalida;
    private Date fechaCompra;
    private int pasajeros;
    private Viaje viaje;
    private Ocupacion ocupacion;
    private ArrayList<Viajero> viajeros;
    
    public Reserva(){}
    
    public Reserva(Ruta ruta, Date fechaSalida, int pasajeros){
        this.ruta = ruta;
        this.fechaSalida = fechaSalida;
        this.pasajeros = pasajeros;
    }

    public ArrayList<Viajero> getViajeros() {
        return viajeros;
    }

    public void setViajeros(ArrayList<Viajero> viajeros) {
        this.viajeros = viajeros;
    }
    
    public Ruta getRuta() {
        return ruta;
    }

    public void setRuta(Ruta ruta) {
        this.ruta = ruta;
    }

    public Date getFechaSalida() {
        return fechaSalida;
    }

    public void setFechaSalida(Date fechaSalida) {
        this.fechaSalida = fechaSalida;
    }

    public int getPasajeros() {
        return pasajeros;
    }

    public void setPasajeros(int pasajeros) {
        this.pasajeros = pasajeros;
    }

    public Date getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(Date fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    public Viaje getViaje() {
        return viaje;
    }

    public void setViaje(Viaje viaje) {
        this.viaje = viaje;
    }

    public Ocupacion getOcupacion() {
        return ocupacion;
    }

    public void setOcupacion(Ocupacion ocupacion) {
        this.ocupacion = ocupacion;
    }
    
    
}
