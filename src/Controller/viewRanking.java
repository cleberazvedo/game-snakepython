package Controller;

import java.io.IOException;
import java.util.*;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "viewRanking", urlPatterns = {"/viewRanking"})
public class viewRanking extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String linhas = "";
        try {
            FileReader arq = new FileReader("rankingJogadores.txt");
            BufferedReader lerArq = new BufferedReader(arq);
            String linha = lerArq.readLine();
            while (linha != null) {
                linhas += linha + "-";
                linha = lerArq.readLine();
            }
            arq.close();
        } catch (IOException e) {
            System.err.printf("Erro na abertura do arquivo: %s.\n", e.getMessage());
            System.out.println();
        }
        
        String vetLinhas[] = linhas.split("-");

        String jogador = "";
        String pontos = "";

        for (int i = 0; i < vetLinhas.length; i++) {
            String split[] = vetLinhas[i].split(";");
            if (i + 1 != vetLinhas.length) {
                jogador += split[0] + " - ";
                pontos += split[1] + " - ";
            } else {
                jogador += split[0];
                pontos += split[1];
            }
        }

        String vetPont[] = pontos.split(" - ");

        Stack<Integer> STACK = new Stack();
        for (int i = 0; i < vetPont.length; i++) {
            STACK.push(Integer.parseInt((vetPont[i])));
        }

        int[] vetPontos = STACK.stream().mapToInt(x -> x).toArray();
        String vetJogador[] = jogador.split(" - ");

        int i, j;
        for (i = 0; i < vetPontos.length; i++) {
            j = i;
            while (j > 0 && (vetPontos[j] > vetPontos[j - 1]
                    || vetPontos[j] == vetPontos[j - 1])) {
                int temp = vetPontos[j];
                vetPontos[j] = vetPontos[j - 1];
                vetPontos[j - 1] = temp;
                String sTemp = vetJogador[j];
                vetJogador[j] = vetJogador[j - 1];
                vetJogador[j - 1] = sTemp;
                j--;
            }
        }
        String users = "";
        String pontosUsers = "";

        for (i = 0; i < vetPontos.length; i++) {
            if (i + 1 != vetPontos.length) {
                users += vetJogador[i] + " - ";
                pontosUsers += vetPontos[i] + " - ";
            } else {
                users += vetJogador[i];
                pontosUsers += vetPontos[i];
            }
        }

        request.setAttribute("vetJogador", users);
        request.setAttribute("vetPontos", pontosUsers);
        request.getRequestDispatcher("ranking.jsp").forward(request, response);
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
