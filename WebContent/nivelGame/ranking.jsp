<%@page import="java.util.List"%>
<%@page contentType="text/html charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<title>GAME SNAKE PYTHON</title>
<link rel="stylesheet" type="text/css" href="css/grid.css">
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/keyframes.css">
<link rel="stylesheet" type="text/css" href="css/modal.css">

<script src="js/funcao.js"></script>
<script src="js/cadastro.js"></script>
<script src="js/validacao.js"></script>
<script src="js/scriptGame.js"></script>
<link rel="icon" type="image/png" sizes="16x16" href="image/favicon.png">

</head>

<body class="telaLogin">

	<div id="modalSnakeRanking" class="modalRanking">
		<div class=" displayRanking ">
			<form>
				<div class="row">
					<div class="col-dg-12 col-dm-12">
						<h1>RANKING</h1>

					</div>
				</div>
				<form>

					<div class="row ">

						<div class="col-dm-4 col-dg-4">
							<label>RANKING</label>
						</div>

						<div class="col-dm-4 col-dg-4">
							<label>JOGADOR</label>

						</div>
						<div class="col-dm-4 col-dg-4">
							<label>PLACAR</label>
						</div>
					</div>
					<div onload="carregarRanking()">
					</div>
					


					<div align="left">
						<input value="VOLTAR" type="button" onclick="window.open('nivelDificuldade.jsp', '_self')"/>
					</div>
				</form>
			</form>
		</div>
	</div>


</body>

</html>