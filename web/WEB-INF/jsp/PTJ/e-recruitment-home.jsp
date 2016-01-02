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
      graphData += "{ name: \""+data.get(s-1).get(1)+"\", y: "+data.get(s-1).get(3)+" },";
  }
%>
<div class="row">
    <table><tr><td align="center"><div id="container" style="margin: 0 auto"></div></td></tr></table>
        <script>
            $(function () {
                $('#container').highcharts({
                    chart: {
                        plotBackgroundColor: null,
                        plotBorderWidth: null,
                        plotShadow: false,
                        type: 'pie'
                    },
                    title: {
                        text: 'Warrant Statistic By Status'
                    },
                    tooltip: {
                        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
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
                    credits: {
                        enabled: false
                    },
                    series: [{
                            name: "Total",
                            colorByPoint: true,
                            data: [<%=graphData %>]
                        }]
                });
            });
        </script>	

</div>