
package commonutility;
import com.puja.customer.utils.Constants;
import java.sql.*;
public class CommonUtility 
{
    public static Connection getCon()
    {
        Connection con=null;
        try
        {
                String mydb="jdbc:mysql://localhost:"+Constants.DB_Port+"/"+Constants.DB_Name;
                Class.forName("com.mysql.cj.jdbc.Driver");
                con=DriverManager.getConnection(mydb,Constants.DB_User,Constants.DB_Password);
        }
        catch(Exception ex)
        {
            System.out.println(ex.toString());
        }
        return con;
    }
}
