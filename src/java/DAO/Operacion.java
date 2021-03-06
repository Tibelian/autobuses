
package DAO;

import Modelo.AutobusesException;
import POJOS.Administrador;
import POJOS.Cliente;
import POJOS.Compra;
import POJOS.CompraBackup;
import POJOS.Horario;
import POJOS.Ocupacion;
import POJOS.OcupacionBackup;
import POJOS.Ruta;
import POJOS.Tarjeta;
import POJOS.Viaje;
import POJOS.ViajeBackup;
import POJOS.Viajero;
import POJOS.ViajeroBackup;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class Operacion {
    
    public List obtenerOrigen(SessionFactory sessionBuilder){
        Session session = sessionBuilder.openSession();
        String hql = "from Estacion";
        Query query = session.createQuery(hql);
        List estaciones = query.list();
        session.close();
        return estaciones;
    }
    
    public List obtenerDestino(SessionFactory sessionBuilder, int id){
        Session session = sessionBuilder.openSession();
        String hql = "from Estacion where id != :id";
        Query query = session.createQuery(hql).setParameter("id", id);
        List estaciones = query.list();
        session.close();
        return estaciones;
    }
    
    public Ruta obtenerRuta(SessionFactory sessionBuilder, int origen, int destino) throws AutobusesException{
        
        // conexión
        Session session = sessionBuilder.openSession();
        Transaction tx = null;
        
        try{
           
            // consulta
            tx = session.beginTransaction();
            String hql = "from Ruta where id_origen = :origen and id_destino = :destino";
            Query query = session.createQuery(hql);
            query.setParameter("origen", origen);
            query.setParameter("destino", destino);
            Ruta ruta = (Ruta)query.uniqueResult();

            if(ruta == null){
                throw new AutobusesException(404, "No se han encontrado rutas");
            }
            
            // esto para que el hibernate que devuelva
            // también los datos de las llaves foráneas
            Hibernate.initialize(ruta.getEstacionByIdOrigen());
            Hibernate.initialize(ruta.getEstacionByIdDestino());
            Hibernate.initialize(ruta.getHorarios());

            // recorre el list para que me guarde
            // todos los viajes de cada horario
            Iterator horarios = ruta.getHorarios().iterator();
            while(horarios.hasNext()){
                Horario horario = (Horario)horarios.next();
                Hibernate.initialize(horario.getViajes());
            }
            
            tx.commit();

            // devuelve la ruta con todos sus datos
            return ruta;
            
        }catch(HibernateException HE){
            if(tx != null){
                tx.rollback();
            }
            throw HE;
        }finally{
            session.close();
        }
        
    }
    
    
    public Viaje obtenerViaje(SessionFactory sessionBuilder, int id){
        Session session = sessionBuilder.openSession();
        String hql = "from Viaje where id = :id";
        Query query = session.createQuery(hql);
        query.setParameter("id", id);
        Viaje viaje = (Viaje)query.uniqueResult();
        Hibernate.initialize(viaje.getHorario());
        Hibernate.initialize(viaje.getCompras());
        Iterator compras = viaje.getCompras().iterator();
        while(compras.hasNext()){
            Compra compra = (Compra)compras.next();
            Hibernate.initialize(compra.getOcupacions());
        }
        session.close();
        return viaje;
    }
    
    
    public Cliente iniciarSesion(SessionFactory sessionBuilder, String email, String password) throws AutobusesException{
        Session session = sessionBuilder.openSession();
        String hql = "from Cliente where email = :email and clave = :password";
        Query query = session.createQuery(hql);
        query.setParameter("email", email);
        query.setParameter("password", password);
        Cliente cliente = (Cliente)query.uniqueResult();
        if(cliente == null){
            throw new AutobusesException(404, "No se han encontrado el cliente");
        }
        Hibernate.initialize(cliente.getTarjetas());
        session.close();
        return cliente;
    }
    
    
    public Administrador iniciarSesionAdmin(SessionFactory sessionBuilder, String email, String password){
        Session session = sessionBuilder.openSession();
        String hql = "from Administrador where email = :email and clave = :password";
        Query query = session.createQuery(hql);
        query.setParameter("email", email);
        query.setParameter("password", password);
        Administrador admin = (Administrador)query.uniqueResult();
        session.close();
        return admin;
    }
    
    
    public boolean existeCuenta(SessionFactory sessionBuilder, String dni, String email){
        Session session = sessionBuilder.openSession();
        String hql = "from Cliente where dni = :dni OR email = :email";
        Query query = session.createQuery(hql);
        query.setParameter("email", email);
        query.setParameter("dni", dni);
        Cliente cliente = (Cliente)query.uniqueResult();
        session.close();
        return (cliente != null);
    }
    public void crearCuenta(SessionFactory sessionBuilder, Cliente cliente) throws HibernateException{
        Session session = sessionBuilder.openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            session.save(cliente);
            session.getTransaction().commit();
        }catch(HibernateException HE){
            
            if(tx != null){
                tx.rollback();
            }
            throw HE;
            
        }finally{
            session.close();
        }
    }
    
    
    public void agregarTarjeta(SessionFactory sessionBuilder, Tarjeta tarjeta) throws HibernateException{
        Session session = sessionBuilder.openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            session.save(tarjeta);
            session.getTransaction().commit();
        }catch(HibernateException HE){
            
            if(tx != null){
                tx.rollback();
            }
            throw HE;
            
        }finally{
            session.close();
        }
    }
    
    
    public void eliminarTarjeta(SessionFactory sessionBuilder, Tarjeta tarjeta) throws HibernateException{
        Session session = sessionBuilder.openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            session.delete(tarjeta);
            session.getTransaction().commit();
        }catch(HibernateException HE){
            if(tx != null){
                tx.rollback();
            }
            throw HE;
        }finally{
            session.close();
        }
    }
    
    
    public void guardarCompra(SessionFactory sessionBuilder, Compra compra) throws HibernateException{
        Session session = sessionBuilder.openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            session.saveOrUpdate(compra);
            session.getTransaction().commit();
        }catch(HibernateException HE){
            if(tx != null){
                tx.rollback();
            }
            throw HE;
        }finally{
            session.close();
        }
    }
    

    
    public List<Viaje> obtenerViajesNoFinalizados(SessionFactory sessionBuilder){
        Session session = sessionBuilder.openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            String hql = "from Viaje";
            Query query = session.createQuery(hql);
            List<Viaje> viajes = query.list();
            for (Viaje viaje : viajes) {
                Hibernate.initialize(viaje.getHorario());
                Hibernate.initialize(viaje.getHorario().getRuta());
                Hibernate.initialize(viaje.getHorario().getRuta().getEstacionByIdDestino());
                Hibernate.initialize(viaje.getHorario().getRuta().getEstacionByIdOrigen());
                Hibernate.initialize(viaje.getCompras());
                Iterator compras = viaje.getCompras().iterator();
                while(compras.hasNext()){
                    Compra compra = (Compra)compras.next();
                    Hibernate.initialize(compra.getTarjeta());
                    Hibernate.initialize(compra.getOcupacions());
                    Iterator ocupaciones = compra.getOcupacions().iterator();
                    while(ocupaciones.hasNext()){
                        Ocupacion ocupacion = (Ocupacion) ocupaciones.next();
                        Hibernate.initialize(ocupacion.getViajero());
                    }
                }
            }
            return viajes;
        }catch(HibernateException HE){
            if(tx != null){
                tx.rollback();
            }
            throw HE;
        }finally{
            session.close();
        }
    }
    
    
    public void guardarViajeBackup(SessionFactory sessionBuilder, Viaje viaje){
        Session session = sessionBuilder.openSession();
        Transaction tx = null;
        try{
            
            tx = session.beginTransaction();
            
            // hay que hacer los set de viaje backup
            // pero aquellos viajes que tengan otro objeto o list
            // habrá que hacer los set de esos también
            ViajeBackup viajeBackup = new ViajeBackup();
            viajeBackup.setFecha(viaje.getFecha());
            viajeBackup.setPlazas(viaje.getPlazas());
            viajeBackup.setHorario(viaje.getHorario());
            
            Iterator itCompra = viaje.getCompras().iterator();
            while(itCompra.hasNext()){
                Compra compra = (Compra)itCompra.next();
                CompraBackup compraBackup = new CompraBackup();
                compraBackup.setImporte(compra.getImporte());
                compraBackup.setLocalizador(compra.getLocalizador());
                compraBackup.setTarjeta(compra.getTarjeta());
                compraBackup.setViajeros(compra.getViajeros());
                compraBackup.setViajeBackup(viajeBackup);
                Iterator itOcupacion = compra.getOcupacions().iterator();
                while(itOcupacion.hasNext()){
                    Ocupacion ocupacion = (Ocupacion)itOcupacion.next();
                    OcupacionBackup ocupacionBackup = new OcupacionBackup();
                    ocupacionBackup.setAsiento(ocupacion.getAsiento());
                    ocupacionBackup.setImporte(ocupacion.getImporte());
                    ocupacionBackup.setCompraBackup(compraBackup);
                    ViajeroBackup viajeroBackup = new ViajeroBackup();
                    viajeroBackup.setApellidos(ocupacion.getViajero().getApellidos());
                    viajeroBackup.setDni(ocupacion.getViajero().getDni());
                    viajeroBackup.setNombre(ocupacion.getViajero().getNombre());
                    ocupacionBackup.setViajeroBackup(viajeroBackup);
                    compraBackup.getOcupacionBackups().add(ocupacionBackup);
                }
                viajeBackup.getCompraBackups().add(compraBackup);
            }
            
            session.saveOrUpdate(viajeBackup);
            tx.commit();
            
        }catch(HibernateException he){
            he.printStackTrace();
            if(tx != null){
                tx.rollback();
            }
            throw he;
        }finally{
            session.close();
        }
    }
    public void borrarViaje(SessionFactory sessionBuilder, Viaje viaje){
        Session session = sessionBuilder.openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            session.delete(viaje);
            tx.commit();
        }catch(HibernateException he){
            he.printStackTrace();
            if(tx != null){
                tx.rollback();
            }
            throw he;
        }finally{
            session.close();
        }
    
    }
    
    
    
    public Integer buscaIdViajero(SessionFactory sessionBuilder, String dni){
        Session session = sessionBuilder.openSession();
        String hql = "from Viajero where dni = :dni";
        Query query = session.createQuery(hql).setParameter("dni", dni);
        Viajero viajero = (Viajero)query.uniqueResult();
        session.close();
        if(viajero != null){
            return viajero.getId();
        }else{
            return null;
        }
    }
    
    
    public Compra localizaCompra(SessionFactory sessionBuilder, String localizador){
        Session session = sessionBuilder.openSession();
        String hql = "from Compra where localizador = :localizador";
        Query query = session.createQuery(hql).setParameter("localizador", localizador);
        Compra compra = (Compra)query.uniqueResult();
        Hibernate.initialize(compra.getTarjeta());
        Hibernate.initialize(compra.getOcupacions());
        Hibernate.initialize(compra.getViaje());
        Hibernate.initialize(compra.getViaje().getHorario());
        Hibernate.initialize(compra.getViaje().getHorario().getRuta());
        Hibernate.initialize(compra.getViaje().getHorario().getRuta().getEstacionByIdOrigen());
        Hibernate.initialize(compra.getViaje().getHorario().getRuta().getEstacionByIdDestino());
        Iterator itOcupacion = compra.getOcupacions().iterator();
        while(itOcupacion.hasNext()){
            Ocupacion ocupacion = (Ocupacion) itOcupacion.next();
            Hibernate.initialize(ocupacion.getViajero());
        }
        session.close();
        return compra;
    }
    
    
    public void actualizarCliente(SessionFactory sessionBuilder, Cliente cliente){
        Session session = sessionBuilder.openSession();
        Transaction tx = null;
        try{
            tx = session.beginTransaction();
            session.saveOrUpdate(cliente);
            tx.commit();
        }catch(HibernateException he){
            he.printStackTrace();
            if(tx != null){
                tx.rollback();
            }
            throw he;
        }finally{
            session.close();
        }
    }
    
}
