<%--
Created by IntelliJ IDEA.
User: Alexis Arcos🗿
Date: 11/05/2025
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%
Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
%>

<html lang="en">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Formulario usuario</title>
</head>
<body class="bg-light"> <!-- Aplica fondo claro usando clase de Bootstrap -->
<div class="container mt-5"> <!-- Contenedor principal con margen superior -->
    <div class="row justify-content-center"> <!-- Fila centrada horizontalmente -->
        <div class="col-md-8"> <!-- Columna de ancho medio (8/12) -->
            <div class="card shadow-lg rounded"> <!-- Card con sombra y bordes redondeados -->
                <div class="card-header bg-primary text-white text-center"> <!-- Encabezado de la tarjeta con fondo azul, texto blanco y centrado -->
                    <h3>Formulario de Usuario</h3>
                </div>

                <div class="card-body"> <!-- Cuerpo principal del formulario -->

                    <% if (errores != null && errores.size() > 0) { %> <!-- Verifica si hay errores en el mapa -->
                    <div class="alert alert-danger"> <!-- Muestra alerta roja si hay errores -->
                        <ul class="mb-0">
                            <% for (String error : errores.values()) { %> <!-- Recorre cada mensaje de error -->
                            <li><%= error %></li> <!-- Muestra cada error en una lista -->
                            <% } %>
                        </ul>
                    </div>
                    <% } %>

                    <form action="/app_formulario/registro" method="post"> <!-- Formulario que se envía por POST -->

                        <!-- Campo Usuario -->
                        <div class="mb-3"> <!-- Margen inferior -->
                            <label for="username" class="form-label">Usuario:</label>
                            <input type="text" name="username" id="username" class="form-control"/> <!-- Input con estilo de Bootstrap -->
                        </div>

                        <!-- Campo Password -->
                        <div class="mb-3">
                            <label for="password" class="form-label">Password:</label>
                            <input type="password" name="password" id="password" class="form-control"/>
                        </div>

                        <!-- Campo Email -->
                        <div class="mb-3">
                            <label for="email" class="form-label">Email:</label>
                            <input type="email" name="email" id="email" class="form-control"/>
                        </div>

                        <!-- País y Lenguajes en 2 columnas -->
                        <div class="row"> <!-- Agrupa en fila -->
                            <!-- País -->
                            <div class="col-md-6 mb-3">
                                <label for="pais" class="form-label">País:</label>
                                <select name="pais" id="pais" class="form-select"> <!-- Dropdown estilizado -->
                                    <option value="">--Seleccionar--</option>
                                    <option value="ES">España</option>
                                    <option value="EC">Ecuador</option>
                                    <option value="PE">Perú</option>
                                    <option value="CO">Colombia</option>
                                    <option value="BR">Brazil</option>
                                    <option value="AR">Argentina</option>
                                    <option value="VE">Venezuela</option>
                                </select>
                            </div>
                            <!-- Lenguajes -->
                            <div class="col-md-6 mb-3">
                                <label for="lenguajes" class="form-label">Lenguajes:</label>
                                <select name="lenguajes" id="lenguajes" class="form-select">
                                    <option value="">--Seleccionar--</option>
                                    <option value="Java">Java</option>
                                    <option value="Python">Python</option>
                                    <option value="C#">C#</option>
                                    <option value="C++">C++</option>
                                    <option value="Angular">Angular</option>
                                </select>
                            </div>
                        </div>

                        <!-- Roles (checkbox en línea) -->
                        <div class="mb-3">
                            <label class="form-label">Roles:</label><br/>
                            <div class="form-check form-check-inline">
                                <input type="checkbox" name="roles" value="ROLE_ADMIN" id="admin" class="form-check-input"/>
                                <label for="admin" class="form-check-label">Administrador</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="checkbox" name="roles" value="ROLE_USER" id="user" class="form-check-input"/>
                                <label for="user" class="form-check-label">Usuario</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="checkbox" name="roles" value="ROLE_MODERADOR" id="moderador" class="form-check-input"/>
                                <label for="moderador" class="form-check-label">Moderador</label>
                            </div>
                        </div>

                        <!-- Idiomas (radio en línea) -->
                        <div class="mb-3">
                            <label class="form-label">Idiomas:</label><br/>
                            <div class="form-check form-check-inline">
                                <input type="radio" name="idioma" value="es" id="esp" class="form-check-input"/>
                                <label for="esp" class="form-check-label">Español</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" name="idioma" value="en" id="eng" class="form-check-input"/>
                                <label for="eng" class="form-check-label">Inglés</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input type="radio" name="idioma" value="ru" id="rus" class="form-check-input"/>
                                <label for="rus" class="form-check-label">Ruso</label>
                            </div>
                        </div>

                        <!-- Habilitar (checkbox) -->
                        <div class="form-check mb-3">
                            <input type="checkbox" name="habilitar" id="habilitar" class="form-check-input" checked/>
                            <label for="habilitar" class="form-check-label">Habilitar</label>
                        </div>

                        <!-- Botón de Enviar -->
                        <div class="d-grid"> <!-- Hace que el botón use todo el ancho -->
                            <button type="submit" class="btn btn-success">Enviar</button>
                        </div>

                        <!-- Campo oculto (por seguridad o control) -->
                        <input type="hidden" name="secreto" value="123456"/>
                    </form>

                </div> <!-- /card-body -->
            </div> <!-- /card -->
        </div> <!-- /col -->
    </div> <!-- /row -->
</div> <!-- /container -->
</body>

</html>
