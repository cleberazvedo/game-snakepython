package Controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "cadastrarUsuario", urlPatterns = {"/cadastrarUsuario"})
public class cadastrarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String usuario = request.getParameter("usuario");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        int cont = 0;
        try {
            FileReader arq = new FileReader("usuariosCadastrados.txt");
            BufferedReader lerArq = new BufferedReader(arq);
            String linha = lerArq.readLine();
            while (linha != null) {
                cont++;
                linha = lerArq.readLine();
            }
            arq.close();
        } catch (IOException e) {
            System.err.printf("Erro na abertura do arquivo: %s.\n", e.getMessage());
            System.out.println();
        }
        if (cont == 0 || cont < 0) {
            if (usuario == null || email == null || senha == null || usuario.equals("") || email.equals("") || senha.equals("")) {
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                File arquivo = new File("usuariosCadastrados.txt");
                if (arquivo.exists() == false) {
                    arquivo.createNewFile();
                }
                OutputStreamWriter g = new OutputStreamWriter(new FileOutputStream("usuariosCadastrados.txt", true),
                        Charset.forName("UTF-8").newEncoder());
                BufferedWriter b = new BufferedWriter(g);
                b.write(usuario + ";" + email + ";" + senha);
                b.newLine();
                b.flush();
                b.close();
                request.getRequestDispatcher("indexCadastroSucesso.jsp").forward(request, response);
            }
        } else {
            int existe = 0;
            try {
                FileReader arq = new FileReader("usuariosCadastrados.txt");
                BufferedReader lerArq = new BufferedReader(arq);
                String linha = lerArq.readLine();
                while (linha != null) {
                    String split[] = linha.split(";");
                    if (split[0].equals(usuario) || split[1].equals(email)) {
                        existe++;
                        break;
                    }
                    linha = lerArq.readLine();
                }
                arq.close();
            } catch (IOException e) {
                System.err.printf("Erro na abertura do arquivo: %s.\n", e.getMessage());
                System.out.println();
            }
            if (existe == 1) {
                if (usuario == null || email == null || senha == null || usuario.equals("") || email.equals("") || senha.equals("")) {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
            } else {
                if (usuario == null || email == null || senha == null || usuario.equals("") || email.equals("") || senha.equals("")) {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    File arquivo = new File("usuariosCadastrados.txt");
                    if (arquivo.exists() == false) {
                        arquivo.createNewFile();
                    }
                    OutputStreamWriter g = new OutputStreamWriter(new FileOutputStream("usuariosCadastrados.txt", true),
                            Charset.forName("UTF-8").newEncoder());
                    BufferedWriter b = new BufferedWriter(g);
                    b.write(usuario + ";" + email + ";" + senha);
                    b.newLine();
                    b.flush();
                    b.close();
                    request.getRequestDispatcher("indexCadastroSucesso.jsp").forward(request, response);
                }
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
