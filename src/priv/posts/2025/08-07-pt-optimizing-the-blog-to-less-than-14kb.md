%{
    title: "Este blog tem menos de 14kb",
    author: "Fabricio Damazio",
    tags: ~w(elixir),
    description: "Otimizando um app em Phoenix framework para carregar realmente rápido."
}
---
Ontem estava assistindo alguns vídeos aleatórios na internet quando vi
[este vídeo ↗](https://www.youtube.com/watch?v=ciNXbR5wvhU){: target="_blank" .font-medium .text-pink-800 }
do Primeagen no Youtube. O vídeo é sobre [este post ↗](https://endtimes.dev/why-your-website-should-be-under-14kb-in-size/)
{: target="_blank" .font-medium .text-pink-800 } que fala sobre como páginas menores que 14kB carregam muito rápido.
<br>
Durante o vídeo ele questiona se seria possível fazer isso utilizando Phoenix Framework
e por isso resolvi tentar otimizar este blog que é feito em Phoenix. Abaixo vou 
explicar o processo e mostrar o resultado.

# O Antes

O blog é um app Phoenix padrão. Nenhum tipo de otimização extra foi realizado.
Meu primeiro teste será realizar o acess com o cache desligado e anotar a 
resposta da request. Assim será possível comparar o antes e o depois.

A primeira request teve esta resposta:

- html (3.04kB)
- app.js (39.26kB)
- app.css (6.64kB)
- br_flag.svg (2.81kB)
- us_flag.svg (702B)
- cn_flag.svg (722B)
- favicon.ico (468B)

No total foram 54.64kB de dados em um tempo de aproximadamente 110ms.
Nada mal para um app padrão, mas bem acima dos 14kB propostos.

Hora de começar a otimizar.

# Removendo app.js

A primeira otimização que farei será retirar o arquivo app.js que vem por padrão nos
aplicativos criados com Phoenix. Este arquivo possui javascript escrito para a 
utilização de Liveview, interaçã́o com eventos como o phx-click e hooks. Por enquanto
eu não preciso de nada disso. O blog é apenas um site estático que renderiza
em HTML posts escritos em markdown. 

Depois de removido o arquivo, a resposta da request ficou assim:

- html (3.02kB)
- app.js (0kB) - removido
- app.css (6.64kB)
- br_flag.svg (2.81kB)
- us_flag.svg (702B)
- cn_flag.svg (722B)
- favicon.ico (468B)

No total foram 14.36kB de dados em um tempo de aproximadamente 97ms.
Uma melhoria e tanto, mas ainda ligeiramenta acima dos 14kB.

# Otimizando o Tailwind

Odeio escrever CSS, por isso não abri mão de usar o Tailwind. Eu poderia pedir
para alguma IA escrever o CSS mas resolvi tentar otimizar o uso do Tailwind.
Em um app Phoenix existe um arquivo chamado tailwind.config.js onde é possível
fazer uma série de configurações de uso do framework. Removi todos plugins e 
core components possíveis, deixando o arquivo assim:

```js
module.exports = {
  content: [
    "./js/**/*.js",
    "../lib/site_web.ex",
    "../lib/site_web/**/*.*ex"
  ],
  corePlugins: {
    float: false,
    animation: false,
    gradient: false,
    filter: false,
    backdropFilter: false,
    ringWidth: false,
    skew: false,
    rotate: false,
    translate: false,
  },
  plugins: [
```
Com essas mudanças, o tamanho do CSS gerado diminuiu e a resposta
da request ficou assim:

- html (3.02kB)
- app.css (4.60kB)
- br_flag.svg (2.81kB)
- us_flag.svg (702B)
- cn_flag.svg (722B)
- favicon.ico (468B)

No total foram 12.32kB de dados em um tempo de aproximadamente 95ms.
Agora o blog esta abaixo de 14kB, mas por muito pouco. Preciso economizar mais
um pouco de bytes porque o limite será ultrapassado assim que eu criar novos 
posts e eles forem exibidos na home.

# CSS e SVG preload

Para melhorar o tempo de carregamento, configurei o preload do CSS. Isso permite
que o CSS seja carregado em paralelo e ele otimiza indicadores como o LCP 
(Largest Contentful Paint) que deixa a renderização do conteúdo principal mais rápido
e o CLS (Cumulative Layout Shift) que evita saltos no layout durante o carregamento.

Para representar as bandeiras, o Unicode usa uma combinação de caracteres chamados
"tag sequences". Isso permitiu que eu mostrasse as bandeiras de linguagem do blog 
utilizando apenas emojis, sem a necessidade de imagens ou SVG. Infelizmente fazendo 
alguns testes descobri que o Windows não implementa nativamente os emojis de 
bandeiras (obrigado Microsoft!). A saída então foi usar SVGs.

Com o preload do CSS e do SVG não houve mudança da quantidade de dados e na velocidade
de carregamento.



# O Depois

Com essas otimizações foi possível manter o blog abaixo dos 14Kb. No momento a 
primeira request tem 8Kb de tamanho e com tempo médio de carregamento de 30ms.
Isso sem nenhum tipo de cache. Depois do primeiro acesso com o CSS e SVG em cache
o blog tem apenas 4Kb e reponde em incríveis 20ms.

Rápido, muito rápido.
