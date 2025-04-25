<%-- 
    Document   : listarTareas
    Created on : 25/04/2025, 9:19:37 a. m.
    Author     : Personal
--%>

<%@ page import="modelo.Tarea" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista Tareas</title>
        <style>
            .completada {
                text-decoration: line-through;
                color: gray;
            }
        </style>
    </head>
    <body>
        <h1>Lista de Tareas</h1>
        <a href="${pageContext.request.contextPath}/tareas/nueva">Nueva Tarea</a>
        
        <% List<Tarea> tareas = (List<Tarea>)
                session.getAttribute("tareas"); %>
                
                <% if (tareas != null && !tareas.isEmpty()) { %>
                <ul>
                    <% for (Tarea tarea : tareas) { %>
                    <li class="<%= tarea.isCompletada() ? "completada" : "" %>">
                        <%= tarea.getDescripcion() %>
                        <% if (!tarea.isCompletada()) { %>
                        <a
                            href="${pageContext.request.contextPath}/tareas/completar/<%=
                                tarea.getId() %>">[Completar]</a>
                                <% } %>
                    </li>
                    <% } %>
    </ul>
    <% } else { %>
    <p>No hay tareas pendientes.</p>
                <% } %>
    </body>
</html>
