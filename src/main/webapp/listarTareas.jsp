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
             * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
            body {
        height: 100vh;
        font-family: Arial, sans-serif;
        color: #fff;
        background: linear-gradient(-45deg, #FF8916, #c2e9fb, #5F107A, #96e6a1);
        background-size: 400% 400%;
        animation: gradientBG 15s ease infinite;
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 20px;
    }

            h1 {
                text-align: center;
                color: white;
                animation: colorChange 3s infinite alternate;
                 margin-bottom: 20px;
            }

            a {
                text-decoration: none;
                padding: 8px 16px;
                background-color: #3498db;
                color: white;
                border-radius: 8px;
                transition: background-color 0.5s;
                display: inline-block;
                margin: 10px;
            }

            a:hover {
                background-color: #2c3e50;
            }

             ul {
                 list-style: none;
                padding: 0;
                width: 100%;
                max-width: 600px;
    }
            li {
                background: rgba(255, 255, 255, 0.2);
                padding: 10px 15px;
                margin: 10px 0;
                border-radius: 10px;
                color: white;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .completada {
                text-decoration: line-through;
                color: #dcdcdc;
            }

            @keyframes gradientBG {
                0% {background-position: 0% 50%;}
                50% {background-position: 100% 50%;}
                100% {background-position: 0% 50%;}
            }

            @keyframes colorChange {
                0% { color: white; }
                100% { color: black; }
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
