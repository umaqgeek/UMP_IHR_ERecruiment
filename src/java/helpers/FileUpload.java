/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package helpers;

import java.io.*;
import oms.rmi.server.MainClient;
import models.DBConn;
import com.oreilly.servlet.*;
import java.util.Enumeration;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItemStream;

public class FileUpload {
    
    public static boolean processFile(String path, FileItemStream item) {
        try {
            
            File f = new File(path + File.separator + "assets" + File.separator + "uploads");
            if (!f.exists()) {
                f.mkdir();
            }
            File savedFile = new File(f.getAbsolutePath() + File.separator + item.getName());
            FileOutputStream fos = new FileOutputStream(savedFile);
            InputStream is = item.openStream();
            int x = 0;
            byte[] b = new byte[1024];
            while ((x = is.read(b)) != -1) {
                fos.write(b, 0, x);
            }
            fos.flush();
            fos.close();
            return true;
        } catch (Exception e) {
            System.out.println("FileUpload 35: " + e.getMessage());
        }
        return false;
    }

    public boolean doPost(HttpServletRequest request) {
        String directory = request.getRequestURL().toString()+"assets/uploads";
        
        boolean error_exist=false;
        String complete_file_name=null;
        MultipartRequest mr = null;
        try{
            mr = new MultipartRequest(request,"assets/uploads/",10000000);
        }catch(IOException i){
            //file size too big
            error_exist=true;
        }
        
        if(!error_exist){
            Enumeration e = mr.getFileNames();
            String parameter_file_name = (String) e.nextElement();
            String file_name = mr.getFilesystemName(parameter_file_name);
            
            if(file_name==null)
            {
                //no file uploaded
            }
            else
            {
                complete_file_name=file_name+parameter_file_name;
            }
        }

        return true;
    }
}
