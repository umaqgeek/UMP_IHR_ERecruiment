package eRegister;

public class StaffActivation
{
    public int findMaxStaffId(int[ ] staff_id)
    {
      int currentMaxId = 0;
      
      for(int a = 0; a < staff_id.length; a++)
      {
          if(staff_id[a] > currentMaxId)
          {
              currentMaxId = staff_id[a];
          }
      }
      return currentMaxId;
    }
}
