package POJOS;
// Generated 07-mar-2020 20:55:13 by Hibernate Tools 4.3.1



/**
 * OcupacionBackup generated by hbm2java
 */
public class OcupacionBackup  implements java.io.Serializable {


     private Integer id;
     private CompraBackup compraBackup;
     private ViajeroBackup viajeroBackup;
     private int asiento;
     private double importe;

    public OcupacionBackup() {
    }

    public OcupacionBackup(CompraBackup compraBackup, ViajeroBackup viajeroBackup, int asiento, double importe) {
       this.compraBackup = compraBackup;
       this.viajeroBackup = viajeroBackup;
       this.asiento = asiento;
       this.importe = importe;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public CompraBackup getCompraBackup() {
        return this.compraBackup;
    }
    
    public void setCompraBackup(CompraBackup compraBackup) {
        this.compraBackup = compraBackup;
    }
    public ViajeroBackup getViajeroBackup() {
        return this.viajeroBackup;
    }
    
    public void setViajeroBackup(ViajeroBackup viajeroBackup) {
        this.viajeroBackup = viajeroBackup;
    }
    public int getAsiento() {
        return this.asiento;
    }
    
    public void setAsiento(int asiento) {
        this.asiento = asiento;
    }
    public double getImporte() {
        return this.importe;
    }
    
    public void setImporte(double importe) {
        this.importe = importe;
    }




}


