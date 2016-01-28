<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%
ArrayList<ArrayList<String>> params1_temp = new ArrayList<ArrayList<String>>();
String pph_refid = "";
    
Enumeration en = request.getParameterNames();
while (en.hasMoreElements()) {
    Object objOri = en.nextElement();
    String param = (String) objOri;
    String value = request.getParameter(param);

    out.print(param + "|" + value + "<br />");
    
    if (param.toUpperCase().contains("PPH".toUpperCase())) {
        ArrayList<String> data_temp = new ArrayList<String>();
        data_temp.add(param);
        data_temp.add(value);
        params1_temp.add(data_temp);
        if (param.toUpperCase().equals("pph_refid".toUpperCase())) {
            pph_refid = value;
        }
    }
}

//out.print(params1_temp); if (true) { return; }

String sql1 = "UPDATE position_ptj_hr "
        + "SET ";
int s1 = params1_temp.size();
String params1[] = new String[s1+1];
for (int i = 0; i < s1-1; i++) {
    params1[i] = params1_temp.get(i).get(1);
    sql1 += params1_temp.get(i).get(0) + "=?, ";
}
if (s1 > 0) {
    params1[s1-1] = params1_temp.get(s1-1).get(1);
    sql1 += params1_temp.get(s1-1).get(0) + "=? ";
}
sql1 += "WHERE pph_refid=? ";
params1[s1] = pph_refid;
MainClient mc1 = new MainClient(DBConn.getHost());
String status1 = mc1.setQuery(sql1, params1);

if (status1.equals("0")) {
    
    String num_vp_refid = request.getParameter("num_vp_refid");
    int nvr = Integer.parseInt(num_vp_refid);
    
    for (int i = 0; i < nvr; i++) {
//        String vp_refid = request.getParameter("vp_refid_"+i);
//        int vp_total = Integer.parseInt(request.getParameter("vp_total_"+i));
        String vpp_refid = request.getParameter("vpp_refid_"+i);
        int vpp_total = Integer.parseInt(request.getParameter("vpp_total_"+i));
        int vpp_total_new = Integer.parseInt(request.getParameter("vpp_total_new_"+i));
        
//        vp_total = vp_total + vpp_total - vpp_total_new;
//        vpp_total_grand += vpp_total;
//        vpp_total_new_grand += vpp_total_new;
        
//        String sql_vp1 = "UPDATE vacancy_pos "
//                + "SET vp_total = ? "
//                + "WHERE vp_refid = ? ";
//        String param_vp1[] = { String.valueOf(vp_total), vp_refid };
//        MainClient mc_vp1 = new MainClient(DBConn.getHost());
//        mc_vp1.setQuery(sql_vp1, param_vp1);
        
        vpp_total = vpp_total_new;
        
//        if (vpp_total <= 0) {
//            String sql_vpp1 = "DELETE FROM vacancy_pos_ptj "
//                    + "WHERE vpp_refid = ? ";
//            String param_vpp1[] = { vpp_refid };
//            MainClient mc_vpp1 = new MainClient(DBConn.getHost());
//            mc_vpp1.setQuery(sql_vpp1, param_vpp1);
//        } else {
            String sql_vpp2 = "UPDATE vacancy_pos_ptj "
                    + "SET vpp_total = ? "
                    + "WHERE vpp_refid = ? ";
            String param_vpp2[] = { String.valueOf(vpp_total), vpp_refid };
            MainClient mc_vpp2 = new MainClient(DBConn.getHost());
            mc_vpp2.setQuery(sql_vpp2, param_vpp2);
//        }
    }
    
    String sql_ae1 = "DELETE FROM area_expertise_ptj "
            + "WHERE pph_refid = ? ";
    String param_ae1[] = { pph_refid };
    MainClient mc_ae1 = new MainClient(DBConn.getHost());
    
    String isDelete = mc_ae1.setQuery(sql_ae1, param_ae1);
    
    if (isDelete.equals("0")) {
        
        String num_ea_expert_code = request.getParameter("num_ea_expert_code");
        int nar = Integer.parseInt(num_ea_expert_code);
        for (int i = 0; i < nar; i++) {
            if (request.getParameter("ea_expert_code_"+i) != null && request.getParameter("ea_expert_code_"+i) != "") {
                String ea_expert_code = request.getParameter("ea_expert_code_"+i);
                
                String sql_ae2 = "INSERT INTO area_expertise_ptj(ea_expert_code, pph_refid) "
                        + "VALUES(?, ?) ";
                String param_ae2[] = { ea_expert_code, pph_refid };
                MainClient mc_ae2 = new MainClient(DBConn.getHost());
                mc_ae2.setQuery(sql_ae2, param_ae2);
            }
        }
    }
}

response.sendRedirect("../../../process.jsp?p=PTJ/E-Advertisement/e-advertisement_ptj.jsp");
%>