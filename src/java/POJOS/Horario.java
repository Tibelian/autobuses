package POJOS;
// Generated 18-feb-2020 13:25:29 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Horario generated by hbm2java
 */
public class Horario  implements java.io.Serializable {


     private Integer id;
     private Ruta ruta;
     private Date hora;
     private String tipo;
     private Set viajes = new HashSet(0);

    public Horario() {
    }

	
    public Horario(Ruta ruta, Date hora, String tipo) {
        this.ruta = ruta;
        this.hora = hora;
        this.tipo = tipo;
    }
    public Horario(Ruta ruta, Date hora, String tipo, Set viajes) {
       this.ruta = ruta;
       this.hora = hora;
       this.tipo = tipo;
       this.viajes = viajes;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Ruta getRuta() {
        return this.ruta;
    }
    
    public void setRuta(Ruta ruta) {
        this.ruta = ruta;
    }
    public Date getHora() {
        return this.hora;
    }
    
    public void setHora(Date hora) {
        this.hora = hora;
    }
    public String getTipo() {
        return this.tipo;
    }
    
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    public Set getViajes() {
        return this.viajes;
    }
    
    public void setViajes(Set viajes) {
        this.viajes = viajes;
    }




}


