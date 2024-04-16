class QuestionnaireSendMailer < ApplicationMailer
  default from: 'no-reply@seuapp.com'

  def send_questionnaire_link(evaluated, questionnaire)
    @evaluated = evaluated
    @questionnaire = questionnaire
    host = Rails.application.routes.default_url_options[:host] || "http://localhost:3000"
    @url = "#{host}/evaluations/#{@questionnaire.id}/validate"

    mail(to: @evaluated.email, subject: 'Complete sua avaliação')
  end
end
