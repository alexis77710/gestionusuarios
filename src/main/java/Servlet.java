// Librería para manejar excepciones del servlet
import jakarta.servlet.ServletException;

// Anotación para registrar el servlet sin necesidad de configurar en web.xml
import jakarta.servlet.annotation.WebServlet;

// Librerías para manejar solicitudes y respuestas HTTP
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// Para manejo de errores de entrada/salida
import java.io.IOException;

// Para escribir la respuesta HTML
import java.io.PrintWriter;

// Para convertir arrays en listas de manera fácil (necesario para usar forEach)
import java.util.Arrays;

// Mapa que almacena pares clave-valor (en este caso para errores de validación)
import java.util.HashMap;
import java.util.Map;


// Anotación que define la URL a la que responde este servlet
@WebServlet("/registro")
public class Servlet extends HttpServlet {

    // Método que se ejecuta cuando el formulario se envía por POST
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        // Establece el tipo de contenido de la respuesta como HTML
        resp.setContentType("text/html");

        // Obtenemos los datos enviados desde el formulario
        String username = req.getParameter("username"); // Campo texto
        String password = req.getParameter("password"); // Campo password
        String email = req.getParameter("email");       // Campo email
        String pais = req.getParameter("pais");         // Campo select
        String[] lenguajes = req.getParameterValues("lenguajes"); // Múltiples valores
        String[] roles = req.getParameterValues("roles");         // Múltiples valores (checkbox)
        String idioma = req.getParameter("idioma");     // Valor único (radio button)

        // Evaluamos si el checkbox "habilitar" fue marcado
        boolean habilitar = req.getParameter("habilitar") != null && req.getParameter("habilitar").equals("on");

        // Campo oculto del formulario
        String secreto = req.getParameter("secreto");

        // Mapa para almacenar errores de validación
        // Creamos un mapa para guardar los errores del formulario
        Map<String, String> errores = new HashMap<>();

        // Si el usuario está vacío o nulo
        if (username == null || username.isBlank()) {
            errores.put("username", "El usuario es obligatorio");
        }

        // Si el password está vacío o nulo
        if (password == null || password.isBlank()) {
            errores.put("password", "El password es obligatorio");
        }

        // Verifica que el email tenga el símbolo @
        if (email == null || !email.contains("@")) {
            errores.put("email", "El email es obligatorio y debe tener un formato de correo.");
        }

        // Si el país no está seleccionado o está vacío
        if (pais == null || pais.equals("") || pais.equals(" ")) {
            errores.put("pais", "El país es requerido !");
        }

        // Si no se seleccionó ningún lenguaje
        if (lenguajes == null || lenguajes.length == 0) {
            errores.put("lenguajes", "Debe seleccionar al menos una opción");
        }

        // Si no se seleccionó ningún rol
        if (roles == null || roles.length == 0) {
            errores.put("roles", "Debe seleccionar al menos un rol");
        }

        // Si no se seleccionó idioma
        if (idioma == null) {
            errores.put("idioma", "Debe seleccionar un idioma.");
        }

        // Si no hay errores, generamos la respuesta HTML
        if (errores.isEmpty()) {

            // Usamos PrintWriter para escribir directamente la respuesta HTML
            try (PrintWriter out = resp.getWriter()) {

                out.println("<!DOCTYPE html>");
                out.println("<html>");
                out.println("<head>");
                out.println("    <meta charset=\"UTF-8\">");
                out.println("    <title>Resultado form</title>");
                out.println("</head>");
                out.println("<body>");
                out.println("<h1>Resultado form!</h1>");

                // Lista de resultados
                out.println("<ul>");
                out.println("<li>Username: " + username + "</li>");
                out.println("<li>Password: " + password + "</li>");
                out.println("<li>Email: " + email + "</li>");
                out.println("<li>País: " + pais + "</li>");

                // Mostrar los lenguajes seleccionados en una sublista
                out.println("<li>Lenguajes: ");
                out.println("<ul>");
                Arrays.asList(lenguajes).forEach(lenguaje -> {
                    out.println("<li>" + lenguaje + "</li>");
                });
                out.println("</ul></li>");

                // Mostrar los roles seleccionados
                out.println("<li>Roles");
                out.println("<ul>");
                Arrays.asList(roles).forEach(role -> {
                    out.println("<li>" + role + "</li>");
                });
                out.println("</ul></li>");

                // Idioma, habilitación y campo oculto
                out.println("<li>Idioma: " + idioma + "</li>");
                out.println("<li>Habilitado: " + habilitar + "</li>");
                out.println("<li>Secreto" + secreto + "</li>");
                out.println("</ul>");

                out.println("</body>");
                out.println("</html>");
            }

        } else {
            // Si hay errores, reenviamos al formulario (index.jsp) con los errores como atributo
            req.setAttribute("errores", errores);
            getServletContext().getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }
}