/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "ServletReservas", urlPatterns = {"/ServletReservas"})
public class ServletReservas extends HttpServlet {

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
        
        if(sesion.getAttribute("nickProveedor")==null){
            Cookie[] cookies = request.getCookies();
            for(Cookie c: cookies){
                if(c.getName().equals("nickProveedor")){
                    request.getRequestDispatcher("ServletSesion?claveProveedor="+c.getValue()).forward(request, response);
                    //sesion.setAttribute("nickProveedor", c.getValue());
                }
            }
        }
        
        //También se fija que haya iniciado sesion
        if(request.getParameter("verReservas")!=null && sesion.getAttribute("nickProveedor")!=null){
            sesion.setAttribute("reservasDeP", wsp.listarResDeProv((String)sesion.getAttribute("nickProveedor")));
            
            //Se setea el web service del proveedor, es necesario para mostrar informacionde los servicios y las promociones
            request.setAttribute("webServiceP", wsp);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("Vistas/Reservas.jsp");
            dispatcher.forward(request, response);
        }else{
            response.sendRedirect("Vistas/IniciarSesion.jsp");
            /*
            RequestDispatcher dispatcher = request.getRequestDispatcher("Vistas/IniciarSesion.jsp");
            dispatcher.forward(request, response);*/
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
