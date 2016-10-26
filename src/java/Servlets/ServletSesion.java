package Servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
        
        //Iniciar Sesión
        String claveProveedor = request.getParameter("claveProveedor");//el claveProveedor que viene en el param puede ser el nickname o el email del cliente
        if (sesion.getAttribute("nickProveedor") == null && claveProveedor != null) {
            String nickname = wsp.verificarProveedor(claveProveedor);//Retorna el nickname
            sesion.setAttribute("nickProveedor", nickname);

            //Se setea el nombre de usuario en la sesion
            sesion.setAttribute("nomProveedor", wsp.getNombreProveedor(nickname));//Es el nombre para mostrar en la cabecera 
            
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("Vistas/Servicios.jsp");
            dispatcher.forward(request, response);
        }
        
        //Cerrar Sesión
        if (request.getParameter("cerrarSesion")!= null) {
            sesion.removeAttribute("nickProveedor");
            sesion.removeAttribute("nomProveedor");
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);
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
