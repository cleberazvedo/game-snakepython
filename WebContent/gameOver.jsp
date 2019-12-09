<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.loginUsuario"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Game Snake Python</title>

    <link rel="stylesheet" href="css/styleGame.css">
    <link rel="stylesheet" href="css/grid.css">
    <link rel="stylesheet" href="css/modal.css">
    <link rel="stylesheet" href="css/keyframes.css">
    <script src="js/scriptGame.js"></script>
    <script src="js/iniciarJogo.js"></script>
    <script src="js/validacao.js"></script>
    <link rel="icon" type="image/png" sizes="16x16" href="image/favicon.png">


</head>

<body class="telaLogin" onload="iniciarJogo(160); carregarMaiorPontos('maiorPontos')"style="background-image: url('image/fundo4.png');">
   <%String usuario = (String) session.getAttribute("usuario");%>
    <div id="modalSnakeMensagem" class="modalAparece mensagem">
        <div class="modal-animate-top displayMensagem mensagemGameOver ">
            <header>
                <span onclick="fecharJanelaGameOver()" class="modal-button modal-display-topright">&times;</span>
            </header>
            <br>
            <br>
            <form>
                <div class="row">
                    <div class="col-dg-12 col-dm-12">
                        <span id="mensagemAlerta" style="font-size:50px; animation: 0.2s 0.2s fontPiscando linear infinite;">GAME OVER</span>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <div class="displayJogo">
        <div class="row abaSuperior">
            <div class="col-dm-3 col-dg-3 recordC">
                <span id="maiorPontos"></span>
            </div>
            <div class="col-dm-3 col-dg-3 dificuldadeC" style="color:gainsboro;">
                <span id="dificuldade"></span>
            </div>
            <div class="col-dm-3 col-dg-3 usuarioC">
                <span id="nomeUsuario"></span>
            </div>

            <div class="col-dm-3 col-dg-3 placarC">
                <span id="totalPontos"></span>
            </div>
        </div>
        <div class="row labelTelaJogo" style="align-text:'center'">
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

    </div>
    
</body>

</html>