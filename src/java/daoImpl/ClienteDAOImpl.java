/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daoImpl;

import clases.TitlesBean;
import dao.ClienteDAO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import modelo.Cliente;
import modelo.Conexion;

/**
 *
 * @author ENRIKE
 */
public class ClienteDAOImpl implements ClienteDAO{
    
    Connection cn = Conexion.getConexion();
            
    @Override
    public String agregar(Cliente cliente) {
        String mensaje = "";
        try {
            String sql = "insert into cliente values(null, ?,?,?,?,?,?,?,?,?);";
            PreparedStatement pstm = cn.prepareStatement(sql);
            pstm.setString(1, cliente.getNombres());
            pstm.setString(2, cliente.getApellidos());
            pstm.setString(3, cliente.getDireccion());
            pstm.setString(4, cliente.getCiudad());
            pstm.setString(5, cliente.getPais());
            pstm.setInt(6, cliente.getCpostal());
            pstm.setInt(7, cliente.getTelefono());
            pstm.setString(8, cliente.getTcredito());
            pstm.setString(9, cliente.getFecha());
            
            pstm.executeUpdate();
            mensaje = "Agregado";
        } catch (Exception e) {
            mensaje = e.toString();
        }
        return mensaje;
    }
    
}
