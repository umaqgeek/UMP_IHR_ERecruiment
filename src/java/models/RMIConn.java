/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import helpers.J;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import oms.rmi.server.Message;

/**
 *
 * @author umarmukhtar
 */
public class RMIConn {
    
    private static Message impl;
    private static String localRMIFlag = "DBConn";
    
    public boolean startRMI(String host, int port) {
        
        DBConn.setHost(host);
        DBConn.setPort_rmi(port);
        boolean status = true;
        try {
            
            Registry myRegistry = LocateRegistry.getRegistry(DBConn.getHost(), DBConn.getPort_rmi());
            impl = (Message) myRegistry.lookup(localRMIFlag);
            
            System.out.println("RMI Connected.");
            System.out.println("Sending dummy message ...");
            impl.sendMessageUMP("DB Connect");
            System.out.println("Message Sent.");
            
            status = true;

        } catch (Exception e) {
            
            System.out.println("Error: "+"Network Error!\nPlease check with your administrator ..");
            System.out.println("Error: "+e.getMessage());
            status = startRMI(DBConn.getHost(), DBConn.getPort_rmi());
        }
        return status;
    }
    
    public Message getImpl() {
        return impl;
    }
}
