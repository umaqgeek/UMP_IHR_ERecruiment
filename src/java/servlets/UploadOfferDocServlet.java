/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import models.DBConn;
import oms.rmi.server.MainClient;

/**
 *
 * @author User
 */
@WebServlet(name = "UploadOfferDocServlet", urlPatterns = {"/UploadOfferDocServlet"})
@MultipartConfig(maxFileSize = 16177215) 
public class UploadOfferDocServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        MainClient mc = new MainClient(DBConn.getHost());
        InputStream inputStream = null;
        Part filePart = request.getPart("offer_doc");
        String pa_refid = request.getParameter("pa_refid");
        
        if (filePart != null) 
        {
            inputStream = filePart.getInputStream();
            String od_type = filePart.getContentType();
            String od_name = filePart.getName();
            long od_sizeTmp = filePart.getSize();
            String od_size = Long.toString(od_sizeTmp);
            String params[] ={ od_name, od_type, od_size, pa_refid };
            String sql ="INSERT INTO OFFER_DOCUMENTS(OD_NAME, OD_TYPE, OD_SIZE, PA_REFID) "
                    + "VALUES ( ? , ? , ? , ?)";
            mc.setQuery(sql, params);
            response.sendRedirect("process.jsp?p=Candidate/E-Offer/off_cand.jsp");
        }
        //response.sendRedirect("../../../process.jsp?p=Candidate/E-Offer/off_cand.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
