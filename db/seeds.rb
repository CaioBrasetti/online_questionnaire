# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.create!(email: "admin@admin.com", password: "123123")

psychologist = Psychologist.create!(name: "Vetor Editora", user: user)

questionnaire = Questionnaire.create!( title: "Teste2",
  questions: [
    {
      pergunta: "Pergunta1",
      resposta: ["3", "2", "1", "0"]
    },
    {
      pergunta: "Pergunta2",
      resposta: ["3", "2", "1", "0"]
    },
    {
      pergunta: "Pergunta3",
      resposta: ["3", "2", "1", "0"]
    },
    {
      pergunta: "Pergunta4",
      resposta: ["3", "2", "1", "0"]
    },
    {
      pergunta: "Pergunta5",
      resposta: ["3", "2", "1", "0"]
    }
  ]
)

evaluated = Evaluated.create!(
  name: "Zézinho",
  cpf: 11122233344,
  email: "zezinho@teste.com",
  birth_date: "10/01/1995".to_date
)

QuestionnaireSent.create!(
  psychologist_id: psychologist.id,
  evaluated_id: evaluated.id,
  questionnaire_id: questionnaire.id,
  status: "Enviado",
  link_email: "linkaqui.com.br"
)
