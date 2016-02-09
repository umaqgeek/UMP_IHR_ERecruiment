<%-- 
    Document   : e_int_go_interview_room
    Created on : Feb 6, 2016, 8:36:29 PM
    Author     : Habib
--%>

<%
//String[] selected_pos = request.getParameterValues("selected_pos");
//String and = "&selected_pos";
//String equals = "=";
//String sCount = "";
//String add_param = "";
//String sSize = "&selected_size="+Integer.toString(selected_pos.length);
String link_to_interview_room = "../../../process.jsp?p=BPSM/E-Interview/e_int_interview_room.jsp";//+sSize;
//for(int a=0; a < selected_pos.length; a++)
//{
//    sCount = Integer.toString(a);
//    add_param = and+sCount+equals+selected_pos[a];
//    link_to_setup = link_to_setup+add_param;
//    //out.print("link: "+link_to_setup+"<br>");
//}
//if(true)
//{
//    //return;
//}
response.sendRedirect(link_to_interview_room);
%>
