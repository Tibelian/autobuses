package POJOS;
// Generated 03-feb-2020 12:53:13 by Hibernate Tools 4.3.1


import java.util.Date;

/**
 * Tarjeta generated by hbm2java
 */
public class Tarjeta  implements java.io.Serializable {


     private Integer id;
     private Cliente cliente;
     private String tipo;
     private int numero;
     private Date caducidad;
     private int cvv;

    public Tarjeta() {
    }

    public Tarjeta(Cliente cliente, String tipo, int numero, Date caducidad, int cvv) {
       this.cliente = cliente;
       this.tipo = tipo;
       this.numero = numero;
       this.caducidad = caducidad;
       this.cvv = cvv;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Cliente getCliente() {
        return this.cliente;
    }
    
    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    public String getTipo() {
        return this.tipo;
    }
    
    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    public int getNumero() {
        return this.numero;
    }
    
    public void setNumero(int numero) {
        this.numero = numero;
    }
    public Date getCaducidad() {
        return this.caducidad;
    }
    
    public void setCaducidad(Date caducidad) {
        this.caducidad = caducidad;
    }
    public int getCvv() {
        return this.cvv;
    }
    
    public void setCvv(int cvv) {
        this.cvv = cvv;
    }




}


