/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import daoImpl.ClienteDAOImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Cliente;

/**
 *
 * @author ENRIKE
 */
public class ClienteSevlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    ClienteDAOImpl clienteDAO = new ClienteDAOImpl();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String accion = request.getParameter("accion");

        if (accion.equalsIgnoreCase("Enviar")) {
            AgregarCliente(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void AgregarCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String nombres = request.getParameter("firstname");
            String apellidos = request.getParameter("lastname");
            String direccion = request.getParameter("street");
            String ciudad = request.getParameter("city");
            String pais = request.getParameter("state");
            int cpostal = Integer.parseInt(request.getParameter("zipcode"));
            int telefono = Integer.parseInt(request.getParameter("phone"));
            String tcredito = request.getParameter("creditcard");
            String fecha = request.getParameter("expires" + "/" + "expires2");

            Cliente cliente = new Cliente();

            cliente.setNombres(nombres);
            cliente.setApellidos(apellidos);
            cliente.setDireccion(direccion);
            cliente.setCiudad(ciudad);
            cliente.setPais(pais);
            cliente.setCpostal(cpostal);
            cliente.setTelefono(telefono);
            cliente.setTcredito(tcredito);
            cliente.setFecha(fecha);
            
            String mensaje = clienteDAO.agregar(cliente);
            
            if (mensaje.equals("Agregado")) {
                request.setAttribute("mensaje", mensaje);
            }else{
                request.setAttribute("Error", mensaje);
            }
            
            request.getRequestDispatcher("process.jsp").forward(request, response);
            
        } catch (Exception e) {
            request.setAttribute("Error", e);
            request.getRequestDispatcher("process.jsp").forward(request, response);
        }

    }

}
