package POJOS;
// Generated 07-mar-2020 20:55:13 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Tarjeta generated by hbm2java
 */
public class Tarjeta  implements java.io.Serializable {


     private Integer id;
     private Cliente cliente;
     private String tipo;
     private byte[] numero;
     private Date caducidad;
     private int cvv;
     private Set compras = new HashSet(0);
     private Set compraBackups = new HashSet(0);

    public Tarjeta() {
    }

	
    public Tarjeta(Cliente cliente, String tipo, byte[] numero, Date caducidad, int cvv) {
        this.cliente = cliente;
        this.tipo = tipo;
        this.numero = numero;
        this.caducidad = caducidad;
        this.cvv = cvv;
    }
    public Tarjeta(Cliente cliente, String tipo, byte[] numero, Date caducidad, int cvv, Set compras, Set compraBackups) {
       this.cliente = cliente;
       this.tipo = tipo;
       this.numero = numero;
       this.caducidad = caducidad;
       this.cvv = cvv;
       this.compras = compras;
       this.compraBackups = compraBackups;
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
    public byte[] getNumero() {
        return this.numero;
    }
    
    public void setNumero(byte[] numero) {
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
    public Set getCompras() {
        return this.compras;
    }
    
    public void setCompras(Set compras) {
        this.compras = compras;
    }
    public Set getCompraBackups() {
        return this.compraBackups;
    }
    
    public void setCompraBackups(Set compraBackups) {
        this.compraBackups = compraBackups;
    }




}


