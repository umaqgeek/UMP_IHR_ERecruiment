<%@page import="java.util.ArrayList"%>
<%@page import="models.DBConn"%>
<%@page import="oms.rmi.server.MainClient"%>
<%@page import="config.Config"%>
<% 
String pph_refid = session.getAttribute("pph_refid").toString();

String sql = "SELECT * "
        + "FROM position_ptj_hr pph, vacancy_pos_ptj vpp, vacancy_pos vp "
        + "WHERE pph.pph_refid = vpp.pph_refid "
        + "AND vpp.vp_refid = vp.vp_refid "
        + "AND pph.pph_status = 'PUBLISH' "
        + "AND pph.pph_refid = ? ";
String param[] = { pph_refid };
MainClient mc = new MainClient(DBConn.getHost());
ArrayList<ArrayList<String>> d = mc.getQuery(sql, param);
%>

<link type="text/css" rel="stylesheet" href="<%=Config.getBase_url(request) %>assets/css1/style.css">
<link href='http://fonts.googleapis.com/css?family=Rokkitt:400,700|Lato:400,300' rel='stylesheet' type='text/css'>

<button onclick="location.href='process.jsp?p=BPSM/E-Advertisement/e-advertisement_BPSM.jsp';"> Back </button>

<div id="cv" class="instaFade"></div>

<table>
    <tr>
        <td><img src="<%=Config.getBase_url(request) %>assets/img/ump-logo.png" /></td>
        <td><strong>BAHAGIAN PENGURUSAN SUMBER MANUSIA,<br />
        JABATAN PENDAFTAR,<br />
        UNIVERSITI MALAYSIA PAHANG,<br />
        26600 PEKAN,<br />
        PAHANG DARUL MAKMUR</strong>
        </td>
    </tr>
</table>

        <p><strong><u>JAWATAN PENTADBIRAN (KUMPULAN PENGURUSAN & PROFESIONAL)</u></strong></p>
        <p><strong>1. <%=d.get(0).get(2) %> GRED <%=d.get(0).get(1) %> (TETAP : 1)</strong></p>
        <p>Tangga Gaji	RM<%=d.get(0).get(15) %> (Minimum)  -  RM<%=d.get(0).get(16) %> (Maksimum)</p>
        <p>Kelayakan: </p>
        <p>(a)	Ijazah Sarjana Muda Kejuruteraan (Awam) yang diiktiraf oleh kerajaan daripada institusi pengajian tinggi tempatan atau kelayakan yang diiktiraf setaraf dengannya.
            (Gaji permulaan: RM2,360.00) </p>
        <p>dan 	(b)	lulus Bahasa Malaysia/Bahasa Melayu (termasuk lulus Ujian Lisan) pada peringkat Sijil Pelajaran Malaysia atau kelulusan yang diiktiraf setaraf dengannya oleh kerajaan. </p>
        <p>Penempatan Jawatan : Jabatan Pembangunan dan Pengurusan Harta, Kampus Gambang dan Kampus Pekan</p>
        <p><strong><u>Keutamaan kepada calon :</u></strong></p>
        <p>(a)	Mencapai sekurang-kurangnya CGPA 3.00 pada peringkat ijazah sarjana muda (tertakluk kepada budibicara Jawatankuasa Pemilih)
(b)	Memiliki Kepujian sekurang-kurangnya C6 dalam Bahasa Inggeris pada peringkat Sijil Pelajaran Malaysia
(c)	Mempunyai kemahiran dalam bidang:
a.	Pembangunan & Pemantauan Projek;
b.	Kontrak & Perolehan Kerajaan
c.	Pengubahsuaian, Penyelenggaraan & Perkhidmatan; dan Pentadbiran Am dan Perhubungan Korporat Universiti
(d)	Berpengalaman luas dalam pengurusan projek sekurang-kurangnya 3 tahun
(e)	Mempunyai kemahiran Interpersonal
(f)	Berkebolehan mengurus dan menyelia serta memerlukan penyeliaan yang minimum
        </p>
        <p><strong>PENETAPAN GAJI PERMULAAN</strong><br />	
Gaji permulaan yang lebih tinggi daripada gaji minimum boleh ditetapkan oleh Pihak Berkuasa Melantik UMP berasaskan pengalaman kerja atau kemahiran berkaitan.
        </p>
        <p>
            
        </p>

<script type="text/javascript">
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
    document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
    var pageTracker = _gat._getTracker("UA-3753241-1");
    pageTracker._initData();
    pageTracker._trackPageview();
</script>