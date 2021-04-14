package com.Vlxdy.controlador;

import com.Vlxdy.modelo.GestorVacunas;
import com.Vlxdy.modelo.Datos_Vacunas;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Vlxdy Hishikawa
 */
@WebServlet(name = "Controlador_Vacunas", urlPatterns = {"/Controlador_Vacunas"})
public class Controlador_Vacunas extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Datos_Vacunas objVacunas = new Datos_Vacunas();
        int id;
        int pos;
        String op = request.getParameter("op");
        
        if (op.equals("nuevo")){
            HttpSession ses = request.getSession();   
            GestorVacunas misDatos = (GestorVacunas) ses.getAttribute("misDatos");
            objVacunas.setId(misDatos.obtieneId());
            request.setAttribute("op", op);
            request.setAttribute("ListVacunados",objVacunas);
            request.getRequestDispatcher("Editar.jsp").forward(request, response);
        }
        if (op.equals("modificar")){
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession ses = request.getSession();   
            GestorVacunas misDatos = (GestorVacunas) ses.getAttribute("misDatos");
            pos = misDatos.ubicarVacunas(id);
            objVacunas = misDatos.getLista().get(pos);
            
            request.setAttribute("op", op);
            request.setAttribute("ListVacunados",objVacunas);
            request.getRequestDispatcher("Editar.jsp").forward(request, response);
        }
        if (op.equals("eliminar")){
            id = Integer.parseInt(request.getParameter("id"));
            HttpSession ses = request.getSession();   
            GestorVacunas misDatos = (GestorVacunas) ses.getAttribute("misDatos");
            pos = misDatos.ubicarVacunas(id);
            misDatos.eliminarVacunas(pos);
            ses.setAttribute("misDatos", misDatos);
            response.sendRedirect("Vacunas_VHuanca.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        Datos_Vacunas objVacunas=new Datos_Vacunas();
        int pos;
        String op=request.getParameter("op");
        if (op.equals("grabar")){
            objVacunas.setId(Integer.parseInt(request.getParameter("id")));
            objVacunas.setNombre(request.getParameter("nombre"));
            objVacunas.setPeso(Double.parseDouble(request.getParameter("peso")));
            objVacunas.setTalla(Double.parseDouble(request.getParameter("talla")));
            objVacunas.setVacuna(request.getParameter("vacuna"));
            
            HttpSession ses = request.getSession();   
            GestorVacunas misDatos = (GestorVacunas) ses.getAttribute("misDatos");
            
            String opg = request.getParameter("opg");
            if (opg.equals("nuevo")){
                misDatos.insertarVacunas(objVacunas);  
            }
            else{
                pos = misDatos.ubicarVacunas(objVacunas.getId());
                misDatos.modificarVacunas(pos, objVacunas);
            }
            ses.setAttribute("misDatos", misDatos);
            response.sendRedirect("Vacunas_VHuanca.jsp");
        }
    }
}    