%{
    title: "Um Linux pra chamar de meu",
    author: "Fabricio Damazio",
    tags: ~w(linux),
    description: "A incrível experiência do meu primeiro Linux Ricing do zero."
}
---

<img src="/images/posts/2025/10-23-fastfetch.png" alt="Desktop e fastfetch" width="1280" height="720">

Não me lembro qual foi a primeira vez que usei Linux. Nas duas últimas décadas, 
eu tentei muitas vezes abandonar o Windows, mas sempre acabei voltando. No ano 
passado, enfim mudei de vez para o mundo Linux e a distro escolhida foi o Ubuntu.
É uma distro espetacular pra quem está migrando porque é estável, bonita e tudo funciona.

Alguns meses atrás, eu assisti um vídeo do PewDiePie sobre
Linux Ricing. Na época achei bem legal e essa possibilidade de personalizar o Linux
ficou rondando a minha cabeça. Duas semanas atrás resolvi colocar a mão na massa 
e tentar. Como um completo iniciante, comecei pesquisando qual distro escolher.

## Arch Linux e Hyprland - Porque e Como

Durante minha pesquisa na comunidade r/unixporn, muitos não recomendaram Arch Linux
para iniciantes em ricing. Quando estava quase convencido a escolher uma distro mais
amigável, uma mensagem mudou o meu jeito de pensar sobre essa escolha. Ela explicou
que distros como Arch Linux fariam você entender e aprender mais sobre Linux durante
o processo de Ricing. Exatamente o que estava procurando.

Minha primeira escolha foi instalar o Arch Linux utilizando o seu instalador chamado
archinstall. Foi super tranquilo, quase igual instalar o Ubuntu. Instalei já com o
Hyprland e em poucos minutos tudo estava pronto para começar o ricing.

Escolhi o [Hyprland](https://hypr.land/) porque fiquei apaixonado pela sua estética
e os tiles dinâmicos. Outro motivo relevante foi o fato de ele não ser um desktop
environment completo, o que me obriga a personalizar e conhecer ainda mais sobre
o funcionamento interno do Linux.

## A magia do Ricing

Arch Linux e Hyprland instalados, hora de começar o Ricing. Meu primeiro instinto
foi procurar uma maneira de ter uma barra para mostrar o relógio, data e outras
informações úteis. Para isso escolhi a [Waybar](https://github.com/Alexays/Waybar).

Com a waybar funcionando, o próximo passo foi escolher uma maneira de mostrar as
notificações enviadas pelo sistema. Instalei a central de notificação [SwayNC](https://github.com/ErikReider/SwayNotificationCenter) e 
aos poucos fui personalizando seu visual.

<img src="/images/posts/2025/10-23-waybar.png" alt="Notification Center" width="384" height="544">

Conforme fui utilizando o sistema, descobri diversas coisas que eu deveria criar
porque elas simplesmente não existem. Uma tela de bloqueio? Não tem. Um botão de
desligar? Não tem. Para cada coisa que eu queria e não existia, fui pesquisando e
descobrindo inúmeras opções e possibilidades. E assim fui implementando, personalizando
e documentando cada uma delas no meu repositório de [dotfiles](https://github.com/FabriDamazio/dotfiles).

## Terminado, hora de automatizar

"Terminado" é uma palavra muito forte. O Ricing nunca acaba. Sempre existe alguma
coisa a ser melhorada ou implementada. Depois de um fim de semana inteiro disso,
comecei a pensar que, na necessidade de formatar ou trocar de máquina, eu teria de 
fazer tudo isso manualmente de novo. Sendo sincero, eu nem sabia direito mais o que
eu tinha feito. Foi então que tomei a seguinte decisão: recomeçar tudo do zero e
ir anotando o que fiz, criando um shell script para repetir tudo caso precise
reconstruir meu sistema do zero.

Formatei o disco e reiniciei o processo de instalação. Dessa vez não usei o archinstall
e fiz tudo manualmente para entender ainda mais o processo. Conforme fui instalando
e configurando, já fui adicionando no shell script a sua automatização. Usei o
[GNOME Boxes](https://github.com/GNOME/gnome-boxes) para criar uma instalação zerada
do Arch Linux e ir testando o script. A cada modificação eu voltava a máquina ao
estado inicial (instalação limpa do Arch Linux) e rodava o script novamente. 
O resultado disso foi este [script aqui](https://github.com/FabriDamazio/dotfiles/blob/master/install.sh)
que está no repositório dos dotfiles.

Problema resolvido. Caso precise reconstruir todo sistema do zero, estou a salvo.

<img src="/images/posts/2025/10-23-full.png" alt="Linux Ricing completo" width="1280" height="720">

## Conclusão

O processo todo foi muito divertido e prazeroso de fazer. Eu recomendo fortemente
caso você se encaixe em um ou mais dos critérios a seguir:

- Quer aprender mais sobre Linux.
- Está à procura de um projeto divertido.
- Está entediado.
- Não tem problemas suficientes na vida.

---
