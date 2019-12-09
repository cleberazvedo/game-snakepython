<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.loginUsuario"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Game Snake Python</title>

    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/styleGame.css">
    <link rel="stylesheet" href="../css/grid.css">
    <link rel="stylesheet" href="../css/modal.css">
    <script src="../js/scriptGameSlug.js"></script>
    <script src="../js/iniciarJogo.js"></script>
    <script src="../js/validacao.js"></script>
    <link rel="icon" type="image/png" sizes="16x16" href="../image/favicon.png">


</head>

<body onload="iniciarJogo(160); carregarMaiorPontos('maiorPontos')" style="background-image: url('../image/fundo1.png');">
    <%String usuario = (String) session.getAttribute("usuario");%>
    
    

    <div class="displayJogo">
    	<form id="analiseRanking" name="analiseRanking" method="post" action="../analiseRanking">
	        <div class="row abaSuperior">
	            <div class="col-dm-3 col-dg-3 recordC">
	                <span id="maiorPontos">0</span>
	            </div>
	            <div class="col-dm-3 col-dg-3 dificuldadeC" style="color: chartreuse;">
	                <span id="dificuldade">SLUG</span>
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
	                <label >DIFICULDADE</label>
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
	                <canvas id="canvas" width="800" height="400" style="border: 12px inset #00000050;"></canvas>
	            </div>
	       
	            
	        </div>
        </form>

        <div class="row botaoJogo slug">
        
            <div class="col-dm-3 col-dg-3">
                <input type="button" value="PLAY" onclick="playGame(160)">
            </div>
            <div class="col-dm-3 col-dg-3">
                <input type="button" value="PAUSE" onclick="pauseGame()">
            </div>
            <div class="col-dm-3 col-dg-3">
                <input type="button" value="NOVO JOGO" onclick="window.location='slug.jsp';">
            </div>
            <div class="col-dm-3 col-dg-3">
                <input type="button" value="VOLTAR" onclick="window.location='../nivelDificuldade.jsp';">
            </div>
            <div class="col-dm-3 col-dg-3">  
            	<form id="formDeslogar" name="formDeslogar" method="post" action="../deslogar">	      
                	<input type="submit" value="DESLOGAR" style="border:none!important; background-color:none!important;color:'red'!important">
                </form>
            </div>
            
        </div>
    </div>


</body>

</html>