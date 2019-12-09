function pararOlhos(logo){
    clearTimeout(olhos);
    document.getElementById('olhosPiscando').src = ('image/logo.png');
}

function piscarOlhos(logo){
    setTimeout(function () { document.getElementById('olhosPiscando').src = ('image/logof.png') }, 200);
    document.getElementById('sonsStart').play();
    setTimeout(function () { document.getElementById('olhosPiscando').src = ('image/logo.png') }, 500);
}
function intervaloPiscarOlhos(logo){
    setInterval(function () { piscarOlhos(logo) }, 12000);
}


function playAudio(audio) {
    document.getElementById(audio).play();
}

function pauseAudio(audio) {
    document.getElementById(audio).pause();
    document.getElementById(audio).currentTime = 0;
}

function fecharJanelaLoginSucesso(){
	document.getElementById('modalSnakeMensagem').style.display='none';
	window.location='nivelDificuldade.jsp';
	
}
function fecharJanelaCadastroSucesso(){
	document.getElementById('modalSnakeMensagem').style.display='none';
	window.location='index.jsp';
	
}