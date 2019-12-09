let cadastroJogadores = [];
let cadastroJogadoresJson = [];

function cadastroFim(){

    let nameUser= document.getElementById('txtNomeCadastro').value.trim();
    let emailUser = document.getElementById('txtEmailCadastro').value.trim();
    let passwordUser = document.getElementById('txtSenhaCadastro').value.trim();

    cadastroJogadores.push({
        jogador: nameUser,
        email: emailUser,
        senha: passwordUser
    });

    //Converte a tabela que esta em JSON em string
    localStorage.setItem("cadastroJogadores", JSON.stringify(cadastroJogadores))

    //Converte a tabala que esta em string numa estrutura JSON
    cadastroJogadoresJson = JSON.parse(localStorage.getItem("cadastroJogadores"));
    
    document.getElementById('modalSnakeMensagemCadastro').style.display = 'block';

}

function login(id) {
    return JSON.parse(localStorage.getItem('cadastroJogadores')).filter(cadastroJogadores => cadastroJogadores.id === id)
}



