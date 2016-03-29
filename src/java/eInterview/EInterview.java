/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package eInterview;

import java.util.ArrayList;
import models.DBConn;
import oms.rmi.server.MainClient;

/**
 *
 * @author Habib
 */
public class EInterview
{
    MainClient mc = new MainClient(DBConn.getHost());
    
    public int get_to_setup_list()
    {
        String rejected = "REJECTED";
        String sql_interview_saved_list = "SELECT pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_ptj, iss.is_status "
                                    +"FROM interview_setup iss, interview_result_mark irm, pos_applied pa, position_ptj_hr pph "
                                    +"WHERE iss.is_refid = irm.is_refid "
                                    +"AND pa.pa_refid = irm.pa_refid "
                                    +"AND pph.pph_refid = pa.pph_refid "
                                    +"AND pph.pph_refid = ? "
                                    +"GROUP BY pph.pph_refid, pph.pph_grade, pph.pph_position, pph.pph_ptj, iss.is_status";
        String[] param_interview_saved_list = new String[1];
        ArrayList<ArrayList<String>> data_interview_saved_list;

        String pass_ptj = "PASS_PTJ";
        String sql_pos_list = "SELECT pph.pph_grade, pph.pph_position, pph.pph_ptj, pph.pph_refid "
                    + "FROM pos_applied pa, position_ptj_hr pph, candidate c, login1 l "
                    + "WHERE pa.pph_refid = pph.pph_refid "
                    + "AND pa.c_refid = c.c_refid "
                    + "AND l.c_refid = c.c_refid "
                    + "AND pa.pa_status = ? "
                    + "GROUP BY pph.pph_grade, pph.pph_position, pph.pph_ptj, pph.pph_refid ";
        String param_pos_list[] = { pass_ptj };
        ArrayList<ArrayList<String>> data_pos_list = mc.getQuery(sql_pos_list, param_pos_list);
        
        String sql_check_ptj_status = "SELECT f.f_ptj_status "
                                    + "FROM position_ptj_hr pph, pos_applied pa, filter f "
                                    + "WHERE pph.pph_refid = pa.pph_refid "
                                    + "AND pa.pa_refid = f.pa_refid "
                                    + "AND pph.pph_refid = ? "
                                    + "AND f.f_ptj_status IS NULL ";
        String[] param_check_ptj_status = new String[1];
        ArrayList<ArrayList<String>> data_check_ptj_status;

        String sql_count_pass = "SELECT COUNT(PA.PA_REFID) "
                            + "FROM POS_APPLIED PA, POSITION_PTJ_HR PPH "
                            + "WHERE PPH.PPH_REFID = PA.PPH_REFID "
                            + "AND PA.PA_STATUS = ? "
                            + "AND PA.PPH_REFID = ? ";
        String[] param_count_pass = new String[2];
        ArrayList<ArrayList<String>> data_count_pass;
        
        int num = 0;
        if(data_pos_list.size() > 0)
        {
            for(int row = 0; row < data_pos_list.size(); row++)
            {
                param_count_pass[0] = pass_ptj;
                param_count_pass[1] = data_pos_list.get(row).get(3);
                data_count_pass = mc.getQuery(sql_count_pass, param_count_pass);

                param_interview_saved_list[0] = data_pos_list.get(row).get(3);
                data_interview_saved_list = mc.getQuery(sql_interview_saved_list, param_interview_saved_list);
                
                param_check_ptj_status[0] = data_pos_list.get(row).get(3);
                            data_check_ptj_status = mc.getQuery(sql_check_ptj_status, param_check_ptj_status);
                            
                if(data_check_ptj_status.isEmpty())
                {
                    if(data_interview_saved_list.size() > 0)
                    {
                        if(data_interview_saved_list.get(0).get(4).equals(rejected))
                        {
                            num++;
                        }
                    }
                    else
                    {
                         num++;
                    }
                }
            }
        }
                                
        
        int counter = 0;
        return num;
    }
    
    public String getShortedName(String ptjName)
    {
        String cut_ptjName = ptjName;
        
        if(ptjName.length() > 40)
        {
            cut_ptjName = ptjName.substring(0, 40);
            cut_ptjName = cut_ptjName+"...";
        }
        return cut_ptjName;
    }
    
    public int getMemoList(String department_code)
    {
        String is_type_ptj = "PTJ";
        String accepted = "11";
        String rejected = "12";
        String informed = "1";
        String sql_memo_list = "SELECT iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type, iss.is_status, "
                        + "pph.pph_ptj, iis.iis_desc, irm.irm_ptj_status, pph.pph_refid, pph.pph_grade, pph.pph_position "
                        + "FROM interview_setup iss, interview_result_mark irm, department_main dm, pos_applied pa, position_ptj_hr pph, interview_invite_status iis "
                        + "WHERE iss.is_refid = irm.is_refid "
                        + "AND pa.pa_refid = irm.pa_refid "
                        + "AND pph.pph_refid = pa.pph_refid "
                        + "AND pph.pph_ptj = dm.dm_dept_desc "
                        + "AND iis.iis_code = irm_ptj_status "
                        + "AND iss.is_type = ? "
                        + "AND irm.irm_ptj_status != ? "
                        + "AND dm.dm_dept_code = ? "
                        + "GROUP BY iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type, iss.is_status, "
                        + "pph.pph_ptj, iis.iis_desc, irm.irm_ptj_status, pph.pph_refid, pph.pph_grade, pph.pph_position";
        String param_memo_list[] = { is_type_ptj, accepted, department_code };
        ArrayList<ArrayList<String>> data_memo_list = mc.getQuery(sql_memo_list, param_memo_list);
        
        int total_memo = data_memo_list.size();
        
        return total_memo;
    }
    
    public int getInvitationList(String l_refid)
    {
        String set = "2";
        String sent = "21";
        String accepted = "22";
        String rejected = "23";
        String canceled = "24";
        String published = "41";
        String result = "44";
        String sql_dept_code = "SELECT l.l_username, l.l_icno "
                        + "FROM login1 l "
                        + "WHERE l.l_refid = ? ";
        String param_dept_code[] = { l_refid };
        ArrayList<ArrayList<String>> data_dept_code = mc.getQuery(sql_dept_code, param_dept_code);

        String staff_id = data_dept_code.get(0).get(1);
        
        String sql_chairman_invitation  = "SELECT iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type, iss.is_status, icl.icl_status, iis.iis_desc, icl.icl_refid "
                                        + "FROM interview_setup iss, interview_chairman_list icl, staff_main sm, staff_main_archive052014 sma, interview_invite_status iis "
                                        + "WHERE iss.is_refid = icl.is_refid "
                                        + "AND iis.iis_code = icl.icl_status "
                                        + "AND sm.sm_staff_id = icl.sm_staff_id "
                                        + "AND sm.sm_staff_id = sma.sm_staff_id "
                                        + "AND sm.sm_staff_id = ? "
                                        + "AND icl.icl_status = ? ";
        String param_chairman_invitation[] = { staff_id, sent };
        ArrayList<ArrayList<String>> data_chairman_invitation = mc.getQuery(sql_chairman_invitation, param_chairman_invitation);
        
        String sql_panel_invitation = "SELECT iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type, iss.is_status, ipl.ipl_status, ipl.ipl_refid, sma.sm_staff_name, sm.sm_dept_code, sm.sm_job_code "
                                    + "FROM interview_panel_list ipl, interview_setup iss, interview_result_mark irm, interview_irm_icm iii, staff_main sm, staff_main_archive052014 sma "
                                    + "WHERE iss.is_refid = irm.is_refid "
                                    + "AND irm.irm_refid = iii.irm_refid "
                                    + "AND ipl.ipl_refid = iii.ipl_refid "
                                    + "AND sm.sm_staff_id = ipl.sm_staff_id "
                                    + "AND sma.sm_staff_id = sm.sm_staff_id "
                                    + "AND sm.sm_staff_id = ? "
                                    + "AND ipl.ipl_status = ? "
                                    + "GROUP BY iss.is_refid, iss.is_date, iss.is_starttime, iss.is_endtime, iss.is_venue, iss.is_type, iss.is_status, ipl.ipl_status, ipl.ipl_refid, sma.sm_staff_name, sm.sm_dept_code, sm.sm_job_code";
        String param_panel_invitation[] = { staff_id, sent };
        ArrayList<ArrayList<String>> data_panel_invitation = mc.getQuery(sql_panel_invitation, param_panel_invitation);
        
        int total_invite = data_chairman_invitation.size() + data_panel_invitation.size();
        
        return total_invite;
    }
}
