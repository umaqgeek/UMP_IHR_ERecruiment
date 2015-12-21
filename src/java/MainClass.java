package test.main;

import java.util.ArrayList;
import views.MainClient;

public class MainClass{
	public static void main(String[] args){
		MainClient mc = new MainClient("175.141.171.197");
		
		String sql = "INSERT INTO test_conn(tc_desc) VALUES(?)";
		String idata[] = new String[1];
		idata[0] = "data VJ";
		boolean status = mc.setQuery(sql, idata);
		System.out.println("Query Status: " + status);
		
		String query = "SELECT tc.test_desc FROM test_conn tc";
		String rdata[] = {};
		
		ArrayList<ArrayList<String>> output = mc.getQuery(query, rdata);
		System.out.println("PRINT DATA :" + output);
	}
}