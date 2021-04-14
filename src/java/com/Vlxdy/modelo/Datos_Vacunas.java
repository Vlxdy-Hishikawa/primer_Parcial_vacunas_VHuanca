package com.Vlxdy.modelo;
/**
 *
 * @author Vlxdy Hishikawa
 */
public class Datos_Vacunas {
    private int id;
    private String nombre;
    private Double peso;
    private Double talla;
    private String vacuna;
    
    public Datos_Vacunas()
    {
        id = 0;
        nombre = "";
        peso = 0.00;
        talla = 0.00;
        vacuna = "";
    }

    public Datos_Vacunas(int id, String nombre, Double peso, Double talla, String vacuna) {
        this.id = id;
        this.nombre = nombre;
        this.peso = peso;
        this.talla = talla;
        this.vacuna = vacuna;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Double getPeso() {
        return peso;
    }

    public void setPeso(Double peso) {
        this.peso = peso;
    }

    public Double getTalla() {
        return talla;
    }

    public void setTalla(Double talla) {
        this.talla = talla;
    }

    public String getVacuna() {
        return vacuna;
    }

    public void setVacuna(String vacuna) {
        this.vacuna = vacuna;
    }
}