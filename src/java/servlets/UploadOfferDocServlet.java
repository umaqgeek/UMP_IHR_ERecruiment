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

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

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
    private static final String DATA_DIRECTORY = "data";
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024;
    
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
            //response.sendRedirect("process.jsp?p=Candidate/E-Offer/off_cand.jsp");
        }
        
        //http://stackoverflow.com/questions/19510656/how-to-upload-files-on-server-folder-using-jsp
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

            if (isMultipart) {
                // Create a factory for disk-based file items
                FileItemFactory factory = new DiskFileItemFactory();

                // Create a new file upload handler
                ServletFileUpload upload = new ServletFileUpload(factory);

                try {
                    // Parse the request
                    List items = upload.parseRequest(request);
                    Iterator iterator = items.iterator();
                    while (iterator.hasNext()) {
                        FileItem item = (FileItem) iterator.next();
                        if (!item.isFormField()) {
                            String fileName = item.getName();    
                            String root = getServletContext().getRealPath("/");
                            File path = new File(root + "/uploads");
                            if (!path.exists()) {
                                boolean status = path.mkdirs();
                            }

                            File uploadedFile = new File(path + "/" + fileName);
                            System.out.println(uploadedFile.getAbsolutePath());
                            item.write(uploadedFile);
                        }
                    }
                    response.sendRedirect("process.jsp?p=Candidate/E-Offer/off_cand.jsp");
                } catch (FileUploadException e) {
                    e.printStackTrace();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        //response.sendRedirect("process.jsp?p=Candidate/E-Offer/off_cand.jsp");
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
