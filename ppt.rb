<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA_compatible" content="IE=edge"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Pedra, Papel e Tesoura</title>
	<style>
*{
	font-family: helvetica;
	font-weight: 400;

}
#titulo {
background-color: #eb3b5a;
color: #3d3d3d;
text-align: center;
padding: 2px;
font-family: fantasy;
}

#placar {
display: flex;
align-items: center;
justify-content:center ;
} 

#jogador, #computador {
position: relative;
flex-grow: 1;
border-radius: 5px;
width: 200px;
padding: 20px;
color: #636e72;
text-align: center;
}
#jogador {
background-color: #00b894;
}
#computador {
background-color: #e17055;
}
#versus {
	text-align: center;
	font-size: 50px;
width: 80px;
}
#mensagens {
background-color: #778ca3;
padding: 20px;
border-radius: 5px;
margin: 20px 0;
font-size: 32px;
font-family: Brush Script MT;

}
#jogador-nome, #computador-nome {
margin: 0;
padding: 0;

}
#jogador-nome {
text-align: left;
}
#computador-nome {
text-align: right;
}
#jogador-pontos, #computador-pontos {
position: absolute;
top: 9px;
font-size: 32px;
font-weight: bold;
}
#jogador-pontos {
right: 20px;
}

ul#jogador-escolha, ul#computador-escolha {
list-style: none;
margin: 0;
padding: 0;
text-align: center;
}
ul#jogador-escolha li, ul#computador-escolha li {
display: inline-block;
text-align: center;

}
ul#jogador-escolha li a, ul#computador-escolha li a{
opacity: .2;

}
ul#jogador-escolha li a:hover, ul#jogador-escolha li a.selecionado, ul#computador-escolha li a.selecionado {
opacity: 1;
display: block;
}

ul#jogador-escolha li a img, ul#computador-escolha li a img{
max-width: 80px;

}
	</style>


</head>
<body>
	
	<div id="principal">
 <h1 id="titulo"> Pedra, Papel e Tesoura</h1>
 <div id="placar">
 	<div id="jogador">
<h2 id="jogador-nome">Vitor</h2>
<span id="jogador-pontos">0</span>

<ul id="jogador-escolha">
	<li><a id="jogador-escolha-1" onclick="jogar(1)"><img src="pedratst.webp"></a></li>
	<li><a id="jogador-escolha-2" onclick="jogar(2)"><img src="papeltst.jpg"></a></li>
	<li><a id="jogador-escolha-3" onclick="jogar(3)"><img src="tesouratst.png"></a></li>
</ul>
 	 </div>
 	 <div id="versus">vs</div>



	<div id="computador">
<h2 id="computador-nome">Computador</h2>
<span id="computador-pontos">0</span>

<ul id="computador-escolha">
	<li><a id="computador-escolha-1"><img src="pedratst.webp"></a></li>
	<li><a id="computador-escolha-2"><img src="papeltst.jpg"></a></li>
	<li><a id="computador-escolha-3"><img src="tesouratst.png"></a></li>
</ul>
 	 </div>
 </div>
 <div id="mensagens"></div>
	</div>

	<script>
		var jogadorEscolha = 0;
var computadorEscolha = 0;
var ganhador = -1;
var jogadorPontos = 0;
var computadorPontos = 0;

function jogar(escolha) {
  jogadorEscolha = escolha;
  computadorEscolha = Math.floor((Math.random() * 3) + 1);

  if (jogadorEscolha == computadorEscolha) {
    ganhador = 0;
  } else if (
    (jogadorEscolha == 1 && computadorEscolha == 3) ||
    (jogadorEscolha == 2 && computadorEscolha == 1) ||
    (jogadorEscolha == 3 && computadorEscolha == 2)
  ) {
    ganhador = 1;
    jogadorPontos++;
  } else {
    ganhador = 2;
    computadorPontos++;
  }

  atualizarPlacar();
  exibirMensagem();
}

function atualizarPlacar() {
  document.getElementById("jogador-pontos").innerHTML = jogadorPontos;
  document.getElementById("computador-pontos").innerHTML = computadorPontos;
}

function exibirMensagem() {
  var mensagem = "";

  if (ganhador == 0) {
    mensagem = "Empate!";
  } else if (ganhador == 1) {
    mensagem = "Você ganhou!";
  } else {
    mensagem = "Você perdeu!";
  }

  document.getElementById("mensagens").innerHTML = mensagem;
}

function reiniciarJogo() {
  jogadorEscolha = 0;
  computadorEscolha = 0;
  ganhador = -1;
  jogadorPontos = 0;
  computadorPontos = 0;

  atualizarPlacar();
  document.getElementById("mensagens").innerHTML = "";
  document.querySelectorAll("ul li a").forEach((item) => {
    item.classList.remove("selecionado");
  });
}

document.querySelectorAll("ul li a").forEach((item) => {
  item.addEventListener("click", function () {
    document.querySelectorAll("ul li a").forEach((item) => {
      item.classList.remove("selecionado");
    });
    this.classList.add("selecionado");
  });
});

document.getElementById("reiniciar").addEventListener("click", function () {
  reiniciarJogo();
});

document.getElementById("jogar").addEventListener("click", function () {
  if (jogadorEscolha == 0) {
    alert("Por favor, escolha uma opção!");
    return;
  }
  jogar(jogadorEscolha);
});

	</script>
</body>
</html>