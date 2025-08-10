%{
    title: "Este blog tem menos de 14kb",
    author: "Fabricio Damazio",
    tags: ~w(elixir),
    description: "Otimizando um app em Phoenix framework para carregar realmente muito rápido."
}
---
Ontem assisti [este vídeo ↗](https://www.youtube.com/watch?v=ciNXbR5wvhU){: target="_blank" .font-medium .text-pink-800 }
onde o Primeagen fala sobre como páginas menores que 14kB podem carregar mais 
rápido que uma de 15kB (vídeo baseado 
[neste post ↗](https://endtimes.dev/why-your-website-should-be-under-14kb-in-size/)
{: target="_blank" .font-medium .text-pink-800 }).

Depois de ver o vídeo fiquei pensando em maneiras de como otimizar o carregamento
deste blog. Ele é um aplicativo padrão feito em Elixir utilizando o Phoenix Framework
sem nenhum tipo de otimização realizada.

# O Antes

Primeiro vou acessar o blog com o cache desligado e anotar o tamanho da 
resposta da request. Assim será possível comparar o antes e o depois.

Resposta da request:

    html        (3.04kB)
     app.js      (39.26kB)
     app.css     (6.64kB)
     br_flag.svg (2.81kB)
     us_flag.svg (702B)
     cn_flag.svg (722B)
     favicon.ico (468B)

No total foram 53.64kB de dados recebidos. 
Nada mal para um app padrão, mas com o espaço para diversas melhorias.

# Removendo o arquivo app.js

A primeira otimização que farei será retirar o arquivo app.js que vem por padrão nos
aplicativos criados com Phoenix. Este arquivo possui javascript escrito para a 
utilização de Liveview, interaçã́o com eventos como o phx-click e hooks. Por enquanto
eu não preciso de nada disso. O blog é apenas um site estático que renderiza
em HTML posts escritos em markdown. 

Depois de removido o apps.js, a resposta da request ficou assim:

    html        (3.02 kB)
     app.js      (0 kB) - removed
     app.css     (6.64 kB)
     br_flag.svg (2.81 kB)
     us_flag.svg (702 B)
     cn_flag.svg (722 B)
     favicon.ico (468 B)

No total foram 14.36kB de dados recebidos. 
Uma melhoria e tanto, mas ainda não o suficiente.

# Otimizando o Tailwind

Odeio escrever CSS, por isso não abri mão de usar o Tailwind.
Em um app Phoenix  é possível configurar o uso do Tailwind editand o arquivo 
tailwind.config.js. Remover os plugins e core components não usados parece uma
boa idéia. Para  isso o arquivo de configuração vai ficar mais ou menos assim:

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
  plugins: []
```
Testando após essas mudanças, o tamanho do CSS gerado diminuiu e a resposta
da request ficou assim:

    html        (3.02 kB)
     app.css     (4.60 kB)
     br_flag.svg (2.81 kB)
     us_flag.svg (702 B)
     cn_flag.svg (722 B)
     favicon.ico (468 B)

No total foram 12.32kB de dados recebidos. Já esta absurdamente rápido.

# CSS e SVG preload

Para melhorar o tempo de carregamento, configurei o preload do CSS. Isso permite
que o CSS seja carregado em paralelo e ele otimiza indicadores como o LCP 
(Largest Contentful Paint) que deixa a renderização do conteúdo principal mais rápido
e o CLS (Cumulative Layout Shift) que evita saltos no layout durante o carregamento.
Para isso bastou adicionar algo como:

```html
<link
  rel="preload"
  href={~p"/assets/app.css"}
  as="style"
  ...
/>
``` 

Agora as bandeiras...

Para representar as bandeiras, o Unicode usa uma combinação de caracteres chamados
"tag sequences". Isso permitiu que eu implementasse as bandeiras de linguagem do blog 
utilizando apenas emojis, sem a necessidade do uso de imagens ou SVG. 

Infelizmente fazendo alguns testes descobri que o Windows não implementa nativamente
os emojis de bandeiras (obrigado Microsoft!). A saída então foi usar SVGs com preload.

# Simplificando a bandeira do Brasil

Os 2.81kB do SVG da bandeira do Brasil parecem abusivos. Para um ícone tão pequeno
alguns detalhes da bandeira podem ser omitidos. Com essa mudança a bandeira
agora tem apenas 698B.

# O Depois

Para finalizar, melhorei algumas classes CSS e cheguei no seguinte resultado (ANTES/DEPOIS):

    html        (3.04 kB → 2.48 kB)    (-18%)
     app.js      (39.26 kB → 0 kB)      (-100%)
     app.css     (6.64 kB → 3.95 kB)    (-40%)
     br_flag.svg (2.81 kB → 698 B)      (-75%)
     us_flag.svg (702 B → 702 B)        (0%)
     cn_flag.svg (722 B → 722 B)        (0%)
     favicon.ico (468 B → 468 B)        (0%)
     -----------------------------------------
     TOTAL:     53.64 kB → 9.02 kB      (-83%)

Ainda existe espaço para mais otimizações mas por enquanto vou parar por aqui.

As otimizações possibilitaram o blog ter um tamanho ridiculamente pequeno.
No momento, a soma do tamanho de todos arquivos recebidos na primeira request é
perto de 9Kb compactados.

Isso sem nenhum tipo de cache. Depois do primeiro acesso com o CSS e SVG já em cache,
o blog tem apenas 2.48Kb de dados enviados e reponde em média abaixo de incríveis 30ms.

Rápido, muito rápido.

---
