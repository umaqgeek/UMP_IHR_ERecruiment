/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "Index", urlPatterns = {"/Index"})
public class Index extends HttpServlet {

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
            out.println("<title>Servlet Index</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Index at " + request.getContextPath() + "</h1>");
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
//        processRequest(request, response);
        
        // declaration
        String userid = request.getParameter("userid");
        String pwd = request.getParameter("pwd");
        
        // sql query
        String sql = "SELECT rl.rl_role "
                + "FROM role rl, login l "
                + "WHERE rl.rl_refid = l.rl_refid "
                + "AND l.l_username = ? "
                + "AND l.l_password = ? "
                + "AND l.l_verification = 'VERIFIED' ";
        String params[] = {userid, pwd};
        
        // connection to db
        MainClient mc = new MainClient(DBConn.getHost());
        ArrayList<ArrayList<String>> data = mc.get(sql, params);

        if (data.size() > 0) {
            String role = data.get(0).get(0);
            if (role.toUpperCase().equals("PTJ")) {
                response.sendRedirect("PTJ/e-recruitment-home.html");
            } else if (role.toUpperCase().equals("BPSM")) {
                response.sendRedirect("BPSM/e-recruitment-home.html");
            } else if (role.toUpperCase().equals("CANDIDATE")) {
                response.sendRedirect("Candidate/e-recruitment-home.html");
            } else {
                response.sendRedirect("index.jsp?invalid=2");
            }
        } else {
            response.sendRedirect("index.jsp?invalid=1");
        }
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
