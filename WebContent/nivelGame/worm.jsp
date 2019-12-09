<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.loginUsuario"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Game Snake Python</title>

    <link rel="stylesheet" href="../css/styleGame.css">
    <link rel="stylesheet" href="../css/grid.css">
    <link rel="stylesheet" href="../css/modal.css">
    <script src="../js/scriptGameWorm.js"></script>
    <script src="../js/iniciarJogo.js"></script>
    <script src="../js/validacao.js"></script>
    <link rel="icon" type="image/png" sizes="16x16" href="../image/favicon.png">


</head>

<body class="telaLogin" onload="iniciarJogo(80); carregarMaiorPontos('maiorPontos')"style="background-image: url('../image/fundo2.png');">
   <%String usuario = (String) session.getAttribute("usuario");%>
   
    <div class="displayJogo">
    <form id="analiseRanking" name="analiseRanking" method="post" action="../analiseRanking">
        <div class="row abaSuperior">
            <div class="col-dm-3 col-dg-3 recordC">
                <span id="maiorPontos">0</span>
            </div>
            <div class="col-dm-3 col-dg-3 dificuldadeC" style="color:rgb(21, 94, 230);">
                <span id="dificuldade">WORM</span>
            </div>
            <div class="col-dm-3 col-dg-3 usuarioC">
                <span id="nomeUsuario"><%out.print(usuario.toUpperCase());%></span>
            </div>

            <div class="col-dm-3 col-dg-3 placarC">
                <span id="totalPontos">0</span>
            </div>
        </div>
        <div style="display: none;">
                <p><input type="text" name="jogador" id="jogador" value="<%out.print(usuario);%>"></p>
                <p><input type="text" name="pontos" id="totalPontosServlet" value="0"></p>
        </div>
        <div class="row labelTelaJogo">
            <div class="col-dm-3 col-dg-3">
                <label>BEST RECORD</label>
            </div>
            <div class="col-dm-3 col-dg-3">
                <label>DIFICULDADE</label>
            </div>
            <div class="col-dm-3 col-dg-3">
                <label>JOGADOR</label>
            </div>

            <div class="col-dm-3 col-dg-3">
                <label>PLACAR</label>

            </div>
        </div>
        <div class="row">
            <div class="col-dm-12 col-dg-12">
                <canvas id="canvas" width="800" height="400"></canvas>
            </div>
        </div>
        </form>

        <div class="row botaoJogo worm">
            <div class="col-dm-3 col-dg-3">
                <input type="button" value="PLAY" onclick="playGame(80)">
            </div>
            <div class="col-dm-3 col-dg-3">
                <input type="button" value="PAUSE" onclick="pauseGame()">
            </div>
            <div class="col-dm-3 col-dg-3">
                <input type="button" value="NOVO JOGO" onclick="window.location='worm.jsp';">
            </div>
            <div class="col-dm-3 col-dg-3">
                <input type="button" value="VOLTAR" onclick="window.location='../nivelDificuldade.jsp';">
            </div>
            <div class="col-dm-3 col-dg-3">  
            	<form id="formDeslogar" name="formDeslogar" method="post" action="../deslogar" style="border:none!important; background-color:none!important;color:'red'!important">	      
                	<input type="submit" value="DESLOGAR">
                </form>
            </div>

        </div>
    </div>
    <div id="modalSnakeMensagem" class="modal mensagem">
        <div class="modal-animate-top displayMensagem ">
            <header>
                <span onclick="document.getElementById('modalSnakeMensagem').style.display='none'" class="modal-button modal-display-topright">&times;</span>
            </header>
            <br>
            <br>
            <form>
                <div class="row">
                    <div class="col-dg-12 col-dm-12">
                        <span id="mensagemAlerta"></span>
                    </div>
                </div>
            </form>
        </div>
    </div>

</body>

</html>