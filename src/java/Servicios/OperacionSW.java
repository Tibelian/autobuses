
package Servicios;

import DAO.HibernateUtil;
import POJOS.Horario;
import POJOS.Ruta;
import POJOS.Viaje;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class OperacionSW {
    
    public ArrayList<RutaSW> devuelveRutas(){
        SessionFactory sf = HibernateUtil.getSessionFactory();
        Session session = sf.openSession();
        String hql = "from Ruta";
        Query query = session.createQuery(hql);
        List rutas = query.list();
        ArrayList<RutaSW> listadoRutasSW = new ArrayList();
        Iterator itRuta = rutas.iterator();
        while(itRuta.hasNext()){
            
            Ruta ruta = (Ruta)itRuta.next();
            Hibernate.initialize(ruta);
            Hibernate.initialize(ruta.getEstacionByIdOrigen());
            Hibernate.initialize(ruta.getEstacionByIdDestino());
            Hibernate.initialize(ruta.getHorarios());
            
            EstacionSW origen = new EstacionSW();
            origen.setId(ruta.getEstacionByIdOrigen().getId());
            origen.setDireccion(ruta.getEstacionByIdOrigen().getDireccion());
            origen.setLocalidad(ruta.getEstacionByIdOrigen().getLocalidad());
            origen.setNombre(ruta.getEstacionByIdOrigen().getNombre());
            
            EstacionSW destino = new EstacionSW();
            destino.setId(ruta.getEstacionByIdOrigen().getId());
            destino.setDireccion(ruta.getEstacionByIdDestino().getDireccion());
            destino.setLocalidad(ruta.getEstacionByIdDestino().getLocalidad());
            destino.setNombre(ruta.getEstacionByIdDestino().getNombre());
            
            RutaSW rutaSW = new RutaSW();
            rutaSW.setId(ruta.getId());
            rutaSW.setOrigen(origen);
            rutaSW.setDestino(destino);
            rutaSW.setPrecio(ruta.getPrecio());
            
            ArrayList<HorarioSW> listadoHorarios = new ArrayList();
            Iterator itHorario = ruta.getHorarios().iterator();
            while(itHorario.hasNext()){
                
                Horario horario = (Horario)itHorario.next();
                Hibernate.initialize(horario.getViajes());
                HorarioSW horarioSW = new HorarioSW();
                horarioSW.setId(horario.getId());
                horarioSW.setHora(horario.getHora());
                horarioSW.setTipo(horario.getTipo());
                listadoHorarios.add(horarioSW);
                //rutaSW.getHorarios().add(horarioSW);
                
                ArrayList<ViajeSW> listadoViajes = new ArrayList();
                Iterator itViaje = horario.getViajes().iterator();
                while(itViaje.hasNext()){
                    Viaje viaje = (Viaje)itViaje.next();
                    ViajeSW viajeSW = new ViajeSW();
                    viajeSW.setId(viaje.getId());
                    viajeSW.setFecha(viaje.getFecha());
                    viajeSW.setPlazas(viaje.getPlazas());
                    viajeSW.setPlazasDisponibles(viaje.getPlazasDisponibles());
                    listadoViajes.add(viajeSW);
                    //horarioSW.getViajes().add(viajeSW);
                }
                horarioSW.setViajes(listadoViajes);
                
            }
            rutaSW.setHorarios(listadoHorarios);
            listadoRutasSW.add(rutaSW);
            
        }
        session.close();
        return listadoRutasSW;
    }
    
}
