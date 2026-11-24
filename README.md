# Estatística em campo · UFSM

**O que o comprimento da nadadeira revela sobre a massa de um pinguim?** Neste minicurso de duas horas, você vai explorar medidas reais, testar hipóteses e ajustar uma reta. O percurso principal usa R. O notebook em Python acompanha os mesmos blocos, dados e perguntas.

**Disciplina:** Estatística Aplicada para a Engenharia (UFSM00020), turma de Sistemas de Informação. **Ministrantes:** Lorenzo Moreira Donatti e Deivis Felipe Guerreiro Fagundes.

## Comece aqui

1. No GitHub, escolha **Code → Download ZIP** e extraia a pasta inteira. Mantenha a pasta `data` ao lado dos arquivos da prática.
2. Abra `slides/index.html` no navegador para acompanhar a aula offline. As setas avançam e voltam. Nas lâminas 3, 6, 9 e 16, o botão de atividade abre o atlas, o histograma, o sorteio de amostras e a reta ajustável. Para ler direto no GitHub, use a [apresentação em PDF](slides/aula.pdf).
3. Conheça a coleta antes de abrir o código. Quando a apresentação chegar à ficha do primeiro animal, abra o bloco **A** na linguagem escolhida e prossiga em ordem.

| Material | Como usar |
|---|---|
| [Prática em R](pratica.R) | Abra no RStudio e escolha *Session → Set Working Directory → To Source File Location*. Selecione um bloco e pressione Ctrl+Enter (Cmd+Enter no Mac). O script usa R base. |
| [Notebook em Python](pratica.ipynb) | Abra no Jupyter ou no VS Code, selecione o ambiente com as dependências instaladas e execute as células com Shift+Enter. |
| [Apresentação em HTML](slides/index.html) | Para usar as interações, abra o arquivo baixado no navegador. A página do arquivo no GitHub mostra o código-fonte. |
| [Dados em CSV](data/penguins.csv) | Uma linha reúne as observações de um animal. A primeira análise deve carregar 344 linhas e oito colunas. |

Se estiver preparando o ambiente Python, abra um terminal na pasta extraída e execute `python -m pip install -r requirements.txt` no mesmo ambiente que selecionará no notebook. Se o bloco A acusar arquivo ausente, confira se `data/penguins.csv` está na pasta extraída e se o diretório de trabalho é o do material.

## Roteiro da dupla

Antes de executar cada bloco, façam uma previsão. Depois anotem o resultado com unidade ou denominador e uma frase sobre o que os dados permitem concluir.

| Bloco | Lâminas | Entrega da dupla |
|---|---|---|
| A · Coleta | 1–4 | Escolham ilha e ano no atlas. Reproduzam o filtro no código e identifiquem uma variável categórica e uma quantitativa. |
| B · Descrição | 5–8 | Comparem as massas das espécies. Expliquem por que a média e a proporção podem usar números diferentes de registros. |
| C · Média | 9–12 | Explorem os sorteios e usem o teste t para avaliar a referência didática de 3700 g nos Adélie. Escrevam a estimativa, o IC e a decisão. |
| D · Proporção | 13–14 | Usem o teste binomial exato para avaliar a referência de 50% de fêmeas entre Adélie com sexo registrado. Discutam o desenho da coleta. |
| E · Regressão | 15–19 | Interpretem a correlação, a inclinação em g/mm e o resíduo do primeiro animal. |
| F · Aplicação em sistemas | 20–22 | Transfiram os métodos para uma base de requisições. Definam o denominador da taxa de sucesso e a unidade da inclinação da latência por tamanho da resposta. |

A aula usa testes bilaterais com significância de 5% e intervalos de confiança de 95%. Os testes ilustram a inferência sob hipóteses de amostragem. Na discussão dos resultados, considerem como a coleta por ilha, ano e pares pode afetar a independência das observações.

## De onde vêm os dados?

Kristen Gorman e a equipe da Palmer Station LTER coletaram os dados no arquipélago Palmer, na Antártica, entre 2007 e 2009. Usamos a tabela simplificada do projeto *palmerpenguins*, de Horst, Hill e Gorman. Os dados têm licença CC0. O dicionário local descreve as unidades, os valores ausentes e a procedência. [Dicionário dos dados](data/FONTE.txt) · [Palmer Penguins](https://allisonhorst.github.io/palmerpenguins/) · [Artigo original](https://doi.org/10.1371/journal.pone.0090081)

Apresentação adaptada do modelo Beamer do Laboratório de Sistemas de Computação da UFSM, de Andrea Charão. [Template LSC/UFSM](https://www.overleaf.com/latex/templates/beamer-template-lsc-ufsm/rnvcxtwqcrcm)
