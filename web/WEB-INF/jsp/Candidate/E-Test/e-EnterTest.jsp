<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
String tsdb_refid = session.getAttribute("tsdb").toString();
String pa_refid = session.getAttribute("pa").toString();

String sql1 = "SELECT tdb.tdb_refid, tdb.tdb_qno, tdb.tdb_quest "
        + "FROM test_db tdb, test_set_db tsdb "
        + "WHERE tdb.tsdb_refid = tsdb.tsdb_refid "
        + "AND tdb.tsdb_refid = ? ";
String param1[] = { tsdb_refid };
MainClient mc1 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> test = mc1.getQuery(sql1, param1);

String sql2 = "SELECT tsdb.tsdb_set_name, tst.tst_type "
        + "FROM test_set_db tsdb, test_set_type tst "
        + "WHERE tsdb.tst_refid = tst.tst_refid "
        + "AND tsdb.tsdb_refid = ? ";
String param2[] = { tsdb_refid };
MainClient mc2 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> test2 = mc2.getQuery(sql2, param2);

//out.print(test);
%>

<h4>E-Test</h4>

<div class="row">
    <div class="col-md-12">
        
        <table class="table table-bordered">
            <tr>
                <th width="20%">Test Set Name</th>
                <th width="5%">:</th>
                <td><%=test2.get(0).get(0) %></td>
            </tr>
            <tr>
                <th>Test Type</th>
                <th>:</th>
                <td><%=test2.get(0).get(1) %></td>
            </tr>
        </table>
        
    </div>
</div>

<form method="post" action="process/candidate/eTest/processTest.jsp">
<input type="hidden" name="tsdb" value="<%=tsdb_refid %>" />
<input type="hidden" name="pa" value="<%=pa_refid %>" />
<input type="hidden" name="type" value="<%=test2.get(0).get(1) %>" />
    <div class="row">
        <div class="col-md-12">

            <table class="table table-bordered table-hover">
                <% for (int i = 0; i < test.size(); i++) { String tdb_refid = test.get(i).get(0); %>
                <tr>
                    <th rowspan="2" width="5%"><%=i+1 %>.</th>
                    <th><%=test.get(i).get(2) %></th>
                </tr>
                <tr>
                    <td>
                        <%
                        if (test2.get(0).get(1).toUpperCase().equals("OBJECTIVE".toUpperCase())) {
                            String sql11 = "SELECT adb.adb_refid, adb.adb_ans, adb.adb_set_score "
                                    + "FROM answer_db adb, test_db tdb "
                                    + "WHERE adb.tdb_refid = tdb.tdb_refid "
                                    + "AND adb.tdb_refid = ? ";
                            String param11[] = { tdb_refid };
                            MainClient mc11 = new MainClient(DBConn.getHost());
                            ArrayList<ArrayList<String>> answer = mc11.getQuery(sql11, param11);

                            for (int j = 0; j < answer.size(); j++) {
                                %>
                                <label>
                                    <input type="radio" name="adb_answer_<%=i %>" value="<%=answer.get(j).get(0) %>"
                                           <% if (j == 0) { out.print("checked"); } %>
                                           /> <%=answer.get(j).get(1) %>
                                </label>
                                <br />
                                <%
                            }
                        } else if (test2.get(0).get(1).toUpperCase().equals("SUBJECTIVE".toUpperCase())) {
                            %>
                            <input type="hidden" name="tdb_refid_<%=i %>" value="<%=tdb_refid %>" />
                            <textarea name="adb_answer_<%=i %>" class="form-control" placeholder="Type your answer here."></textarea>
                            <%
                        }
                        %>
                    </td>
                </tr>
                <% } %>
                <tr>
                    <td colspan="2">
                        <button type="submit">Submit</button>
                    </td>
                </tr>
            </table>

        </div>
    </div>
</form>