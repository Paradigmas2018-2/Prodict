# Prodict

## Objetivo

O projeto Prodict é um teste vocacional para engenheiros, desenvolvido na linguagem prolog, onde ele pode te ajudar a descobrir qual é a engenharia mais próxima do seu perfil.
O teste consiste em diversas perguntas que podem te direcionar a algumas engenharias associadas à você. Porém, para respondê-las, você deve seguir as seguintes regras:

Para respostas positivas: ``` s. ```
Para respostas negativas: ``` n. ```
Para respostas ambíguas, onde tanto faz a resposta: ``` _. ```

## Como usar?

Para começar o teste, é necessário ter instalar a plataforma SWI Prolog:

```
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:swi-prolog/stable
sudo apt-get update
sudo apt-get install swi-prolog
```

Após isso, é só digitar no terminal, dentro da pasta do Prodict, o seguinte comando:

```
swipl prodict.pl
```

Depois disso, é só aproveitar! :)

## Referências

Base de dados foi construída, inicialmente, a partir do seguinte link:

> [Guia do Estudante - Conheça os 34 tipos de engenharia](https://guiadoestudante.abril.com.br/universidades/conheca-os-34-tipos-de-engenharia-que-existem/)
