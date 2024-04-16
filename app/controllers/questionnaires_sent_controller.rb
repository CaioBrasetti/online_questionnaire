class QuestionnairesSentController < ApplicationController
  before_action :find_questionnaires_sent

  def show
    calculate_points unless find_questionnaires_sent.points.positive?
    @questionnaire_sent = find_questionnaires_sent
  end

  private

  def calculate_points
    questionnaire_sent = find_questionnaires_sent
    questions = questionnaire_sent.questionnaire.questions
    questionnaire_sent_answers = questionnaire_sent.answers
    count_points = 0

    questionnaire_sent_answers.each do |answer|
      q = answer[0]
      a = answer[1]
      questions.each do |question|
        next unless q.downcase == question["pergunta"].downcase

        question["resposta"].each_with_index do |resp, index|
          next unless a == resp

          case index
          when 0
            count_points += 3
          when 1
            count_points += 2
          when 2
            count_points += 1
          when 3
            count_points += 0
          end
        end
      end
    end

    questionnaire_sent.update(points: count_points)
  end

  def find_questionnaires_sent
    QuestionnaireSent.find(params[:id])
  end
end
