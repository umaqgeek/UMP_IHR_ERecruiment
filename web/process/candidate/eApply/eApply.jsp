<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%
//    ArrayList<ArrayList<String>> params_req = new ArrayList<ArrayList<String>>();
//
//    String formFlag = "";
//    String form_personal = "form_personal";
//    String form_achivement = "form_achivement";
//    CharSequence candidate_prefix = "C_";
//
//    Enumeration en = request.getParameterNames();
//
//    while (en.hasMoreElements()) {
//        Object objOri = en.nextElement();
//        String param = (String) objOri;
//        String value = request.getParameter(param);
//
//        out.print(param + " | " + value + "<br />");
//        ArrayList<String> datax = new ArrayList<String>();
//        datax.add(param);
//        datax.add(value);
//        params_req.add(datax);
//
//    }
//
//    String l_refid = "";
//    Enumeration sess = session.getAttributeNames();
//    while (sess.hasMoreElements()) {
//        String nama = (String) sess.nextElement();
//        String isi = (String) session.getAttribute(nama);
//        if (nama.equalsIgnoreCase("L_REFID")) {
//            l_refid = isi;
//        }
//    }
//
//    int s = params_req.size();
//
//    //check which form is submited
//    for (int i = 0; i < s; i++) {
//
//        if (params_req.get(i).contains(form_personal)) {
//            formFlag = "form_personal";
//
//        } else if (params_req.get(i).contains(form_achivement)) {
//            formFlag = "form_achievement";
//        }
//
//    }
//
//    //personal form processing
//    if (formFlag.toString() == "form_personal") {
//        //filter only candidate param
//        ArrayList<ArrayList<String>> params_form_personal = new ArrayList<ArrayList<String>>();
//
//        //check which form is submited
//        for (int i = 0; i < s; i++) {
//
//            if (params_req.get(i).get(0).contains(candidate_prefix)) {
//
//                ArrayList<String> dataxx = new ArrayList<String>();
//                dataxx.add(params_req.get(i).get(0));
//                dataxx.add(params_req.get(i).get(1));
//                params_form_personal.add(dataxx);
//            }
//        }
//
//        int z = params_form_personal.size();
//        String params_candidate_table[] = new String[z];
//         for (int i = 0; i < z; i++) {
//              params_candidate_table[i] = params_form_personal.get(i).get(1).toString();
//         }
//        
//        
//        out.print(params_candidate_table);
//    } else {
//        out.print("no form found");
//    }

ArrayList<ArrayList<String>> params_req = new ArrayList<ArrayList<String>>();

ArrayList<ArrayList<String>> req_candidates = new ArrayList<ArrayList<String>>();
ArrayList<ArrayList<String>> req_addresses = new ArrayList<ArrayList<String>>();
ArrayList<ArrayList<String>> req_logins = new ArrayList<ArrayList<String>>();

Enumeration en = request.getParameterNames();
while (en.hasMoreElements()) {
    Object objOri = en.nextElement();
    String param = (String) objOri;
    String value = request.getParameter(param);

    out.print(param + " | " + value + "<br />");
    
    ArrayList<String> datax = new ArrayList<String>();
    datax.add(param);
    datax.add(value);
    params_req.add(datax);
    
    // capture candidate inputs
    if (param.toUpperCase().contains("C_".toUpperCase())) {
        ArrayList<String> req_candidate = new ArrayList<String>();
        req_candidate.add(param);
        req_candidate.add(value);
        req_candidates.add(req_candidate);
    }
    
    // capture address inputs
    if (param.toUpperCase().contains("A_".toUpperCase())) {
        ArrayList<String> req_address = new ArrayList<String>();
        req_address.add(param);
        req_address.add(value);
        req_addresses.add(req_address);
    }
    
    // capture login inputs
    if (param.toUpperCase().contains("L_".toUpperCase())) {
        ArrayList<String> req_login = new ArrayList<String>();
        req_login.add(param);
        req_login.add(value);
        req_logins.add(req_login);
    }
}


int sc = req_candidates.size();
String sql_candidate = "UPDATE candidate SET ...."; // letak query update kau kt cni
String param_candidate[] = new String[sc];
for (int i = 0; i < sc; i++) {
    param_candidate[i] = req_candidates.get(i).get(1);
}
// execute query
MainClient mc_candidate = new MainClient(DBConn.getHost());
// isUpdate_candidate.equals("0") return true if success
String isUpdate_candidate = mc_candidate.setQuery(sql_candidate, param_candidate);

%>