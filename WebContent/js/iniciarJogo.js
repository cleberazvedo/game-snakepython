function iniciarJogo(velSnake, idPonto) {
    canvas = document.getElementById("canvas");
    context = canvas.getContext("2d");

    document.addEventListener("keydown", function(e) {
        console.log(e.keyCode);
        switch (e.keyCode) {
            case 37: //esquerda
                velocidadeX = -vel;
                velocidadeY = 0;
                break;
            case 38: //cima
                velocidadeY = -vel;
                velocidadeX = 0;
                break;
            case 39: //direita
                velocidadeX = vel;
                velocidadeY = 0;
                break;
            case 40: //baixo
                velocidadeY = vel;
                velocidadeX = 0
                break;
            case 32: //espaço
                velocidadeY = vel;
                velocidadeX = 0
                break;
                       
        }
    });

    velocidadeSnake = setInterval(jogo, velSnake); //DETERMINA A VELOCIDADE DA snake

}
