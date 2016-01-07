<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%
  String sql = "SELECT w.w_grade, w.w_position, w.w_ptj, w.w_total, w.w_refid "
          + "FROM warrant w "
          + "WHERE w.w_status = 1 ";
  String params[] = {};
  
  MainClient mc = new MainClient(DBConn.getHost());
  ArrayList<ArrayList<String>> data = mc.getQuery(sql, params);
  
  String graphData = "";
  for (int i = 0; i < data.size()-1; i++) {
      graphData += "{ name: \""+data.get(i).get(1)+"\", y: "+data.get(i).get(3)+" },";
  }
  if (data.size() > 0) {
      int s = data.size();
      graphData += "{ name: \""+data.get(s-1).get(1)+"\", y: "+data.get(s-1).get(3)+" }";
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
							 text: 'Warrant Statistic By Status'
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