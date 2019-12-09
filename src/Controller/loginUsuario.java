package Controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "loginUsuario", urlPatterns = { "/loginUsuario" })
public class loginUsuario extends HttpServlet {

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String jogador = request.getParameter("jogador");
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
			if (jogador.equals("") == true || jogador == null || senha.equals("") == true || senha == null) {
				request.getRequestDispatcher("index.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		} else {
			int existe = 0;
			String usuario = "";
			try {
				FileReader arq = new FileReader("usuariosCadastrados.txt");
				BufferedReader lerArq = new BufferedReader(arq);
				String linha = lerArq.readLine();
				while (linha != null) {
					String split[] = linha.split(";");
					if ((split[0].equals(jogador) || split[1].equals(jogador)) && split[2].equals(senha)) {
						existe++;
						usuario = split[0];
						break;
					}
					linha = lerArq.readLine();
				}
				arq.close();
			} catch (IOException e) {
				System.err.printf("Erro na abertura do arquivo: %s.\n", e.getMessage());
				System.out.println();
			}
			if (existe == 0) {
				if (jogador.equals("") == true || jogador == null || senha.equals("") == true || senha == null) {
					request.getRequestDispatcher("index.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
			} else {
				// aqui estou criando uma sessão
				HttpSession session = request.getSession(true);

				// aqui passo qualquer nome para recuperar esse nome para ver se ele estar
				// logado ou nao
				session.setAttribute("logado", true);
				session.setAttribute("usuario", usuario);
				response.sendRedirect("indexLoginSucesso.jsp");
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
