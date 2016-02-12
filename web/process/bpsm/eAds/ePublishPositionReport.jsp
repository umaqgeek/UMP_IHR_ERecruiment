<%@ page import="models.DBConn"%>
<%@ page import="oms.rmi.server.MainClient"%>
<%@ page import="net.sf.jasperreports.engine.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="net.sf.jasperreports.view.*"%>
<%@ page import="net.sf.jasperreports.view.save.*"%>
<%@ page import="java.sql.Connection.*"%>
<%@ page import="java.sql.SQLException.*"%>
<%@ page import="java.util.HashMap.*"%>
<%@ page import="java.util.Map.*"%>
<%@ page import="net.sf.jasperreports.engine.JRException.*"%>
<%@ page import="net.sf.jasperreports.engine.xml.JRXmlLoader.*"%>
<%@ page import="net.sf.jasperreports.engine.JasperCompileManager.*"%>
<%@ page import="net.sf.jasperreports.engine.JasperFillManager.*"%>
<%@ page import="net.sf.jasperreports.engine.JasperExportManager.*"%>
<%@ page import="net.sf.jasperreports.engine.JasperPrint.*"%>
<%@ page import="net.sf.jasperreports.engine.JasperReport.*"%>
<%@ page import="net.sf.jasperreports.engine.design.JasperDesign.*"%>
<%@ page import="net.sf.jasperreports.view.JasperViewer.*"%>
<%@ page import="net.sf.jasperreports.engine.export.*"%>
<%@ page import="java.util.*,java.sql.*"%>
<%@ page import="javax.naming.*"%>
<%@ page import="java.text.*"%>
<%@ page import="javax.sql.*"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
    JasperReport jasperReport;
    JasperPrint jasperPrint;
    Connection conn = null;
    try {

        //MainClient mc = new MainClient(DBConn.getHost());
        
        //Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DBConn.getConn();
        //conn = mc.getOracleConn();
        
        String filePath = getServletContext().getRealPath("" + "/process/bpsm/eAds/reports/by_year.jrxml");
        String fileLogo = getServletContext().getRealPath("" + "/process/bpsm/eAds/reports/umplogo.jpg");

        jasperReport = JasperCompileManager.compileReport(filePath);
        Map parameters = new HashMap();

        String year = request.getParameter("year");
        if (year == null) {
            year = "";
        }

        parameters.put("P_YEAR", year);
        parameters.put("P_LOGO", fileLogo);

        jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, conn);

        OutputStream os = response.getOutputStream();

        //out.print(request.getParameter("type"));
       // if ((request.getParameter("type") != null) && request.getParameter("type").equals("pdf")) {
            response.setContentType("application/pdf");
            response.addHeader("Content-Type", "application/pdf");
            response.setHeader("Cache-Control", "no-cache");
            JasperExportManager.exportReportToPdfStream(jasperPrint, os);
        //}

    } catch (Exception ee) {
        System.out.println(ee);
    }
%>
