<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
<link rel="icon" type="image/png" sizes="16x16" href="image/favicon.png">

</head>

<body class="telaLogin" onload="intervaloPiscarOlhos()">
	<audio id="sonsButton">
		<source src="sound/button.wav" type="audio/wav">
	</audio>
	<audio id="sonsText">
		<source src="sound/textArea.wav" type="audio/wav">
	</audio>
	<audio id="sonsStart">
		<source src="sound/start.wav" type="audio/wav">
	</audio>

	<div class="boxSnake1 row">
		<div class="col-dg-12, col-dm-12">

			<img id="olhosPiscando" src="image/logo.png" alt="GAME SNAKE PYTHON"
				onmouseover="piscarOlhos()" onmouseout="pararOlhos()">
		</div>
	</div>
	<div class="row">
		<div class="col-dg-12, col-dm-12">
			<div class="modal-container">
				<button
					onclick="document.getElementById('modalSnakeLogin').style.display='block'"
					class="modal-button efeitoFontePiscando"
					onfocus="playAudio('sonsStart')" onblur="pauseAudio('sonsStart')">PRESS
					START</button>

				<div id="modalSnakeLogin" class="modal">
					<div class="modal-animate-top displayLogin ">
						<header>
							<span
								onclick="document.getElementById('modalSnakeLogin').style.display='none'; limparMensagemAlerta()"
								class="modal-button modal-display-topright">&times;</span>
						</header>
						<form method="post" action="loginUsuario">
							<div class="row">
								<div class="col-dg-12 col-dm-12">
									<h1>GAME SNAKE PYTHON</h1>
									<h3>LOGIN</h3>
								</div>
							</div>
							<br> <br>
							<div class="row">
								<div class="col-dg-4 col-dm-4">
									<label for="txtNome">JOGADOR</label>
								</div>
								<div class="col-dg-8 col-dm-8">
									<input type="text" name="jogador" id="txtNome" maxlength="40"
										required="required" onfocus="playAudio('sonsText')"
										onblur="pauseAudio('sonsText')">
								</div>
							</div>
							<div class="row">
								<div class="col-dg-4 col-dm-4">
									<label for="txtSenha">SENHA</label>
								</div>
								<div class="col-dg-8 col-dm-8">
									<input type="password" name="senha" id="txtSenha"
										maxlength="20" required="required"
										onfocus="playAudio('sonsText')"
										onblur="pauseAudio('sonsText')">
								</div>
							</div>
							<br> <br>
							<div class="row">
								<div class="col-dg-6 col-dm-6">
									<input type="submit" value="CADASTRAR"
										onclick="document.getElementById('modalSnakeCadastro').style.display = 'block';
                                        document.getElementById('modalSnakeLogin').style.display = 'none';"
										onfocus="playAudio('sonsButton')"
										onblur="pauseAudio('sonsButton')">
								</div>
								<div class="col-dg-6 col-dm-6">
									<input type="submit" value="ENTRAR" onclick="validarLogin()"
										onfocus="playAudio('sonsButton')"
										onblur="pauseAudio('sonsButton')">
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="modalSnakeCadastro" class="modal">
		<div class="modal-animate-top displayCadastro ">
			<header>
				<span
					onclick="document.getElementById('modalSnakeCadastro').style.display='none'; document.getElementById('modalSnakeLogin').style.display='block'; limparMensagemAlerta()"
					class="modal-button modal-display-topright">&times;</span>
			</header>
			<form method="post" action="cadastrarUsuario">
				<div class="row">
					<div class="col-dg-12 col-dm-12">
						<h1>GAME SNAKE PYTHON</h1>
						<h3>CADASTRO</h3>
					</div>
				</div>
				<br> <br>
				<div class="row">
					<div class="col-dg-5 col-dm-5">
						<label for="txtNome">JOGADOR</label>
					</div>
					<div class="col-dg-7 col-dm-7">
						<input type="text" name="usuario" id="txtNomeCadastro"
							maxlength="40" required="required"
							onfocus="playAudio('sonsText')" onblur="pauseAudio('sonsText')">
					</div>
				</div>
				<div class="row">
					<div class="col-dg-5 col-dm-5">
						<label for="txtNome">E-MAIL</label>
					</div>
					<div class="col-dg-7 col-dm-7">
						<input type="email" name="email" id="txtEmailCadastro"
							maxlength="40" required="required"
							onfocus="playAudio('sonsText')" onblur="pauseAudio('sonsText')">
					</div>
				</div>
				<div class="row">
					<div class="col-dg-5 col-dm-5">
						<label for="txtSenha">SENHA</label>
					</div>
					<div class="col-dg-7 col-dm-7">
						<input type="password" name="senha" id="txtSenhaCadastro"
							minlength="8" maxlength="20" required="required"
							onfocus="playAudio('sonsText')" onblur="pauseAudio('sonsText')">
					</div>
				</div>
				<div class="row">
					<div class="col-dg-5 col-dm-5">
						<label for="txtSenha">CONFIRME A SENHA</label>
					</div>
					<div class="col-dg-7 col-dm-7">
						<input type="password" name="confSenha" id="txtConfSenhaCadastro"
							maxlength="20" required="required"
							onfocus="playAudio('sonsText')" onblur="pauseAudio('sonsText')">
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-dg-6 col-dm-6">
						<input type="reset" value="LIMPAR" id="limpar"
							onfocus="playAudio('sonsButton')"
							onblur="pauseAudio('sonsButton')">
					</div>
					<div class="col-dg-6 col-dm-6">
						<input type="submit" value="CADASTRAR"
							onfocus="playAudio('sonsButton')"
							onblur="pauseAudio('sonsButton')"
							onclick=" validarCadastro(); cadastroFim();">
					</div>
				</div>
			</form>
		</div>
	</div>
	<div id="modalSnakeMensagem" class="modalAparece mensagem">
		<div class="modal-animate-top displayMensagem ">
			<header>
				<span
					onclick="fecharJanelaLoginSucesso()"
					class="modal-button modal-display-topright">&times;</span>
			</header>
			<br> <br>
			<form>
				<div class="row">
					<div class="col-dg-12 col-dm-12">
						<span id="mensagemAlerta">Login Realizado com Sucesso!</span>
					</div>
				</div>
			</form>
		</div>
	</div>


</body>

</html>