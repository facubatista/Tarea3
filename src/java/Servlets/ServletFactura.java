/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
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
 * @author pc
 */
@WebServlet(name = "ServletFactura", urlPatterns = {"/ServletFactura"})
public class ServletFactura extends HttpServlet {

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
        String proveedor = (String)sesion.getAttribute("nickProveedor");
        String cliente = (String)request.getParameter("cliente");
        String nroReserva = (String)request.getParameter("nroReserva");
        String is = (String)request.getParameter("isFact");
        int numero = 0;
        if(nroReserva!=null){
        numero = Integer.parseInt(nroReserva);}
        if(is!=null){
            if(wsp.isFacturada(numero, cliente))
                response.getWriter().write("true");
            else
                response.getWriter().write("false");
        }else{
        if(!proveedor.isEmpty() && !cliente.isEmpty() && !nroReserva.isEmpty()){
            wsp.facturar(numero, cliente, proveedor);
            if(!wsp.facturado(numero, cliente, proveedor)){
                response.getWriter().write("true");
            }else{
                response.getWriter().write("false");
            }
        } else {
            response.getWriter().write("false");
        }}
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
