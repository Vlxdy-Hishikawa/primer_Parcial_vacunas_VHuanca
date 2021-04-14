package com.Vlxdy.modelo;

import java.util.ArrayList;
import java.util.Iterator;
/**
 *
 * @author Vlxdy Hishikawa
 */
public class GestorVacunas {
    private ArrayList<Datos_Vacunas> lista;
    
    public GestorVacunas()
    {
        lista = new ArrayList<Datos_Vacunas>();
    }

    public ArrayList<Datos_Vacunas> getLista() {
        return lista;
    }

    public void setLista(ArrayList<Datos_Vacunas> lista) {
        this.lista = lista;
    }
    public void insertarVacunas(Datos_Vacunas item)
    {
        lista.add(item);
    }
    public void modificarVacunas(int pos, Datos_Vacunas item)
    {
        lista.set(pos, item);
    }
    public void eliminarVacunas(int pos)
    {
        lista.remove(pos);
    }
    public int obtieneId()
    {
        int idaux = 0;
        
        for (Datos_Vacunas item : lista){
            idaux = item.getId();
        }
        return  idaux + 1;    
    }
    public int ubicarVacunas(int id)
    {
        int pos = -1;
        Iterator<Datos_Vacunas> it = lista.iterator();
        
        while ( it.hasNext()){
            ++pos;
            Datos_Vacunas aux = it.next();
            
            if (aux.getId() == id){
                break;
            }
        }
        return pos;
    }
}