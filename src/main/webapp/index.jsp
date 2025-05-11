<%--
Created by IntelliJ IDEA.
User: Elvis Pachacama
Date: 9/5/2025
Time: 18:55
Descripción:
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Map" %>
<%
Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
%>

<html lang="en">
<head>
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet"/>
    <title>Formulario usuario</title>
</head>
<body>
<div class="container">
    <h3>Formulario de Usuario</h3>

    <% if (errores != null && errores.size() > 0) { %>
    <ul>
        <% for (String error : errores.values()) { %>
        <li><%= error %></li>
        <% } %>
    </ul>
    <% } %>

    <form action="/app_formulario/registro" method="post">
        <!-- Usuario -->
        <div>
            <label for="username">Usuario:</label>
            <input type="text" name="username" id="username"/>
        </div>

        <!-- Password -->
        <div>
            <label for="password">Password:</label>
            <input type="password" name="password" id="password"/>
        </div>

        <!-- Email -->
        <div>
            <label for="email">Email:</label>
            <input type="email" name="email" id="email"/>
        </div>

        <!-- País -->
        <div>
            <label for="pais">País:</label>
            <select name="pais" id="pais">
                <option value="">-----Seleccionar-----</option>
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
        <div>
            <label for="lenguajes">Lenguajes:</label>
            <select name="lenguajes" id="lenguajes">
                <option value="">-----Seleccionar-----</option>
                <option value="Java">Java</option>
                <option value="Python">Python</option>
                <option value="C#">C#</option>
                <option value="C++">C++</option>
                <option value="Angular">Angular</option>
            </select>
        </div>

        <!-- Roles -->
        <div>
            <label>Roles:</label>
            <div>
                <input type="checkbox" name="roles" value="ROLE_ADMIN" id="admin"/>
                <label for="admin">Administrador</label>
            </div>
            <div>
                <input type="checkbox" name="roles" value="ROLE_USER" id="user"/>
                <label for="user">Usuario</label>
            </div>
            <div>
                <input type="checkbox" name="roles" value="ROLE_MODERADOR" id="moderador"/>
                <label for="moderador">Moderador</label>
            </div>
        </div>

        <!-- Idiomas -->
        <div>
            <label>Idiomas:</label>
            <div>
                <input type="radio" name="idioma" value="es" id="esp"/>
                <label for="esp">Español</label>
            </div>
            <div>
                <input type="radio" name="idioma" value="en" id="eng"/>
                <label for="eng">Inglés</label>
            </div>
            <div>
                <input type="radio" name="idioma" value="ru" id="rus"/>
                <label for="rus">Ruso</label>
            </div>
        </div>

        <!-- Habilitar -->
        <div>
            <label for="habilitar">Habilitar:</label>
            <input type="checkbox" name="habilitar" id="habilitar" checked/>
        </div>

        <!-- Submit y campo oculto -->
        <div>
            <input type="submit" value="Enviar"/>
        </div>
        <input type="hidden" name="secreto" value="123456"/>
    </form>
</div>
</body>
</html>
