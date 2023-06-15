package frm;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**S
 *
 * @author Zen Pro
 */
public class Konekcija {
    
    ResultSet rs = null;
    PreparedStatement pst = null;
 
    
    public static Connection KonBaza(){      
        
            
    try {
         Class.forName("com.mysql.jdbc.Driver");
         Connection con =  DriverManager.getConnection("jdbc:mysql://localhost/apoteka","root","");
       return con;
    } catch (Exception e) {
        JOptionPane.showMessageDialog(null, e);
          return null;
    }
   
     
    }
}    
    
