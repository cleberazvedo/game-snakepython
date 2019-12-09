const vel = 1; // responsável pelo incremento na variavel velocidade criando o movimento da cobra

var posicaoX = 10; //posição x (horizontal)
var posicaoY = 10; //poisição y (vertical)
var comerX = 5; //posição x da maçã (horizontal)
var comerY = 5; //posição y da maçã (vertical)
var antComerX; //posição x da maçã (horizontal) - para verificar se repete posição
var antComerY; //posição y da maçã (vertical) - para verificar se repete posição
var velocidadeX = 0; //movimentação da cobra horizontalmente - utilizado pelo js Move para movimentar a cobra
var velocidadeY = 0; //movimentação da cobra verticalmente - utilizado pelo js Move para movimentar a cobra
var grid = 20; // tamanho do quadradinho da cobra
var snake = []; // vetor snake
var tam = 5; // numero de blocos da snake
var bordaX = 40; // limite da borda width
var bordaY = 20; // limite da borda height
var pontuacaoJogador = 0; // pontuação
var velocidadeSnake; // variavel para dar o pause e limpar o setinterval
var parada = false; // bolleano para evitar que o play acelere a cobra
var velSnake = 0; // variavel para determinar a velocidade do snake por nivel de dificuldade
var totalPontos = 0; // pontos feitos no jogo
var maiorPontos = 0; // variavel responsável pelo high score
var totalPontosServlet = 0;



venenoX = [];
venenoY = [];

for (var j = 0; j<10;j++){
	

	if((venenoX[j] == comerX && venenoY[j] == comerY)){
		venenoX[j] = Math.floor(Math.random() * bordaX);
		venenoY[j] = Math.floor(Math.random() * bordaY);
	} else if((venenoX[j] == posicaoX && venenoY[j] == posicaoY)){
		venenoX[j] = Math.floor(Math.random() * bordaX);
		venenoY[j] = Math.floor(Math.random() * bordaY);
	} else {
		venenoX[j] = Math.floor(Math.random() * bordaX);
		venenoY[j] = Math.floor(Math.random() * bordaY);
		
	}
	
}


function jogo() {
	posicaoX += velocidadeX;
	posicaoY += velocidadeY;

	// VAZAR PELA BORDA
	console.log(posicaoX);
	if (posicaoX < -1) {
		posicaoX = bordaX;
		console.log("borda esquerda");
		gameOver();
	}
	if (posicaoX > bordaX) {
		posicaoX = -1;
		console.log("borda direita");
		gameOver();
	}
	if (posicaoY < -1) {
		posicaoY = bordaY;
		console.log("borda superior");
		gameOver();
	}
	if (posicaoY > bordaY) {
		posicaoY = -1;
		console.log("borda inferior");
		gameOver();
	}

	context.fillStyle = "black"; // cor do background - preto opacity
	context.fillRect(0, 0, canvas.width, canvas.height);

	context.fillStyle = "white"; // cor da snake - branco
	for (var i = 0; i < snake.length; i++) {
		context.fillRect(snake[i].x * grid, snake[i].y * grid, grid-1, grid-1); //matriz da cobra
		console.log(i);
		if (tam > 5 && (snake[i].x == posicaoX && snake[i].y == posicaoY) ){ //colisão com o rastro da cobra
			console.log("GAME OVER");
			gameOver();
		}
	}

	snake.push({
		x : posicaoX,
		y : posicaoY
	});
	while (snake.length > tam) {
		snake.shift();
	}

	context.fillStyle = "red"; // cor da maçã
	context.fillRect(comerX * grid, comerY * grid, grid-1, grid-1); //matriz maçã

	// comer maçã
	if (posicaoX == comerX && posicaoY == comerY) {
		pontuar("totalPontos","totalPontosServlet");
		tam++;
		antComerX = Math.floor(Math.random() * bordaX);
		antComerY = Math.floor(Math.random() * bordaY);
		
		// solução para maçã não repetir o mesmo ponto que foi comida
		if (antComerX == comerX && antComerY == comerY) { 
			comerX = Math.floor(Math.random() * bordaX);
			comerY = Math.floor(Math.random() * bordaY);
		} else {
			comerX = antComerX;
			comerY = antComerY;
		}
		console.log("comer");

	
	}
	
	context.fillStyle = "#8a078a";	context.fillRect(venenoX[0] * grid, venenoY[0] * grid, grid-1, grid-1); //matriz venenyo
	if (posicaoX == venenoX[0] && posicaoY == venenoY[0]) {
		gameOver();
	}	
	
	context.fillStyle = "#8a078a";
	context.fillRect(venenoX[1] * grid, venenoY[1] * grid, grid-1, grid-1); //matriz veneno
	if (posicaoX == venenoX[1] && posicaoY == venenoY[1]) {
		gameOver();
	}
	
	context.fillStyle = "#8a078a";
	context.fillRect(venenoX[2] * grid, venenoY[2] * grid, grid-1, grid-1); //matriz veneno
	if (posicaoX == venenoX[2] && posicaoY == venenoY[2]) {
		gameOver();
	}
	
	
	context.fillStyle = "#8a078a";
	context.fillRect(venenoX[3] * grid, venenoY[3] * grid, grid-1, grid-1); //matriz veneno
	if (posicaoX == venenoX[3] && posicaoY == venenoY[3]) {
		gameOver();
	}
	
	context.fillStyle = "#8a078a";
	context.fillRect(venenoX[4] * grid, venenoY[4] * grid, grid-1, grid-1); //matriz veneno
	if (posicaoX == venenoX[4] && posicaoY == venenoY[4]) {
		gameOver();
	}
	
	context.fillStyle = "#8a078a";
	context.fillRect(venenoX[5] * grid, venenoY[5] * grid, grid-1, grid-1); //matriz veneno
	if (posicaoX == venenoX[5] && posicaoY == venenoY[5]) {
		gameOver();
	}
	
	context.fillStyle = "#8a078a";
	context.fillRect(venenoX[6] * grid, venenoY[6] * grid, grid-1, grid-1); //matriz veneno
	if (posicaoX == venenoX[6] && posicaoY == venenoY[6]) {
		gameOver();
	}
	
	context.fillStyle = "#8a078a";
	context.fillRect(venenoX[7] * grid, venenoY[7] * grid, grid-1, grid-1); //matriz veneno
	if (posicaoX == venenoX[7] && posicaoY == venenoY[7]) {
		gameOver();
	}
	
	context.fillStyle = "#8a078a";
	context.fillRect(venenoX[8] * grid, venenoY[8] * grid, grid-1, grid-1); //matriz veneno
	if (posicaoX == venenoX[8] && posicaoY == venenoY[8]) {
		gameOver();
	}
	
	context.fillStyle = "#8a078a";
	context.fillRect(venenoX[9] * grid, venenoY[9] * grid, grid-1, grid-1); //matriz veneno
	if (posicaoX == venenoX[9] && posicaoY == venenoY[9]) {
		gameOver();
	}
	

		
}

//incrementar a pontuação em tempo real
function pontuar(idPontos,idServlet) {
	totalPontos = document.getElementById(idPontos).innerHTML++;
	totalPontosServlet = document.getElementById(idServlet).value = totalPontos+1;
}

// buscar o ultima melhor pontuação pelo localStorage
function atualizarMaiorPontos(idCampo) {
	if (totalPontos > maiorPontos) {
		let pontuacao = {nivel : idCampo, pontos : totalPontos};
		let pontos = localStorage.setItem("maiorPontos", JSON.stringify(pontuacao));
	} 

}

//carregar os pontos da melhor pontuação no HIGH SCORE
function carregarMaiorPontos(idCampo) { 
	if (typeof (Storage) !== "undefined") {
		let maiorPontos = JSON.parse(localStorage.getItem("maiorPontos"));		
		if (maiorPontos == null) {
			maiorPontos = 0;
		} else {
			document.getElementById(idCampo).innerHTML = (maiorPontos.pontos + 1);
		}

	} else
		alert("A versão do seu navegador é muito antiga. Por isso, não será possível executar essa aplicação");
}

//botao para play no jogo
function playGame(velSnake) { 
	if (parada == true) {
		iniciarJogo(velSnake);
		parada = false;
	}
}

//botao para pausar o game
function pauseGame() { 
	clearInterval(velocidadeSnake);
	parada = true;
}

//função game over
function gameOver(idCampo){
	pauseGame();
	atualizarMaiorPontos(idCampo);	
	insertRanking();
	window.location='gameOver.jsp';
}

/*
function cadastraRankingSubmit(){
    //Define o formulário
	
    var myForm = document.createElement("form");
    myForm.action = "analiseRanking";
    myForm.method = "post";

for(var key in obj) {
 var input = document.createElement("input");
 input.type = "text";
 input.value = obj[key];
 input.name = key;
 myForm.appendChild(input);			
}
    //Adiciona o form ao corpo do documento
    document.body.appendChild(myForm);
    //Envia o formulário
    myForm.submit();
} */

function fecharJanelaGameOver(){
	document.getElementById('modalSnakeMensagem').style.display='none';
	window.location='../ranking.jsp';
	
}

function insertRanking(){
	document.getElementById("analiseRanking").submit();
}
