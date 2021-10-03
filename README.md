
# Chat

![badge](https://img.shields.io/github/languages/top/willyoliv/bytebank)
<img alt="Flutter" src="https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white" />

Tabela de conteúdos
=================
<!--ts-->
   * [Sobre o projeto](#-sobre-o-projeto)
   * [Layout](#-layout)
   * [Como executar o projeto](#-como-executar-o-projeto)
     * [Pré-requisitos](#pré-requisitos)
     * [Rodando o Aplicativo](#-rodando-o-aplicativo)
   * [Tecnologias](#-tecnologias)
<!--te-->


## 💻 Sobre o projeto

Este projeto consiste em um pequeno chat. Ele possui integração com o Firebase para guardar e efetuar o login social com o Google. Além disto, ele utiliza a biblioteca Provider para gerência de estado.


---

## 🎨 Layout

Imagens das telas do aplicativo:

<p align="center"> 
  <img alt="Home" title="#Home" src="./assets/prints/screenshot1.jpg"  width="200px">
  <img alt="Home" title="#Home" src="./assets/prints/screenshot2.jpg"  width="200px">
  <img alt="Home" title="#Home" src="./assets/prints/screenshot3.jpg"  width="200px">
</p>





---

## 🚀 Como executar o projeto
Abaixo são apresentados os passos necessários para que o App funcione.

### Pré-requisitos

Antes de começar, você vai precisar ter instalado em sua máquina as seguintes ferramentas:
[Git](https://git-scm.com), [Flutter](https://flutter.dev/docs/get-started/install). 
Além disto é bom ter um editor para trabalhar com o código como [VSCode](https://code.visualstudio.com/).<br/>
O projeto utiliza o [Firebase](https://firebase.google.com/) para o processo de autenticação e para guarda os dados das mensagens. Deviso isto, é necessário a criação do projeto no Firebase, permitir autenticação e fazer as devidas alterações no projeto.<br/>
#### Abaixo os passos necessários para integrar com o Firebase:
<!--ts-->
   * [Criar o projeto](https://console.firebase.google.com/)
   * Permitir a autenticação com o Google
     * Acesse o menu Authetication e ative a autenticação com o Google     
   * Criar o banco de dados
     * A partir do menu Firestore Database, crie o banco de dados que será utilizado no projeto
   * Criar o app Android
     * Link para a documentação https://firebase.google.com/docs/android/setup?hl=pt
<!--te-->
OBS: Para utilizar a autenticação do Google com o Firebase é necessário gerar a chave SHA e adicionar no app android criado no Firebase. No link no tópico acima também explica como gerar e adicionar a chave.

#### 🎲 Rodando o Aplicativo

```bash

# Clone este repositório
$ git clone https://github.com/willyoliv/chat.git

# Acesse a pasta do projeto no terminal/cmd
$ cd chat

# Instale as dependências
$ flutter pub get

# Execute a aplicação 
$ flutter run


```

---

## 🛠 Tecnologias

As seguintes ferramentas foram usadas na construção do projeto:

- [Flutter](https://flutter.dev/)







