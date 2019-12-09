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

@WebServlet(name = "analiseRanking", urlPatterns = {"/analiseRanking"})
public class analiseRanking extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String jogador = request.getParameter("jogador");
        String pontos = request.getParameter("pontos");
        if (jogador == null || jogador.equals("null") || jogador.equals("")) {
            request.getRequestDispatcher("gameOver.jsp").forward(request, response);
        } else {
            int cont = 0;
            try {
                FileReader arq = new FileReader("rankingJogadores.txt");
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

            if (cont == 0) {
                File arquivo = new File("rankingJogadores.txt");
                if (arquivo.exists() == false) {
                    arquivo.createNewFile();
                }
                OutputStreamWriter g = new OutputStreamWriter(new FileOutputStream("rankingJogadores.txt", true),
                        Charset.forName("UTF-8").newEncoder());
                BufferedWriter b = new BufferedWriter(g);
                b.write(jogador + ";" + pontos);
                b.newLine();
                b.flush();
                b.close();
                request.getRequestDispatcher("gameOver.jsp").forward(request, response);
            } else {
                int jogadorIqual = 0;
                String linhas = "";
                try {
                    FileReader arq = new FileReader("rankingJogadores.txt");
                    BufferedReader lerArq = new BufferedReader(arq);
                    String linha = lerArq.readLine();
                    while (linha != null) {
                        linhas += linha + "-";
                        String splitLinha[] = linha.split(";");
                        if (splitLinha[0].equals(jogador)) {
                            jogadorIqual++;
                        }
                        linha = lerArq.readLine();
                    }
                    arq.close();
                } catch (IOException e) {
                    System.err.printf("Erro na abertura do arquivo: %s.\n", e.getMessage());
                    System.out.println();
                }
                if (jogadorIqual == 0) {
                    File arquivo = new File("rankingJogadores.txt");
                    if (arquivo.exists() == false) {
                        arquivo.createNewFile();
                    }
                    OutputStreamWriter g = new OutputStreamWriter(new FileOutputStream("rankingJogadores.txt", true),
                            Charset.forName("UTF-8").newEncoder());
                    BufferedWriter b = new BufferedWriter(g);
                    b.write(jogador + ";" + pontos);
                    b.newLine();
                    b.flush();
                    b.close();
                    request.getRequestDispatcher("gameOver.jsp").forward(request, response);
                } else {
                    boolean maior = false;
                    String vetLinhas[] = linhas.split("-");
                    for (int i = 0; i < vetLinhas.length; i++) {
                        String vetPartLinhas[] = vetLinhas[i].split(";");
                        if (vetPartLinhas[0].equals(jogador)) {
                            if (Integer.parseInt(vetPartLinhas[1]) < Integer.parseInt(pontos)) {
                                maior = true;
                            }
                        }
                    }
                    if (maior == true) {
                        String splitLinha[] = linhas.split("-");
                        File arquivo = new File("rankingJogadores.txt");
                        if (arquivo.exists() == false) {
                            arquivo.createNewFile();
                        }
                        OutputStreamWriter g = new OutputStreamWriter(new FileOutputStream("rankingJogadores.txt", false),
                                Charset.forName("UTF-8").newEncoder());
                        BufferedWriter b = new BufferedWriter(g);
                        for (int i = 0; i < splitLinha.length; i++) {
                            String splitLinhasDois[] = splitLinha[i].split(";");
                            if (splitLinhasDois[0].equals(jogador)) {
                                b.write(jogador + ";" + pontos);
                                b.newLine();
                            } else {
                                b.write(splitLinha[i]);
                                b.newLine();
                            }
                        }
                        b.flush();
                        b.close();
                        request.getRequestDispatcher("gameOver.jsp").forward(request, response);
                    } else {
                        request.getRequestDispatcher("gameOver.jsp").forward(request, response);
                    }
                }
            }
        }
        request.getRequestDispatcher("gameOver.jsp").forward(request, response);
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
