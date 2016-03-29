<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="controller.Session"%>
<%@page import="libraries.My_func"%>
<%    
String pph_refid = session.getAttribute("pph").toString();
String l_refid = session.getAttribute(Session.KEY_USER_ID).toString();

//String str_pph = session.getAttribute("pphsx").toString();
//String str_split[] = str_pph.split("\\|");

String sql1 = "SELECT l.l_icno, c.c_name, a.a_roadno, a.a_postcode, a.a_city, a.a_state, c.c_hp, l.l_email "
        + "FROM login1 l, candidate c "
        + "LEFT JOIN address a ON c.c_refid = a.c_refid "
        + "WHERE l.c_refid = c.c_refid "
        + "AND l.l_refid = ? ";
String param1[] = { l_refid };
MainClient mc1 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d1 = mc1.getQuery(sql1, param1);

String sql2 = "SELECT pph.pph_grade, pph.pph_position, pph.pph_ptj "
        + "FROM position_ptj_hr pph "
        + "WHERE pph.pph_refid = ? ";
String param2[] = { pph_refid };
MainClient mc2 = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d2 = mc2.getQuery(sql2, param2);
%>

<button type="button" onclick="location.href='process.jsp?<%=My_func.URL_KEY %>=Candidate/E-Apply/e-apply-add.jsp';">Back</button>

<% if (d1.size() <= 0 || d2.size() <= 0) { return; } %>

<h3>Applicant's Personal Information</h3>

<table class='table table-bordered'>
    <tr>
        <th width='20%'>IC / Passport No.</th>
        <th width='5%'>:</th>
        <td><%=d1.get(0).get(0) %></td>
    </tr>
    <tr>
        <th>Full Name</th>
        <th>:</th>
        <td><%=d1.get(0).get(1) %></td>
    </tr>
    <tr>
        <th>Address</th>
        <th>:</th>
        <td><%=d1.get(0).get(2) %></td>
    </tr>
    <tr>
        <th>Postcode</th>
        <th>:</th>
        <td><%=d1.get(0).get(3) %></td>
    </tr>
    <tr>
        <th>City</th>
        <th>:</th>
        <td><%=d1.get(0).get(4) %></td>
    </tr>
    <tr>
        <th>State</th>
        <th>:</th>
        <td><%=d1.get(0).get(5) %></td>
    </tr>
    <tr>
        <th>Phone No.</th>
        <th>:</th>
        <td><%=d1.get(0).get(6) %></td>
    </tr>
    <tr>
        <th>E-Mail</th>
        <th>:</th>
        <td><%=d1.get(0).get(7) %></td>
    </tr>
</table>

    <h3>Job Applied</h3>
    
    <table class="table table-bordered">
        <tr>
            <th width='20%'>Grade</th>
            <th width='5%'>:</th>
            <td><%=d2.get(0).get(0) %></td>
        </tr>
        <tr>
            <th>Position</th>
            <th>:</th>
            <td><%=d2.get(0).get(1) %></td>
        </tr>
        <tr>
            <th>PTJ</th>
            <th>:</th>
            <td><%=d2.get(0).get(2) %></td>
        </tr>
    </table>
        
        <h4>Applicant's Recognition</h4>
        
        <table class="table table-bordered">
            <tr>
                <td>
                    I hereby confirm .... bla bla bla ..
                </td>
            </tr>
        </table>
        
        <form method="post" action="process/candidate/eApply/eApply_job.jsp">
            <input type="hidden" name="pph" value="<%=pph_refid %>" />
            <button type="submit">Confirm Apply</button>
        </form>