package eRecruitment.eTest.ePersonalityTest.servlet;

import java.io.*;

//User Defined
import views.MainClient;
import Connection.*;

/**
 * @web.servlet name = "getPersonalityTestInfo"
 * @web.servlet-mapping url-pattern = "/getPersonalityTestInfo"
 */
public class GetPersonalityTestInfo extends GenericServlet{
	public void service(ServletRequest req, ServletResponse res) throws IOException, ServletException{
		try{
			MainClient mc = new MainClient("175.141.")
		}
		res.setContentType("text/html");
		PrintWriter out = new PrintWriter();
		out.print("<html><body>");
	}
}