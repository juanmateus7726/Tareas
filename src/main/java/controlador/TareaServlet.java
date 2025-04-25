/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Authenticator;
import java.util.ArrayList;
import java.util.List;
import modelo.Tarea;



@WebServlet(name = "TareasServlet", urlPatterns = {"/tareas/*"})
public class TareaServlet extends HttpServlet {
    
    @Override
    protected void doGet (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Tarea> listarTareas = (List<Tarea>)
                session.getAttribute("tareas");
        if (listarTareas == null) {
            listarTareas = new ArrayList<>();
            session.setAttribute("tareas", listarTareas);
        }
        String pathInfo = request.getPathInfo();
        
        if (pathInfo == null || "/".equals(pathInfo)) {
            // Listar tareas
            request.getRequestDispatcher("listarTareas.jsp").forward(request, response);
        } else if ("/nueva".equals(pathInfo)) {
            //Formulario nueva tarea
            request.getRequestDispatcher("nuevaTarea.jsp").forward(request, response);
        }else if (pathInfo.startsWith("/completar/")) {
            // Completar tarea
            try {
                int id =
                        Integer.parseInt(pathInfo.substring("/completar/".length()));
                for (Tarea tarea : listarTareas) {
                    if (tarea.getId() == id) {
                        tarea.setCompletada(true);
                        break;
                    }
                }
            } catch (NumberFormatException e) {
                //Ignorar
            }
            response.sendRedirect(request.getContextPath() + "/tareas");
        }
    }

     @Override
     protected void doPost (HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {
         
         HttpSession session = request.getSession();
         List<Tarea> listarTareas = (List<Tarea>)
                 session.getAttribute("tareas");
         
         if (listarTareas == null) {
             listarTareas = new ArrayList<>();
             session.setAttribute("tareas", listarTareas);
         }
         String pathInfo = request.getPathInfo();
         
         if ("/guardar".equals(pathInfo)) {
             String descripcion = request.getParameter("descripcion");
             if (descripcion != null && !descripcion.trim().isEmpty()) {
                 int nuevoId = 1;
                 if (!listarTareas.isEmpty()) {
                     nuevoId = listarTareas.get(listarTareas.size() - 1).getId() + 1;
                 }
                 Tarea nuevaTarea = new Tarea(nuevoId, descripcion);
                 listarTareas.add(nuevaTarea);
             }
             response.sendRedirect(request.getContextPath() + "/tareas");
         }
     }
}
