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
  
  String sql3 = "";
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
</div>