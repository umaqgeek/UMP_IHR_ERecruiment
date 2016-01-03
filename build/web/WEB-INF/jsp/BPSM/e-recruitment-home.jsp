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
                        text: 'Position Statistic By Status'
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