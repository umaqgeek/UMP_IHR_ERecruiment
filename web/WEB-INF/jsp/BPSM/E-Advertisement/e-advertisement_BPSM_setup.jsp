<%@page import="helpers.Func"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
String pph_refid = session.getAttribute("pph_refid").toString();
//out.print(pph_refid);
//if (true) { return; }

String query_vpp = "SELECT * "
        + "FROM vacancy_pos_ptj vpp, vacancy_pos vp, position_ptj_hr pph "
        + "WHERE vpp.pph_refid = pph.pph_refid "
        + "AND vpp.vp_refid = vp.vp_refid "
        + "AND pph.pph_refid = ? ";
String params_vpp[] = {pph_refid};
MainClient mc_vpp = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> data_vpp = mc_vpp.getQuery(query_vpp, params_vpp);

String query_aep = "SELECT * "
        + "FROM area_expertise_ptj aep, area_expertise ae, position_ptj_hr pph "
        + "WHERE aep.pph_refid = pph.pph_refid "
        + "AND aep.ae_refid = ae.ae_refid "
        + "AND pph.pph_refid = ? ";
String params_aep[] = {pph_refid};
MainClient mc_aep = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> data_aep = mc_aep.getQuery(query_aep, params_aep);

String query_grade_bmbi = "SELECT * "
        + "FROM lookup_detail ld, lookup_master lm "
        + "WHERE ld.lm_refid = lm.lm_refid "
        + "AND lm.lm_refid = ? "
        + "ORDER BY ld.ld_refid ASC ";
String params_qgb[] = {"1451791447.1"};
MainClient mc_qgb = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> data_qgb = mc_qgb.getQuery(query_grade_bmbi, params_qgb);

String sql_pph = "SELECT "
        + "pph.pph_startdate, " //0
        + "pph.pph_enddate, " //1
        + "pph.pph_spm_bm, " //2
        + "pph.pph_spm_bi, " //3
        + "pph.pph_cgpa, " //4
        + "pph.pph_muet, " //5
        + "pph.pph_term_app, " //6
        + "pph.pph_salary_min, " //7
        + "pph.pph_salary_max, " //8
        + "pph.pph_status " //9
        + "FROM position_ptj_hr pph "
        + "WHERE pph.pph_refid = ? ";
String param_pph[] = { pph_refid };
MainClient mc_pph = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> data_pph = mc_pph.getQuery(sql_pph, param_pph);

//out.print(data_vpp);
//if (true) { return; }
%>

<ul>
    <li><a href="process.jsp?p=BPSM/E-Advertisement/e-advertisement_BPSM.jsp">&lt;&lt; Back to List of Positions </a></li>
</ul>

<form method="post" action="process/bpsm/eAds/eAds1.jsp" id="form_bpsm_eads1">
    <!--<div class="row">
        Grade: <%=data_vpp.get(0).get(10) %> <br />
        Position: <%=data_vpp.get(0).get(11) %> <br />
        PTJ: <%=data_vpp.get(0).get(12) %> <br />
    </div>
    <hr />--->
  

	<!-----------------start------------------->
		<div class="accordion">
		<div class="accordion-section ">
				<a class="accordion-section-title " href="#accordion-5">PTJ: <%=data_vpp.get(0).get(14) %></a>
				<div id="accordion-5" class="accordion-section-content">
					Grade: <%=data_vpp.get(0).get(12) %> <br />
					Position: <%=data_vpp.get(0).get(13) %> <br />
				</div><!--end .accordion-section-content-->
			</div><!--end .accordion-section-->

		
			<div class="accordion-section">
				<a class="accordion-section-title" href="#accordion-1">Vacancy Position</a>
				<div id="accordion-1" class="accordion-section-content">
					<table class="table">
						<thead>
							<tr>
								<th>Job Status</th>
								<th>Total</th>
								<th>Campus</th>
			<!--                    <th>Add</th>-->
							</tr>
						</thead>
						<tbody>
							<% for (int i = 0; i < data_vpp.size(); i++) { %>
							<tr>
								<td><%=data_vpp.get(i).get(4) %></td>
								<td><%=data_vpp.get(i).get(2) %></td>
								<td><%=data_vpp.get(i).get(3) %></td>
			<!--                    <td>
									<button type="button">
										<i class="glyphicon glyphicon-plus"></i> Add
									</button>
								</td>-->
							</tr>
							<% } %>
						</tbody>
					</table>
				</div><!--end .accordion-section-content-->
			</div><!--end .accordion-section-->

			<div class="accordion-section">
				<a class="accordion-section-title" href="#accordion-2">Special Competence (PTJ)</a>
				<div id="accordion-2" class="accordion-section-content">
					<div class="tabbable boxed parentTabs">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#set1">Skill</a>  
							</li>
							<li><a href="#set2">Attitude</a>
							</li>
							<li><a href="#set3">Knowledge</a>
							</li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane fade in active" id="set1">
								<%=data_vpp.get(0).get(15) %>
							</div>

							<div class="tab-pane fade" id="set2">
								<%=data_vpp.get(0).get(16) %>
							</div>

							<div class="tab-pane fade" id="set3">
								<%=data_vpp.get(0).get(17) %>
							</div>
						</div>
					</div>

					<script>
						$("ul.nav-tabs a").click(function (e) {
							e.preventDefault();
							$(this).tab('show');
						});
					</script>
				</div><!--end .accordion-section-content-->
			</div><!--end .accordion-section-->

			<div class="accordion-section">
				<a class="accordion-section-title" href="#accordion-3">Area of Expertise  (PTJ)</a>
				<div id="accordion-3" class="accordion-section-content">
					 <% for (int i = 0; i < data_aep.size(); i++) { %>
						<%=data_aep.get(i).get(4) %> <br />
					<% } %>
				</div><!--end .accordion-section-content-->
			</div><!--end .accordion-section-->
			
			<div class="accordion-section">
				<a class="accordion-section-title" href="#accordion-4"> Additional conditions (if any) (PTJ)</a>
				<div id="accordion-4" class="accordion-section-content">
					 <%=data_vpp.get(0).get(18) %>
				</div><!--end .accordion-section-content-->
			</div><!--end .accordion-section-->
		</div><!--end .accordion-->
	
	<!------------------------end---------------->
    <input type="hidden" name="pph_refid" value="<%=pph_refid %>" />
	<br/>
<!--	<hr/>
	<br/>


     data for BPSM 
    
    <div class="row">
        Start Date : <br />
        <input type="date" class="form-control" name="pph_startdate" value="<%=(data_pph.size()>0 && data_pph.get(0).get(0)!=null)?(Func.sqlToDate2(data_pph.get(0).get(0))):(Func.getTodayDate3()) %>" /> <br /><br />
        End Date : <br />
        <input type="date" class="form-control" name="pph_enddate" value="<%=(data_pph.size()>0 && data_pph.get(0).get(0)!=null)?(Func.sqlToDate2(data_pph.get(0).get(1))):(Func.getTodayDate3()) %>" />
    </div>-->
    <hr />
<!--    <div class="row">
        General competence : <br />
        SPM BM : <br />
        <select name="pph_spm_bm">
            <% for (int i = 0; i < data_qgb.size(); i++) { %>
            <option value="<%=data_qgb.get(i).get(1) %>" <% 
            String pph_spm_bm = (data_pph.size()>0 && data_pph.get(0).get(2)!=null)?(data_pph.get(0).get(2)):("0");
            if (pph_spm_bm.equals(data_qgb.get(i).get(1))) {
                out.print("selected");
            }
            %>><%=data_qgb.get(i).get(1) %></option>
            <% } %>
        </select> <br />
        SPM BI : <br />
        <select name="pph_spm_bi">
            <% for (int i = 0; i < data_qgb.size(); i++) { %>
            <option value="<%=data_qgb.get(i).get(1) %>" <% 
            String pph_spm_bi = (data_pph.size()>0 && data_pph.get(0).get(3)!=null)?(data_pph.get(0).get(3)):("0");
            if (pph_spm_bi.equals(data_qgb.get(i).get(1))) {
                out.print("selected");
            }
            %>><%=data_qgb.get(i).get(1) %></option>
            <% } %>
        </select> <br />
        CGPA : <br />
        <input type="text" name="pph_cgpa" value="<%=(data_pph.size()>0 && data_pph.get(0).get(4)!=null)?(data_pph.get(0).get(4)):("") %>" /> <br />
        MUET : <br />
        <input type="text" name="pph_muet" value="<%=(data_pph.size()>0 && data_pph.get(0).get(5)!=null)?(data_pph.get(0).get(5)):("") %>" /> <br />
    </div>
    <hr />-->
    <div class="row">
        Terms of Appointment : <br />
        <textarea name="pph_term_app" id="editor3" rows="10" cols="80"><%=(data_pph.size()>0 && data_pph.get(0).get(6)!=null)?(data_pph.get(0).get(6)):("") %></textarea>
        <script>
            // Replace the <textarea id="editor1"> with a CKEditor
            // instance, using default configuration.
            CKEDITOR.replace('editor3');
        </script>
    </div>
<!--    <hr />
    <div class="row">
        Salary Schedule : <br />
        <input type="text" class="form-control" id="pph_salary_min" name="pph_salary_min" 
               value="<%=(data_pph.size()>0 && data_pph.get(0).get(7)!=null)?(data_pph.get(0).get(7)):("") %>" placeholder="Minimum salary. Example: 1200.">
        <input type="text" class="form-control" id="pph_salary_max" name="pph_salary_max" 
               value="<%=(data_pph.size()>0 && data_pph.get(0).get(8)!=null)?(data_pph.get(0).get(8)):("") %>" placeholder="Maximum salary. Example: 5000.">
    </div>-->
    <hr />
    <div class="row">
        <input type="button" value="SAVE" id="btn_bpsm_save" />
        <input type="button" value="PREVIEW" id="btn_bpsm_preview" />
        <input type="button" value="REPORT" id="btn_bpsm_report" />
        <input type="button" value="PUBLISH" id="btn_bpsm_publish" />
    </div>
    
    <input type="hidden" name="pph_status" id="button_type" value="-" />
    <input type="hidden" name="pph_refid" value="<%=pph_refid %>" />
</form>
    
<script>
    $(document).ready(function() {
        $("#btn_bpsm_save").click(function() {
            $("#button_type").val("HR");
            $("#form_bpsm_eads1").submit();
        });
        $("#btn_bpsm_publish").click(function() {
//            $("#button_type").val("PUBLISH");
//            $("#form_bpsm_eads1").submit();
        });
    });
</script>