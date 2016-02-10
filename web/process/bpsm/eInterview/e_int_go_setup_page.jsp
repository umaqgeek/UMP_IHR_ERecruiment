<%-- 
    Document   : e_int_go_setup_page
    Created on : Jan 30, 2016, 11:28:42 AM
    Author     : Habib
--%>
<%
String[] selected_pos = request.getParameterValues("selected_pos");
String and = "&selected_pos";
String equals = "=";
String sCount = "";
String add_param = "";
String alert = "&alert=0";
String sSize = "&selected_size="+Integer.toString(selected_pos.length);
String link_to_setup = "../../../process.jsp?p=BPSM/E-Interview/e_int_pos_setup.jsp"+alert+sSize;
for(int a=0; a < selected_pos.length; a++)
{
    sCount = Integer.toString(a);
    add_param = and+sCount+equals+selected_pos[a];
    link_to_setup = link_to_setup+add_param;
//    out.print("link: "+link_to_setup+"<br>");
}
//if(true)
//{
//    return;
//}
response.sendRedirect(link_to_setup);
%>