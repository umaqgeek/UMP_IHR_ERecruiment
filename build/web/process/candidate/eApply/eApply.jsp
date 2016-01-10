<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%
    ArrayList<ArrayList<String>> params_req = new ArrayList<ArrayList<String>>();

    String formFlag = "";
    String form_personal = "form_personal";
    String form_achivement = "form_achivement";
    CharSequence candidate_prefix = "C_";

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

    }

    String l_refid = "";
    Enumeration sess = session.getAttributeNames();
    while (sess.hasMoreElements()) {
        String nama = (String) sess.nextElement();
        String isi = (String) session.getAttribute(nama);
        if (nama.equalsIgnoreCase("L_REFID")) {
            l_refid = isi;
        }
    }

    int s = params_req.size();

    //check which form is submited
    for (int i = 0; i < s; i++) {

        if (params_req.get(i).contains(form_personal)) {
            formFlag = "form_personal";

        } else if (params_req.get(i).contains(form_achivement)) {
            formFlag = "form_achievement";
        }

    }

    //personal form processing
    if (formFlag.toString() == "form_personal") {
        //filter only candidate param
        ArrayList<ArrayList<String>> params_form_personal = new ArrayList<ArrayList<String>>();

        //check which form is submited
        for (int i = 0; i < s; i++) {

            if (params_req.get(i).get(0).contains(candidate_prefix)) {

                ArrayList<String> dataxx = new ArrayList<String>();
                dataxx.add(params_req.get(i).get(0));
                dataxx.add(params_req.get(i).get(1));
                params_form_personal.add(dataxx);
            }
        }

        int z = params_form_personal.size();
        String params_candidate_table[] = new String[z];
         for (int i = 0; i < z; i++) {
              params_candidate_table[i] = params_form_personal.get(i).get(1).toString();
         }
        
        
        out.print(params_candidate_table);
    } else {
        out.print("no form found");
    }


%>