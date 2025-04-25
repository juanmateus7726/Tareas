<%-- 
    Document   : nuevaTarea
    Created on : 25/04/2025, 10:18:04 a. m.
    Author     : Personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nueva Tarea</title>
    </head>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            
            padding: 0;
            height: 100vh;
            background: linear-gradient(-45deg, #FF8916, #c2e9fb, #5F107A, #96e6a1);
            background-size: 400% 400%;
            animation: gradientBG 10s ease infinite;
           
          
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        h1 {
            animation: colorChange 4s ease-in-out infinite alternate;
            text-align: center;
        }

        @keyframes colorChange {
            0% {
                color: white;
            }
            100% {
                color: black;
            }
        }

        form {
            background-color: #D9D9D9;
            max-width: 400px;
            margin: 40px auto;
            padding: 30px;
            border-radius: 25px;
            border: 1px solid #000;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
            
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #000000;
            
        }

        input[type="text"] {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-size: 1rem;
          border: 1px solid #000;
        }

        input[type="submit"] {
            background-color: #4BB000;
            color: #000000;
            padding: 12px;
            border: 1px solid #000;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            color: #000000;
            background: linear-gradient(to right, #45D162,        #4CE6E2);
            transform: scale(1.05);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.25);
        }

        input[type="submit"]:active {
            transform: scale(0.98);
            box-shadow: 0 3px 8px rgba(0, 0, 0, 0.2);
        }

       a {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            font-size: 1.1em;
            animation: linkColorChange 4s ease-in-out infinite alternate;
        }

        @keyframes linkColorChange {
            0% {
                color: #add8e6; /* azul clarito */
            }
            100% {
                color: #003366; /* azul oscuro */
            }
        }

        a:hover {
            text-decoration: underline;
        }
  </style>
    <body>
        <h1>Nueva Tarea</h1>
        <form action="${pageContext.request.contextPath}/tareas/guardar" method="post">
            <label for="descripcion">Descripcion:</label>
            <input type="text" id="descripcion" name="descripcion" required>
            <br><br>
            <input type="submit" value="Guardar">
        </form>
            <br>
            <a href="${pageContext.request.contextPath}/tareas">Volver a la lista</a>
    </body>
</html>
