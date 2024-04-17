# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

user = User.create!(email: "alfredovoldev@admin.com.br", password: "123123")

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

questionnaire2 = Questionnaire.create!( title: "Bem-Estar Emocional",
  questions: [
    {
      pergunta: "Como você se sente em relação ao seu trabalho/estudos atualmente?",
      resposta: ["Desinteressado", "Desmotivado", "Regular", "Motivado"]
    },
    {
      pergunta: "Como você lida com situações estressantes?",
      resposta: ["Paralisado", "Sobrecarregado", "Ansioso", "Adaptável"]
    },
    {
      pergunta: "Como você se sente em relação aos seus relacionamentos interpessoais?",
      resposta: ["Isolado", "Solitário", "Próximo de alguns", "Apoiado"]
    },
    {
      pergunta: "Como você descreveria sua autoestima?",
      resposta: ["Sem confiança", "Crítico", "Variável", "Confiança"]
    },
    {
      pergunta: "Como você lida com mudanças em sua vida?",
      resposta: ["Desorientado", "Ansioso", "Ajustável", "Adaptável"]
    }
  ]
)

evaluated = Evaluated.create!(
  name: "Caio Brasetti",
  cpf: 47699153812,
  email: "caiobrasetti@teste.com",
  birth_date: "15/06/1991".to_date
)
