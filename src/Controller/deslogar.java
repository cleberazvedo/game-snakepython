package Controller;

import Controller.loginUsuario;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.PrintWriter;

 
@WebServlet("/deslogar")
public class deslogar extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    public deslogar() {
        super();
    }
 
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
    	
        // Invalida sess�o e redireciona para login
    	HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("index.jsp");
    }
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
    }
 
}