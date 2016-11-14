package Servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import webservices.WSProveedores;
import webservices.WSProveedoresService;

/**
 *
 * @author Kevin
 */
@WebServlet(urlPatterns = {"/ServletSesion"})
public class ServletSesion extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        WSProveedoresService wsps = new WSProveedoresService();
        WSProveedores wsp = wsps.getWSProveedoresPort();
        
        HttpSession sesion = request.getSession();     
        
        String claveProveedor = request.getParameter("claveProveedor");
        
        //Buscar si se guardó cookie del nickname
        String nickCookie = null;
        Cookie[] cookies = request.getCookies();
        
        for(Cookie c: cookies){
            if(c.getName().equals("nickProveedor")){
                nickCookie = c.getValue();
                claveProveedor = nickCookie;//Si se encuentra la cookie, inicia sesion con ese nickname
            }
        }
        ////
        
        //Es para la primer pagina, index, redirecciona a aca para buscar si existe la cookie, si no existe redirecciona a la página de inicio de sesion
        if(request.getParameter("index")!=null && nickCookie==null){
            if(sesion.getAttribute("nickProveedor") == null){
                response.sendRedirect("Vistas/IniciarSesion.jsp");
            }
        }
        
        //Iniciar Sesión
        //el claveProveedor que viene en el param puede ser el email del cliente o el nickname(tambien es nickname si se encotró la cookie)
        if (sesion.getAttribute("nickProveedor") == null && claveProveedor != null) {
            String nickname = wsp.verificarProveedor(claveProveedor);//Retorna el nickname
            sesion.setAttribute("nickProveedor", nickname);

            //Si marcó el checkbox "Recordarme"
            if(request.getParameter("recordarme")!= null){
                //Se setea la cookie con el nickname, es para recordarlo
                Cookie c = new Cookie("nickProveedor", nickname);
                c.setMaxAge(60*60*24);//Tiempo de vida en segundos
                response.addCookie(c);//Se agrega al response para enviarselo al browser(cliente)
            }
            
            //Se setea el nombre de usuario en la sesion
            sesion.setAttribute("nomProveedor", wsp.getNombreProveedor(nickname));//Es el nombre para mostrar en la cabecera 
                        
            RequestDispatcher dispatcher = request.getRequestDispatcher("ServletServProm?Servicios=true");
            dispatcher.forward(request, response);
        }
        
        //Cerrar Sesión
        if (request.getParameter("cerrarSesion")!= null) {
            sesion.removeAttribute("nickProveedor");
            sesion.removeAttribute("nomProveedor");
            sesion.removeAttribute("serviciosDeP");
            sesion.removeAttribute("promosDeP");
            sesion.removeAttribute("reservasDeP");
           
            //Borrar cookie
            cookies = request.getCookies();
            for(Cookie c: cookies){
                if(c.getName().equals("nickProveedor")){
                    c.setMaxAge(0);//Tiempo de vida 0, se elimina
                    response.addCookie(c);
                }
            }
            
            response.sendRedirect("Vistas/IniciarSesion.jsp");
        }
        
        //Verificar que el nickname sea valido
        if (request.getParameter("verificarProveedor") != null) {
            //especifica que el tipo de respuesta va a ser texto
            response.setContentType("text/plain");
            claveProveedor = (String) request.getParameter("verificarProveedor");
            if (wsp.verificarProveedor(claveProveedor).equals("false")) {
                response.getWriter().write("false");
            } else {//Se crea el texto correspondiente a un objeto jason de nombre verificacion, con el atributo booleano
                response.getWriter().write("true");
            }
        }
        
        //Verificar password
        if (request.getParameter("verificarPassword") != null && request.getParameter("proveedor") != null) {
           response.setContentType("text/plain");
           String nickname = (String)request.getParameter("proveedor");
           nickname = wsp.verificarProveedor(nickname);//Retorna el nickname, esto es por si el usuario ingresa su email para logearse
           String password = (String)request.getParameter("verificarPassword");
            if (wsp.validarPasswordProv(nickname, password)==true){
                response.getWriter().write("passOK");
            } else {
                response.getWriter().write("passMAL");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
