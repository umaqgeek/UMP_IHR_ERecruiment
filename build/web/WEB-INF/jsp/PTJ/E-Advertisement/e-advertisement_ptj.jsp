<div class="row">

    <div class="row">




        <div id="container" style="min-width: 310px; min-height: 260px; max-height: 500px; max-width: 600px; margin: 0 auto"></div>

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
                            name: "Brands",
                            colorByPoint: true,
                            data: [{
                                    name: "Pegawai Teknologi Maklumat",
                                    y: 33.33
                                }, {
                                    name: "Pegawai Jurutera",
                                    y: 33.03,
                                    sliced: true,
                                    selected: true
                                }, {
                                    name: "Pegawai Penyelidik",
                                    y: 33.33
                                }]
                        }]
                });
            });
        </script>	

    </div>

    <div class="well">	

        <div class="row">

            <table class="table table-condensed" style="border-collapse:collapse;">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Gred</th>
                        <th>Postiton </th>
                        <th>Total</th>
                        <th>Setup</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>FT41</td>
                        <td>Pegawai Teknologi Maklumat</td>
                        <td><span class="badge">3</span></td>
                        <td><a href="e-advertisement_ptj_setup.html" class="btn btn-info btn-sm" role="button"><i class="fa fa-file-text-o"></i></a></td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td>J41</td>
                        <td>Pegawai Jurutera</td>
                        <td><span class="badge">3</span></td>
                        <td><a href="#" class="btn btn-info btn-sm" role="button"><i class="fa fa-file-text-o"></i></a></td>
                    </tr>							
                    <tr>
                        <td>3</td>
                        <td>Q41</td>
                        <td>Pegawai Penyelidik</td>
                        <td><span class="badge">3</span></td>
                        <td><a href="#" class="btn btn-info btn-sm" role="button"><i class="fa fa-file-text-o"></i></a></td>
                    </tr>
                </tbody>
            </table>

            <!-- Modal 
            <div id="myModal" class="modal fade" role="dialog">
              <div class="modal-dialog">

            <!-- Modal content
            <div class="modal-content">
              
              <div class="modal-body">
                    <table class="table table-condensed" style="border-collapse:collapse;">
                            <thead>
                                    <tr>
                                            <th>#</th>
                                            <th>Gred</th>
                                            <th>Position</th>
                                            <th>Level Posts</th>
                                            <th>Total</th>
                                            <th>Setup</th>
                                    </tr>
                            </thead>
                            <tbody>
                                    <tr>
                                            <td>1</td>
                                            <td>FT41</td>
                                            <td>Pegawai Teknologi Maklumat</td>
                                            <td>Permanent</td>
                                            <td><span class="badge">2</span></td>
                                            <td><a href="e-Advertisement_ptj_setup_sample1.html" class="btn btn-info btn-sm" role="button"><i class="fa fa-file-text-o"></i></a></td>
                                    </tr>
                                    <tr>
                                            <td>2</td>
                                            <td>FT41</td>
                                            <td>Pegawai Teknologi Maklumat</td>
                                            <td>Contract</td>
                                            <td><span class="badge">1</span></td>
                                            <td><a href="e-Advertisement_ptj_setup_sample2.html" class="btn btn-info btn-sm" role="button"><i class="fa fa-file-text-o"></i></a></td>
                                    </tr>							
                                    
                            </tbody>
                    </table>
              </div>
              <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>

      </div>-->
        </div>


    </div>
</div>