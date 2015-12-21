/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import libraries.My_func;
import models.DBConn;
import oms.rmi.server.MainClient;

/**
 *
 * @author umarmukhtar
 */
@WebServlet(name = "Verify", urlPatterns = {"/Verify"})
public class Verify extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Verify</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Verify at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
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
        
        String l_refid = "0";
        try {
            l_refid = request.getParameter("l_refid");
        } catch (Exception e) {
            request.setAttribute(My_func.ERROR_KEY, "Invalid Key!");
            response.sendRedirect("index.jsp?p=index.jsp");
        }

        String query = "UPDATE login "
                + "SET l_verification = 'VERIFIED' "
                + "WHERE l_refid = ? ";
        MainClient mc = new MainClient(DBConn.getHost());
        String data1[] = {l_refid};
        String status = mc.setQuery(query, data1);

        if (status == "0") {
            request.setAttribute(My_func.INFO_KEY, "Your account has been verified.");
        } else {
            request.setAttribute(My_func.ERROR_KEY, "Your account cannot be verified!");
        }
        response.sendRedirect("index.jsp?p=index.jsp");
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
        
        String l_refid = "0";
        try {
            l_refid = request.getParameter("l_refid");
        } catch (Exception e) {
            request.setAttribute(My_func.ERROR_KEY, "Invalid Key!");
            response.sendRedirect("index.jsp?p=index.jsp");
        }
        
        String query = "UPDATE login "
                + "SET l_verification = 'VERIFIED' "
                + "WHERE l_refid = ? ";
        MainClient mc = new MainClient(DBConn.getHost());
        String data1[] = {l_refid};
        String status = mc.setQuery(query, data1);
        
        if (status == "0") {
            request.setAttribute(My_func.INFO_KEY, "Your account has been verified.");
        } else {
            request.setAttribute(My_func.ERROR_KEY, "Your account cannot be verified!");
        }
        response.sendRedirect("index.jsp?p=index.jsp");
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
