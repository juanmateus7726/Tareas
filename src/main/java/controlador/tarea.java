/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controlador;

/**
 *
 * @author Personal
 */
public class tarea {
    
    private int id;
    private String descripcion;
    private boolean completada;
    
    //Constructor
    public tarea(int id, String descripcion) {
        this.id = id;
        this.descripcion = descripcion;
        this.completada = false;
    }
    //Getters y Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getDescripcion() {
        return descripcion;
    }
    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    public boolean iscompletada() {
        return completada;
    }
    public void setcompletada(boolean completada) {
        this.completada = completada;
    }
    
    
}
