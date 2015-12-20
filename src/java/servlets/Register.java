/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import helpers.J;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.DBConn;
import oms.rmi.server.MainClient;

/**
 *
 * @author umarmukhtar
 */
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {
    
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
            out.println("<title>Servlet Register</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Register at " + request.getContextPath() + "</h1>");
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
        
        // get variables from the form.
        String c_icno = request.getParameter("c_icno");
        String c_name = request.getParameter("c_name");
        String l_email = request.getParameter("l_email");
        String l_username = request.getParameter("l_username");
        String l_password = request.getParameter("l_password");
        String l_safequest = request.getParameter("l_safequest");
        String l_safeans = request.getParameter("l_safeans");
        
        // open connection.
        MainClient mc = new MainClient(DBConn.getHost());
        
        // execute query 1.
        String data1[] = {c_icno, c_name};
        String query1 = "INSERT INTO candidate(c_icno, c_name) "
                + "VALUES(?,?)";
        String c_refid = mc.setQuery(query1, data1);
        
        // execute query 2.
        String query2 = "INSERT INTO login(rl_refid, c_refid, l_username, l_password, l_safequest, l_safeans, l_email, l_verification) "
                + "VALUES(?,?,?,?,?,?,?,?)";
        // 1450063069.273 -> role id of candidate
        String data2[] = {"1450630515.382", c_refid, l_username, l_password, l_safequest, l_safeans, l_email, "UNVERIFIED"};
        String l_refid = mc.setQuery(query2, data2);
        
        // redirect to login page.
        response.sendRedirect("index.jsp");
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
