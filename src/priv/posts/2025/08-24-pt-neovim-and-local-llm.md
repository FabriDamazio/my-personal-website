%{
    title: "Neovim e LLMs locais",
    author: "Fabricio Damazio",
    tags: ~w(programming),
    description: "Minha experiência com o Ollama e o plugin CodeCompanion no Neovim."
}
---

É fácil se perder no frenesi atual em torno de LLMs, agents, e vibe coding. 
A sensação de que você está ficando para trás ou perdendo a próxima ferramenta 
revolucionária é constante.

Sobre usar IA para programar, eu posso me descrever como uma pessoa cautelosa.
Costumo avaliar bem como e quando usar. Tenho mais preocupação com os malefícios
que ela pode causar para meu aprendizado do que excitação pelos benefícios de
produtividade prometidos. Em busca de um uso mais consciente e controlado de IA, 
essa semana comecei a utilizar uma LLM rodando localmente e integrada com o Neovim
e quero falar um pouco dessa experiência.

## Motivações

Decidi iniciar esse projeto porque rodar uma LLM localmente dá uma boa resposta
para os principais preocupações que tenho com o uso de IA. A primeira e a principal 
delas é em relação a privacidade. Processar meus dados localmente é algo ideologicamente 
prioritário (não precisar pagar nada por isso é um plus). A segunda é sobre ter 
controle do meu próprio ambiente, escolhendo os modelos e quando usa-los. E, por
fim, a velocidade de resposta quase instantânea que deixa toda experiência fluída.

Eu tenho um computador desktop que tem uma configuração generosa com uma cpu AMD
9950x, uma placa de vídeo RTX 4090 e 32gb de ram DDR5. Com esse poder computacional
a disposição, faz bastante sentido tirar proveito dos benefícios de rodar uma LLM local.

## Rodando o modelo localmente

[Ollama](https://ollama.com/){: target="_blank" .font-medium .text-pink-800 } foi minha escolha pra rodar os modelos localmente.
A simplicidade é absurda: apenas um comando para instalar no linux e outro para 
baixar um modelo e executá-lo.

Desde então venho testando diferentes modelos. Quero encontrar um ou dois
modelos especializados para cada tipo de tarefa. Por exemplo, para programar em 
Elixir e Rust, venho testando o modelo `qwen3:30b-a3b-instruct-2507-q4_K_M`. Escolhi 
um modelo de 30B (Bilhões de parâmetros) por oferecer um bom poder de raciocínio
e a quantização `q4_K_M` para que ele coubesse confortavelmente na memória VRAM 
da minha 4090 sem sacrificar muito a qualidade. O resultado tem sido surpreendente 
e pretendo continuar nos próximos meses ir testando diferentes modelos.

## Integrando com o Neovim

Escolhi o plugin [CodeCompanion](https://github.com/olimorris/codecompanion.nvim){: target="_blank" .font-medium .text-pink-800 }
para a integração entre o Ollama e o Neovim. A instalação e configuração foram simples,
basicamente segui as instruções da documentação. 

Achei a experiência parecida com a que tive quando testei o editor Zed. Com um comando
o painel do chat se abre e é possível interagir com o modelo. O chat permite adicionar 
arquivos como contexto na conversa. No chat é possível alterar qual modelo deseja 
utilizar (locais ou remotos).

Também é possível utilizar tools que podem executar diversas tarefas como procurar
arquivos, edit-los, executar comandos, etc.

Vale a pena visitar o site do plugin e ver os vídeos disponíveis para entender do
que o plugin é capaz de fazer.

## Minha experiência até agora

Ainda está bem recente mas a experiência até o momento esta sendo bem positiva.
Como eu disse, sou bem cauteloso com o uso de IA, então meu uso se resume a consultas
de documentações, e conceitos teóricos e debater alguma solução que estou pensando.

Não utilizo tools para editar ou resolver erros diretamente no código pra mim. Acredito
fortemente que não devo terceirizar meu entendimento da solução e do código para uma IA,
mas ainda sim acho que ela vai me ajudar a ter um fluxo de desenvolvimento mais fluído.
É cedo pra dizer, mas veremos se isso se confirma com o tempo. 

Todo meu código 
de configuração do Neovim esta disponível [neste repositório](https://github.com/FabriDamazio/nvim){: target="_blank" .font-medium .text-pink-800 }.

---

