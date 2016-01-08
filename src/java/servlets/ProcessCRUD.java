/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import config.Config;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
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
@WebServlet(name = "ProcessCRUD", urlPatterns = {"/ProcessCRUD"})
public class ProcessCRUD extends HttpServlet {

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
            out.println("<title>Servlet ProcessCRUD</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProcessCRUD at " + request.getContextPath() + "</h1>");
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
        
        String CRUD_table = request.getParameter("CRUD_table");
        String CRUD_type = request.getParameter("CRUD_type");
        String query = "";
        
        if (CRUD_type.toUpperCase().equals(My_func.DELETE.toUpperCase())) {
            
            String priCol = request.getParameter("idtype");
            String priVal = request.getParameter("id");
            query = "DELETE FROM "+CRUD_table+" WHERE "+priCol+"=? ";
            String params[] = {priVal};
            
            MainClient mc = new MainClient(DBConn.getHost());
            mc.setQuery(query, params);
            
        }
        
        response.sendRedirect(Config.getBase_url(request)+"index.jsp");
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
        
        String CRUD_table = request.getParameter("CRUD_table");
        String CRUD_type = request.getParameter("CRUD_type");
        String query = "";
        
        if (CRUD_type.toUpperCase().equals(My_func.INSERT.toUpperCase())) {
            
            ArrayList<String[]> param_values = new ArrayList<String[]>();
            Enumeration en = request.getParameterNames();
            while (en.hasMoreElements()) {
                Object objOri = en.nextElement();
                String param = (String) objOri;
                String value = request.getParameter(param);
                if (!param.toUpperCase().contains("CRUD_table".toUpperCase()) && 
                        !param.toUpperCase().contains("CRUD_type".toUpperCase())) {
                    String param_value[] = {param, value};
                    param_values.add(param_value);
                }
            }
            
            query = "INSERT INTO " + CRUD_table + "(";
            for (int i = 0; i < param_values.size()-1; i++) {
                query += param_values.get(i)[0] + ",";
            }
            if (param_values.size() > 0) {
                query += param_values.get(param_values.size()-1)[0];
            }
            query += ") VALUES(";
            for (int i = 0; i < param_values.size()-1; i++) {
                query += "?,";
            }
            if (param_values.size() > 0) {
                query += "?";
            }
            query += ")";
            
            String values[] = new String[param_values.size()];
            for (int i = 0; i < param_values.size(); i++) {
                values[i] = param_values.get(i)[1];
            }
            
            MainClient mc = new MainClient(DBConn.getHost());
            mc.setQuery(query, values);
            
        }
        
        response.sendRedirect(Config.getBase_url(request)+"index.jsp");
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
