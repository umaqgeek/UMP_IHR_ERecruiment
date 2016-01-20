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
    /*String pa_refid = "";
    Enumeration sess = session.getAttributeNames();
    while (sess.hasMoreElements()) {
        String nama = (String) sess.nextElement();
        String isi = (String) session.getAttribute(nama);
        if (nama.equalsIgnoreCase("pa_refid")) {
            pa_refid = isi;
        }
    }*/

    boolean error_exist = false;
    MultipartRequest mr = null;
    String path = Config.getBase_url(request).toString()+"assets/uploads/files/";

   //File f = new File("assets/uploads/images"); 
    //System.out.println(f.getAbsolutePath());
    
    try 
    {
        mr = new MultipartRequest(request, path, 10000000);
    } 
    catch (IOException i) 
    {
        error_exist = true;
    }

    if (!error_exist)
    {
        Enumeration e = mr.getFileNames();
        String parameter_file_name = (String) e.nextElement();
        String file_name = mr.getFilesystemName(parameter_file_name);

        if (file_name == null) 
        {
            //no file uploaded
            out.println("no file uploaded");
        } 
        else 
        {
            //update the db
            //String sql_image = "UPDATE CANDIDATE SET " + parameter_file_name.toUpperCase() + " =? WHERE C_REFID=?";
            //out.println(sql_image);
            //String param_image[] = {pa_refid};
            //execute query candidate
            //MainClient mc_image = new MainClient(DBConn.getHost());
            //String isUpdate_image = mc_image.setQuery(sql_image, param_image);
            //out.println(isUpdate_image);
            response.sendRedirect("process.jsp?p=Candidate/E-Offer/off_cand.jsp");
        }
    }
%>