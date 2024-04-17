# README

# Questionário psicológico online - Ruby on Rails

![Ruby Version](https://img.shields.io/badge/Ruby-3.1.2-red.svg)
![Rails Version](https://img.shields.io/badge/Rails-7.1.3.2-orange.svg)

Este projeto possibilita que psicólogos disponibilizem questionarios psicológicos para que avaliados possam realizá-los de forma online. Com dois tipos de acesso distintos - Psicólogo e Avaliado - o sistema oferece uma solução abrangente para a transição dos métodos tradicionais para uma plataforma digital moderna e acessível.
## Funcionalidades

* ### Para Psicólogos:
  * Cadastro de Avaliados: É possível cadastrar novos avaliados informando nome, CPF, email e data de nascimento.
  * Acesso aos Instrumentos Aplicados: Os psicólogos podem acessar a página de um avaliado e visualizar os questionáros que foram aplicados a esse avaliado.
  * Aplicação de Instrumentos: É possível aplicar um instrumento em um avaliado a partir de uma lista de instrumentos previamente cadastrados.
  * Envio de E-mail: Ao distribuir um instrumento, automaticamente é enviado um e-mail para o avaliado com o link para executar o instrumento.
  * Visualização de Resultados: Os psicólogos podem entrar no perfil de um avaliado e, ao clicar em um instrumento finalizado, acessar uma página com o resultado do instrumento.
  
* ###  Para Avaliados:
  * Acesso ao Instrumento: Ao clicar no link recebido via e-mail, é redirecionado para o sistema.
  * Preenchimento de Dados: Os avaliados devem preencher seus dados (nome, email, CPF e data de nascimento) para iniciar o instrumento.
  * Início do Instrumento: Ao preencher os dados e clicar em "próximo", o avaliado pode iniciar o instrumento psicológico.

  
## Requisitos

Certifique-se de ter as seguintes dependências instaladas:

- Ruby 3.1.2;
- Ruby on Rails 7.1.3.2.

## Instalação

1. Clone este repositório para o seu ambiente local:

```bash
git clone git@github.com:CaioBrasetti/online_questionnaire.git
cd online_questionnaire
```

2. Instale as gems necessárias:

```bash
bundle install
```

3. Crie o banco e rode o seeds:

```bash
rails db:create db:migrate db:seed
```

4. Inicie o servidor Rails:

```bash
rails server
```

## Uso
```

```
