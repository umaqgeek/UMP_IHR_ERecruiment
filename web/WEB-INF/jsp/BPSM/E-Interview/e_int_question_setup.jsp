<%-- 
    Document   : e_int_question_setup
    Created on : Feb 6, 2016, 1:23:32 PM
    Author     : Habib
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="models.DBConn"%>
<%
MainClient mc = new MainClient(DBConn.getHost());

String is_refid = session.getAttribute("is_refid").toString();
String sql_iii_refid = "SELECT irm.irm_refid "
                    +"FROM interview_setup iss, interview_result_mark irm, interview_irm_icm iii "
                    +"WHERE iss.is_refid = irm.is_refid "
                    +"AND irm.irm_refid = iii.irm_refid "
                    +"AND iss.is_refid = ? ";
String param_iii_refid[] = { is_refid };
ArrayList<ArrayList<String>> data_iii_refid = mc.getQuery(sql_iii_refid, param_iii_refid);

String sql_criteria_list = "SELECT icm.icm_refid, icm.icm_criteria, icm.icm_minmark, icm.icm_maxmark "
                        + "FROM interview_criteria_mark icm "
                        + "ORDER BY icm.icm_criteria";
String param_criteria_list[] = {};
ArrayList<ArrayList<String>> data_criteria_list = mc.getQuery(sql_criteria_list, param_criteria_list);
%>
<div class="row">
    <div class="well">
        <div class="row">
            <div class="col-sm-12"><a href="#modalDiscard" data-toggle="modal" class="btn btn-default">Back</a></div>
        </div>
        <div class="row">
            <h3></h3>
        </div>
        <div class="row">
            <div class="col-sm-12"><a href="#modalChooseCriteria" data-toggle="modal" class="btn btn-primary">Choose Mark Criteria</a></div>
        </div>
        <div class="row">
            <h4>Preview:</h4>
            <table style="width: 100%; font-size: 75%" class="table-bordered">
                <thead style="vertical-align: middle;">
                    <tr style="vertical-align: middle;">
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">NAME</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">KELAYAKAN AKADEMI</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">PENGALAMAN KERJA</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">MINAT TERHADAP</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">PENGETAHUAN AM</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">KECERDASAN</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">KO-KURIKULUM</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">KEMAHIRAN KOMUNIKASI</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">SAHSIAH</th>
                        <th style="vertical-align: middle; text-align: center; font-weight: bold">DECISION</th>
                    </tr>
                </thead>
                <tbody>
                     <tr>
                        <td style="vertical-align: middle; text-align: center">1</td>
                        <td style="vertical-align: middle; text-align: center"><a>Candidate Name</a></td>
                        <td style="vertical-align: middle; text-align: center">
                            <select class="form-control">
                                <option class="disabled">-</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                                <option>9</option>
                                <option>10</option>
                            </select>
                        </td>
                        <td style="vertical-align: middle; text-align: center">
                            <select class="form-control">
                                <option class="disabled">-</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                                <option>9</option>
                                <option>10</option>
                            </select>
                        </td>
                        <td style="vertical-align: middle; text-align: center">
                            <select class="form-control">
                                <option class="disabled">-</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                                <option>9</option>
                                <option>10</option>
                            </select>
                        </td>
                        <td style="vertical-align: middle; text-align: center">
                            <select class="form-control">
                                <option class="disabled">-</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                                <option>9</option>
                                <option>10</option>
                            </select>
                        </td>
                        <td style="vertical-align: middle; text-align: center">
                            <select class="form-control">
                                <option class="disabled">-</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                                <option>9</option>
                                <option>10</option>
                            </select>
                        </td>
                        <td style="vertical-align: middle; text-align: center">
                            <select class="form-control">
                                <option class="disabled">-</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                                <option>9</option>
                                <option>10</option>
                            </select>
                        </td>
                        <td style="vertical-align: middle; text-align: center">
                            <select class="form-control">
                                <option class="disabled">-</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                                <option>9</option>
                                <option>10</option>
                            </select>
                        </td>
                        <td style="vertical-align: middle; text-align: center">
                            <select class="form-control">
                                <option class="disabled">-</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                                <option>6</option>
                                <option>7</option>
                                <option>8</option>
                                <option>9</option>
                                <option>10</option>
                            </select>
                        </td>
                        <td style="vertical-align: middle; text-align: center">
                            <select class="form-control">
                                <option class="disabled">-Choose-</option>
                                <option>PASS</option>
                                <option>FAIL</option>
                                <option>KIV</option>
                            </select>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal Discard Setup -->
<div id="modalDiscard" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <form action="" method="post">
        <div class="modal-content">
            <div class="modal-body" align="center">
                <fieldset>
                    <h4 class="modal-title" style="font-weight: bold">GO BACK</h4>
                    <h6 class="modal-title">Are You Sure ?</h6>
                </fieldset>
            </div>
            <div class="modal-footer">
                <a class="btn btn-warning form-control" href="process.jsp?p=BPSM/E-Interview/e_int_pos_saved_setup_list.jsp">OK</a>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- ENd Modal Discard Setup -->

<!-- Modal Choose Criteria -->
<div id="modalChooseCriteria" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <form action="process/bpsm/eInterview/e_int_select_criteria_process.jsp" method="post">
        <input type="hidden" name="is_refid" value="<%=is_refid %>">
        <div class="modal-content">
            <div class="modal-header" align="center">
                <h4>Choose Criteria</h4>
            </div>
            <div class="modal-body" align="center">
                <fieldset>
                    <table style="width: 100%" class="table-bordered">
                        <thead style="vertical-align: middle;">
                            <tr style="vertical-align: middle;">
                                <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">#</th>
                                <th style="vertical-align: middle; text-align: center; font-weight: bold">Criteria</th>
                                <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Min. Mark</th>
                                <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Max. Score</th>
                                <th style="vertical-align: middle; text-align: center; font-weight: bold; width: 1%">Choose</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                        for(int a = 0; a < data_criteria_list.size(); a++)
                        {
                            %>
                            <tr>
                               <td style="vertical-align: middle; text-align: center"><%=a+1 %></td>
                               <td style="vertical-align: middle"><%=data_criteria_list.get(a).get(1) %></td>
                               <td style="vertical-align: middle; text-align: center"><%=data_criteria_list.get(a).get(2) %></td>
                               <td style="vertical-align: middle; text-align: center"><%=data_criteria_list.get(a).get(3) %></td>
                               <td style="vertical-align: middle; text-align: center"><input name="icm_refid" type="checkbox" value="<%=data_criteria_list.get(a).get(0) %>"></td>
                            </tr>
                            <%
                        }
                        %>
                        </tbody>
                    </table>
                </fieldset>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success form-control" type="submit">SAVE</button>
            </div>
        </div>
        </form>
    </div>
</div>
<!-- ENd Modal Discard Setup -->