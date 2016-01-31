<%@page import="libraries.My_func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="java.util.Enumeration"%>
<%
Enumeration req = request.getParameterNames();
while (req.hasMoreElements()) {
    String name = (String) req.nextElement();
    String content = (String) request.getParameter(name);
    
    out.print(name + " | " + content + "<br />");
}
//if (true) { return; }

String tsdb_refid = request.getParameter("tsdb");
String pa_refid = request.getParameter("pa");
String type = request.getParameter("type");

String sql1 = "SELECT tdb.tdb_refid "
        + "FROM test_db tdb "
        + "WHERE tdb.tsdb_refid = ? ";
String param1[] = { tsdb_refid };
MainClient mc1 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> answ = mc1.getQuery(sql1, param1);

//out.print(answ.size()); if (true) { return; }

int as = answ.size();

int totalScore = 0;
for (int i = 0; i < as; i++) {
    String adb_refid = request.getParameter("adb_answer_"+i);
    int score = 0;
    
    if (type.toUpperCase().equals("OBJECTIVE".toUpperCase())) {
        String sql11 = "SELECT adb.adb_set_score "
                + "FROM answer_db adb "
                + "WHERE adb.adb_refid = ? ";
        String param11[] = { adb_refid };
        MainClient mc11 = new MainClient(DBConn.getHost());
        ArrayList<ArrayList<String>> ans11 = mc11.getQuery(sql11, param11);
        try {
            score = Integer.parseInt(ans11.get(0).get(0));
        } catch (Exception e) {
            score = 0;
        }
        totalScore += score;
    } else if (type.toUpperCase().equals("SUBJECTIVE".toUpperCase())) {
        String tdb_refid = request.getParameter("tdb_refid_"+i);
        String sql12 = "SELECT adb.adb_ans, adb.adb_set_score "
                + "FROM answer_db adb "
                + "WHERE adb.tdb_refid = ? ";
        String param12[] = { tdb_refid };
        MainClient mc12 = new MainClient(DBConn.getHost());
        ArrayList<ArrayList<String>> ans12 = mc12.getQuery(sql12, param12);
        for (int j = 0; j < ans12.size(); j++) {
            adb_refid = adb_refid.replaceAll(",", " ");
            String words[] = adb_refid.split(" ");
            for (int k = 0; k < words.length; k++) {
                if (words[k].toUpperCase().equals(ans12.get(j).get(0).toUpperCase())) {
                    try {
                        score = Integer.parseInt(ans12.get(j).get(1));
                    } catch (Exception e) {
                        score = 0;
                    }
                    totalScore += score;
                }
            }
        }
    }
}

//out.print(totalScore); if (true) { return; }

String tr_marks = String.valueOf(totalScore);

String sql2 = "UPDATE test_result "
        + "SET tr_marks = ? "
        + "WHERE pa_refid = ? "
        + "AND tsdb_refid = ? ";
String param2[] = { tr_marks, pa_refid, tsdb_refid };
MainClient mc2 = new MainClient(DBConn.getHost());
mc2.setQuery(sql2, param2);

response.sendRedirect("../../../process.jsp?"+My_func.URL_KEY+"=Candidate/E-Test/e-ReviewTest.jsp&pa="+pa_refid);
%>