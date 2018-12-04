/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package java.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.C3P0Util;

public class DaoUtil {

    
    
    public static String queryUserByName(String username) throws SQLException, Exception {
        // TODO Auto-generated method stub
        Connection  conn = C3P0Util.getConnection();
        Statement st= conn.createStatement();
        ResultSet rs = st.executeQuery("select * from demo where username="+username+"");
        PreparedStatement ps = conn.prepareStatement("select * from user where username=?");
        ps.setString(1, username);
        ResultSet rs1 = ps.executeQuery();

        if (rs1.next()) {
            return "c";
        } else {
            return "success";
        }
        
        
//       if(!rs == null){
//           
//       }
    }
    
}
