# README

# Questionário psicológico online - Ruby on Rails

![Ruby Version](https://img.shields.io/badge/Ruby-3.1.2-red.svg)
![Rails Version](https://img.shields.io/badge/Rails-7.1.3.2-orange.svg)
![Postgres](https://img.shields.io/badge/postgres-%23316192.svg?style=for-the-badge&logo=postgresql&logoColor=white)

Este projeto possibilita que psicólogos disponibilizem questionarios psicológicos para que avaliados possam realizá-los de forma online. Com dois tipos de acesso distintos - Psicólogo e Avaliado - o sistema oferece uma solução abrangente para a transição dos métodos tradicionais para uma plataforma digital moderna e acessível.
## Funcionalidades

* ### Para Psicólogos:
  * Cadastro de Avaliados: É possível cadastrar novos avaliados informando nome, CPF, email e data de nascimento.
  * Aplicação de Instrumentos: É possível aplicar um instrumento em um avaliado a partir de uma lista de instrumentos previamente cadastrados.
  * Acesso aos Instrumentos Aplicados: Os psicólogos podem acessar a página de um avaliado e visualizar os questionáros que foram aplicados a esse avaliado.
  * Envio de E-mail: Ao distribuir um instrumento, automaticamente é enviado um e-mail para o avaliado com o link para executar o instrumento.
  * Visualização de Resultados: Os psicólogos podem entrar no perfil de um avaliado e, ao clicar em um instrumento finalizado, acessar uma página com o resultado do instrumento, assim como as perguntas, respostas e a pontuação daquele teste.
  
* ###  Para Avaliados:
  * Acesso ao Instrumento: Ao clicar no link recebido via e-mail, é redirecionado para o sistema.
  * Preenchimento de Dados: Os avaliados devem preencher seus dados (nome, email, CPF e data de nascimento) para iniciar o instrumento.
  * Início do Instrumento: Ao preencher os dados e clicar em "próximo", o avaliado pode iniciar o instrumento psicológico.
  * Final do Instrumento: Ao enviar o instrumento será exibida uma mensagem de confirmação.

  
## Requisitos

Certifique-se de ter as seguintes dependências instaladas:

- Ruby 3.1.2;
- Ruby on Rails 7.1.3.2.
- PostgreSQL 14.11

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

### Para Psicólogos:

1. **Login no Sistema:**
   - Acesse `http://localhost:3000` e entre com suas credenciais de psicólogo para acessar o sistema.(credenciais de teste no arquivo seeds)

2. **Cadastrar Avaliado:**
   - Na tela inicial, clique em 'Cadastrar Avaliado'.
   - Preencha os campos de nome, CPF, email e data de nascimento para registrar um novo avaliado.

3. **Acesso aos Instrumentos Aplicados:**
   - No perfil de cada avaliado, você pode visualizar uma lista de todos os instrumentos que foram aplicados a ele.
   - Esta lista também mostrará o status de cada instrumento (por exemplo: pendente, enviado ou finalizado).

4. **Aplicação de Instrumentos:**
   - Na página de detalhes de um avaliado, selecione 'Aplicar Instrumento' para ver uma lista de instrumentos disponíveis.
   - Escolha um instrumento para aplicar e confirme. O sistema enviará automaticamente um e-mail ao avaliado com o link para realizar o instrumento.
   - Para realizar a simulação do envio do e-mail foi utilizado a gem 'letter_opener', para não ser necessario expor nenhuma senha de nenhum e-mail.

5. **Visualização de Resultados:**
   - Ainda no perfil do avaliado, clique em um instrumento finalizado para acessar a página de resultados e analisar as respostas.

### Para Avaliados:

1. **Recebimento de E-mail:**
   - Será exibido na sua tela um e-mail recebido com um link para acessar o instrumento psicológico que foi atribuído a você.

2. **Acesso ao Sistema:**
   - Clique no link recebido por e-mail. Você será redirecionado para a página de login do sistema.

3. **Preenchimento de Dados:**
   - Antes de iniciar o instrumento, preencha com seu nome, email, CPF e data de nascimento para realizar a validação.

4. **Início do Instrumento:**
   - Após preencher os dados e clicar em 'Próximo', você será direcionado para começar o instrumento.

### Notas Adicionais:
- Os avaliados não terão acesso aos resultados do instrumento. Os resultados estão disponíveis exclusivamente para o psicólogo.
