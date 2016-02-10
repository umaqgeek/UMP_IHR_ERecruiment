<%-- 
    Document   : e_int_ptj_pass_list
    Created on : Feb 10, 2016, 12:40:21 PM
    Author     : Habib
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
    MainClient mc = new MainClient(DBConn.getHost());
    String pph_refid = session.getAttribute("pph_refid").toString();
    //out.print(pph_refid);
    String sql_pph_detail = "SELECT pph.pph_grade, pph.pph_position, pph.pph_ptj "
                        + "FROM position_ptj_hr pph "
                        + "WHERE pph.pph_refid = ? ";
    String param_pph_detail[] = { pph_refid };
    ArrayList<ArrayList<String>> data_pph_detail = mc.getQuery(sql_pph_detail, param_pph_detail);
%>
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><a href="process.jsp?p=BPSM/E-Interview/e_int_pos_to_setup_list.jsp" class="btn btn-default">Back</a></div>
        </div>
        <div class="row">
            <h4>SHORTLISTED CANDIDATE FOR PRE-INTERVIEW</h4>
        </div>
        <div class="row">
            <table style="width: 100%; background-color: white;">
                <tr>
                    <td style="font-weight: bold; width: 8%">Grade :</td><td><%=data_pph_detail.get(0).get(0) %></td>
                    <td style="font-weight: bold; width: 8%">Position :</td><td><%=data_pph_detail.get(0).get(1) %></td>
                    <td style="font-weight: bold; width: 8%">PTJ :</td><td><%=data_pph_detail.get(0).get(2) %></td>
                </tr>
            </table>
        </div>
        <div class="row">
            <table class="table-bordered" style="width: 100%">
                <thead style="vertical-align: middle;">
                <tr>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">#</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">Name</th>
                    <th style="vertical-align: middle; text-align: center; font-weight: bold">IC Number</th>
                </tr>
                </thead>
                    <tr>
                        <td rowspan="4" style="vertical-align: middle; text-align: center">1</td>
                        <td rowspan="4" style="vertical-align: middle; text-align: center">Grade 1</td>
                        <td rowspan="4" style="vertical-align: middle">Position 1</td>
                    </tr>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
</div>