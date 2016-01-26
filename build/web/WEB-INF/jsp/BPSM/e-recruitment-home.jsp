<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
  String sql = "SELECT COUNT(*) "
          + "FROM position_ptj_hr pph "
          + "WHERE pph.pph_status = 'HR' ";
  String params[] = {};
  MainClient mc = new MainClient(DBConn.getHost());
  ArrayList<ArrayList<String>> data = mc.getQuery(sql, params);
  
  String sql2 = "SELECT COUNT(*) "
          + "FROM position_ptj_hr pph "
          + "WHERE pph.pph_status = 'PUBLISH' ";
  String params2[] = {};
  MainClient mc2 = new MainClient(DBConn.getHost());
  ArrayList<ArrayList<String>> data2 = mc2.getQuery(sql2, params2);
  
  String graphData = "";
  graphData += "{ name: \"Not Published\", y: "+data.get(0).get(0)+" },";
  graphData += "{ name: \"Published\", y: "+data2.get(0).get(0)+" }";
  
  String sql3 = "SELECT * "
          + "FROM position_ptj_hr pph ";
  String param3[] = {};
  MainClient mc3 = new MainClient(DBConn.getHost());
  ArrayList<ArrayList<String>> d3 = mc3.getQuery(sql3, param3);
//  out.print(d3);
  String graphData2 = "";
  for (int i = 0; i < d3.size(); i++) {
      String grade = d3.get(i).get(1);
      String position = d3.get(i).get(2);
      String pph_refid = d3.get(i).get(0);
      
      String sql31 = "SELECT * "
              + "FROM pos_applied pa, position_ptj_hr pph "
              + "WHERE pa.pph_refid = pph.pph_refid "
              + "AND pph.pph_refid = ? ";
      String param31[] = { pph_refid };
      MainClient mc31 = new MainClient(DBConn.getHost());
      ArrayList<ArrayList<String>> d31 = mc31.getQuery(sql31, param31);
      
      graphData2 += "{ name: \""+position+" (Grade "+grade+")\", y: "+d31.size()+" },";
  }
%>
<div class="row">
<div id="container" style="min-width:100%; height: 400px; max-width:100%; margin: 0 auto">
        <script>
            $(function () {
				var chart;
				$(document).ready(function() {
					chart = new Highcharts.Chart({
						chart: {
							renderTo: 'container',
							plotBackgroundColor: null,
							plotBorderWidth: null,
							plotShadow: false,
							type: 'pie'
						},
						title: {
							 text: 'Position Statistic By Status'
						},
						tooltip: {
							pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>',
							percentageDecimals: 1
						},
						plotOptions: {
							pie: {
										allowPointSelect: true,
										cursor: 'pointer',
										dataLabels: {
											enabled: true,
											format: '<b>{point.name}</b>: {point.percentage:.1f} %',
											style: {
												color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
											}
										}
									}
						},
						 series: [{
										name: "Total",
										colorByPoint: true,
										data: [<%=graphData %>]
									}]
					});
				});
				
			});
        </script>	
</div>	
<div id="container2" style="min-width:100%; height: 400px; max-width:100%; margin: 0 auto">
        <script>
            $(function () {
				var chart;
				$(document).ready(function() {
					chart = new Highcharts.Chart({
						chart: {
							renderTo: 'container2',
							plotBackgroundColor: null,
							plotBorderWidth: null,
							plotShadow: false,
							type: 'pie'
						},
						title: {
							 text: 'Application Statistic By Position'
						},
						tooltip: {
							pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>',
							percentageDecimals: 1
						},
						plotOptions: {
							pie: {
										allowPointSelect: true,
										cursor: 'pointer',
										dataLabels: {
											enabled: true,
											format: '<b>{point.name}</b>: {point.percentage:.1f} %',
											style: {
												color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
											}
										}
									}
						},
						 series: [{
										name: "Total",
										colorByPoint: true,
										data: [<%=graphData2 %>]
									}]
					});
				});
				
			});
        </script>	
</div>	
</div>