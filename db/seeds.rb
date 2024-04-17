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

questionnaire = Questionnaire.create!( title: "Satisfação na Vida",
  questions: [
    {
      pergunta: "Em que medida você se sente insatisfeito com sua vida atualmente?",
      resposta: ["Muito insatisfeito", "Insatisfeito", "Neutro", "Satisfeito"]
    },
    {
      pergunta: "Com que frequência você sente que não consegue lidar com o estresse cotidiano?",
      resposta: ["Sempre", "Na maioria das vezes", "Às vezes", "Raramente"]
    },
    {
      pergunta: "Quão desconfortável você se sente ao expressar suas emoções com pessoas próximas?",
      resposta: ["Muito desconfortável", "Desconfortável", "Um pouco confortável", "Muito confortável"]
    },
    {
      pergunta: "Você acredita que não consegue equilibrar adequadamente seu tempo entre trabalho e lazer?",
      resposta: ["Sim, sempre", "Na maioria das vezes", "Às vezes", "Raramente"]
    },
    {
      pergunta: "Qual é sua opinião sobre a ineficácia da terapia psicológica para resolver problemas emocionais?",
      resposta: ["Muito ineficaz", "Ineficaz", "Neutra", "Eficaz"]
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
  status: "Enviado"
)
