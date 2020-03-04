package POJOS;
// Generated 03-mar-2020 10:51:31 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Estacion generated by hbm2java
 */
public class Estacion  implements java.io.Serializable {


     private Integer id;
     private String nombre;
     private String direccion;
     private String localidad;
     private Set rutasForIdDestino = new HashSet(0);
     private Set rutasForIdOrigen = new HashSet(0);

    public Estacion() {
    }

	
    public Estacion(String nombre, String direccion, String localidad) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.localidad = localidad;
    }
    public Estacion(String nombre, String direccion, String localidad, Set rutasForIdDestino, Set rutasForIdOrigen) {
       this.nombre = nombre;
       this.direccion = direccion;
       this.localidad = localidad;
       this.rutasForIdDestino = rutasForIdDestino;
       this.rutasForIdOrigen = rutasForIdOrigen;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getDireccion() {
        return this.direccion;
    }
    
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }
    public String getLocalidad() {
        return this.localidad;
    }
    
    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }
    public Set getRutasForIdDestino() {
        return this.rutasForIdDestino;
    }
    
    public void setRutasForIdDestino(Set rutasForIdDestino) {
        this.rutasForIdDestino = rutasForIdDestino;
    }
    public Set getRutasForIdOrigen() {
        return this.rutasForIdOrigen;
    }
    
    public void setRutasForIdOrigen(Set rutasForIdOrigen) {
        this.rutasForIdOrigen = rutasForIdOrigen;
    }




}


