function validarLogin() {
    let nome = document.getElementById("txtNome").value.trim();
    let senha = document.getElementById("txtSenha").value.trim();

    if (nome == '') {
    	mensagemAlerta("Usuário Incorreto!");               
        document.getElementById("txtNome").focus();
    } else if (senha == '') {
    	mensagemAlerta("Senha Incorreta!");               
        document.getElementById("txtSenha").focus();
    } else {
    	submitLogin();
    }
}


function validarCadastro() {
    let nomeCad = document.getElementById('txtNomeCadastro').value.trim();
    let emailCad = document.getElementById('txtEmailCadastro').value.trim();
    let senhaCad = document.getElementById('txtSenhaCadastro').value.trim();
    let confSenhaCad = document.getElementById("txtConfSenhaCadastro").value.trim();

    if (nomeCad == '') {
    	mensagemAlerta("Digite o nome do jogador!");               
        document.getElementById("txtNomeCadastro").focus();
    } else if (emailCad == '' || document.getElementById("txtEmailCadastro").value.indexOf('@') == -1 || document.getElementById("txtEmailCadastro").value.indexOf('.') == -1) {
    	mensagemAlerta("Digite o e-mail do jogador!");    	       
        document.getElementById("txtEmailCadastro").focus();
    } else if (senhaCad == '') {
    	mensagemAlerta("Digite a senha do jogador!");               
        document.getElementById("txtSenhaCadastro").focus();
    } else if (senhaCad.length < 8) {
    	mensagemAlerta("Senha com no minímo 8 caracteres!");               
        document.getElementById("txtSenhaCadastro").focus();
    } else if (confSenhaCad == '') {
    	mensagemAlerta("Repita a senha!");
        document.getElementById("txtConfSenhaCadastro").focus();
    } else if (confSenhaCad != senhaCad) {
    	mensagemAlerta("As senhas não coincidem!");     
        document.getElementById("txtConfSenhaCadastro").focus();
    } else {
    	submitCadastro();
    }
}

function submitLogin(){
	document.forms['formLogin'].submit();
}
function submitCadastro(){
	document.forms['formCadastro'].submit();
}

function mensagemAlerta(mensagem) {
	setTimeout(function() {
    document.getElementById("mensagemAlerta").innerHTML = mensagem;
    document.getElementById('modalSnakeMensagem').style.display = 'block'; 
	}, 500);
}