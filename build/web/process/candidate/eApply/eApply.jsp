<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Enumeration"%>
<%

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
                + "FROM login "
                + "WHERE l_refid ="+l_refid;
        
        MainClient mc3 = new MainClient(DBConn.getHost());
        String params3[] = {};
        ArrayList<ArrayList<String>> pph = mc3.getQuery(query3, params3);
        String c_refid = pph.get(0).get(0);
        String rl_refid = pph.get(0).get(1);
        
        
        int sc = req_candidates.size();
        int sa = req_addresses.size();
        int sl = req_logins.size();

        String param_candidate[] = new String[sc];
        String param_addresses[] = new String[sa];
        String param_logins[] = new String[sl];

        for (int i = 0; i < sc; i++) {
            param_candidate[i] = req_candidates.get(i).get(1);
        }
        for (int i = 0; i < sa; i++) {
            param_addresses[i] = req_addresses.get(i).get(1);
        }
        for (int i = 0; i < sl; i++) {
            param_logins[i] = req_logins.get(i).get(1);
        }

        String sql_candidate = "UPDATE candidate SET ";
        String sql_address = "UPDATE address SET ";
        String sql_login = "UPDATE login SET ";

        for (int i = 0; i < sc - 1; i++) {
            sql_candidate += req_candidates.get(i).get(0) + "=?, ";
        }
        for (int i = 0; i < sa - 1; i++) {
            sql_address += req_addresses.get(i).get(0) + "=?, ";
        }
        for (int i = 0; i < sl - 1; i++) {
            sql_login += req_logins.get(i).get(0) + "=?, ";
        }

        if (sc > 0) {
            sql_candidate += req_candidates.get(sc - 1).get(0) + "=? WHERE c_refid="+c_refid;
        }

        if (sa > 0) {
            sql_address += req_addresses.get(sa - 1).get(0) + "=? WHERE l_refid=?";
        }

        if (sl > 0) {
            sql_login += req_logins.get(sl - 1).get(0) + "=? WHERE l_refid=?";
        }

        //execute query candidate
        MainClient mc_candidate = new MainClient(DBConn.getHost());
        String isUpdate_candidate = mc_candidate.setQuery(sql_candidate, param_candidate);

        //execute query address
        MainClient mc_address = new MainClient(DBConn.getHost());
        String isUpdate_address = mc_address.setQuery(sql_address, param_addresses);

        //execute query login
        MainClient mc_login = new MainClient(DBConn.getHost());
        String isUpdate_login = mc_login.setQuery(sql_login, param_logins);

        if (isUpdate_candidate.equals("0") != true) {
            //error in saving to candidate table
            out.println(sql_candidate);
        } else {

        }

%>