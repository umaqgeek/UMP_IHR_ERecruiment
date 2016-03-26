<%-- 
    Document   : e_pre_go_interview_room_uni
    Created on : Mar 25, 2016, 10:57:55 PM
    Author     : Habib
--%>

<%
String is_refid = request.getParameter("is_refid");
String ipl_refid = request.getParameter("ipl_refid");
String pph_refid = request.getParameter("pph_refid");
//out.print(ipl_refid);
//
//if(true)
//{
//    return;
//}
String[] irm_refid = request.getParameterValues("irm_refid");

String and_is_refid = "&is_refid="+is_refid;
String and_ipl_refid = "&ipl_refid="+ipl_refid;
String and_pph_refid = "&pph_refid="+pph_refid;
String and_irm_refid = "&selected_irm_refid";
String equals = "=";
String sCount = "";
String add_param = "";
String sSize = "&selected_size="+Integer.toString(irm_refid.length);
String link_to_interview_room = "../../../process.jsp?p=PTJ/E-Interview/e_pre_interview_room_uni.jsp"+and_is_refid+and_ipl_refid+and_pph_refid+sSize;
for(int a=0; a < irm_refid.length; a++)
{
    sCount = Integer.toString(a);
    add_param = and_irm_refid+sCount+equals+irm_refid[a];
    link_to_interview_room = link_to_interview_room+add_param;
//    out.print("link: "+link_to_interview_room+"<br>");
}
//if(true)
//{
//    return;
//}
response.sendRedirect(link_to_interview_room);
%>
