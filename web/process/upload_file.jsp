<%-- 
    Document   : upload_file
    Created on : Jan 17, 2016, 10:01:20 AM
    Author     : Bilal
--%>
<%@page import="org.apache.commons.fileupload.FileItemStream"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.FileItemIterator"%>
<%@page import="helpers.FileUpload"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="java.io.*"%>
<%@page import="config.Config"%>
<%
    out.print("oi");
    String l_refid = "";
    Enumeration sess = session.getAttributeNames();
    while (sess.hasMoreElements()) {
        String nama = (String) sess.nextElement();
        String isi = (String) session.getAttribute(nama);
        if (nama.equalsIgnoreCase("L_REFID")) {
            l_refid = isi;
        }
    }
   
    //get C_REFID from L_REFID
    String query3 = "SELECT c_refid,rl_refid "
            + "FROM login1 "
            + "WHERE L_REFID = ? ";
    out.print(query3);
 
    MainClient mc3 = new MainClient(DBConn.getHost());
    String params3[] = { l_refid };
    ArrayList<ArrayList<String>> pph = mc3.getQuery(query3, params3);
   
    String c_refid = pph.get(0).get(0);

    String file_name = "";
    String fieldName = "";
    boolean isUpload = false;
    boolean isMultiPart = ServletFileUpload.isMultipartContent(request);
    out.print("a");
    if (isMultiPart) {
        out.print("a1");
        ServletFileUpload upload = new ServletFileUpload();
        FileItemIterator itr = upload.getItemIterator(request);
        while (itr.hasNext()) {
            out.print("a11");
            FileItemStream item = itr.next();
            if (item.isFormField()) {
                out.print("a111");
            } else {
                out.print("a112");
                String path1 = getServletContext().getRealPath("/");
                isUpload = FileUpload.processFile(path1, item);
                if (isUpload) {
                    file_name = item.getName();
                    fieldName = item.getFieldName();
                }
            }
        }
    }

   //File f = new File("assets/uploads/images"); 
    //System.out.println(f.getAbsolutePath());
    
//    try {
//        mr = new MultipartRequest(request, path, 10000000);
//    } catch (IOException i) {
//        error_exist = true;
//    }

    if (isUpload) {
//        Enumeration e = mr.getFileNames();
//        String parameter_file_name = (String) e.nextElement();
//        String file_name = mr.getFilesystemName(parameter_file_name);

//        if (file_name == null) {
//            //no file uploaded
//            out.println("no file uploaded");
//        } else {
            //update the db

            String sql_image = "UPDATE CANDIDATE SET C_IMAGE =? WHERE C_REFID=?";
            out.println(sql_image);
            String param_image[] = new String[2];
            param_image[0] = file_name;
            param_image[1] = c_refid;
            //execute query candidate
            MainClient mc_image = new MainClient(DBConn.getHost());
            String isUpdate_image = mc_image.setQuery(sql_image, param_image);
            out.println(isUpdate_image);
//        }
    }
    
    response.sendRedirect("../../../process.jsp?p=Candidate/E-Apply/e-apply.jsp");
%>