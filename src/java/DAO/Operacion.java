
package DAO;

import Modelo.AutobusesException;
import POJOS.Compra;
import POJOS.Horario;
import POJOS.Ruta;
import POJOS.Viaje;
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
        return estaciones;
    }
    
    public List obtenerDestino(SessionFactory sessionBuilder, int id){
        Session session = sessionBuilder.openSession();
        String hql = "from Estacion where id != :id";
        Query query = session.createQuery(hql).setParameter("id", id);
        List estaciones = query.list();
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
        return viaje;
    }
    
    
    
    
}