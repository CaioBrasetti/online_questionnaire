class QuestionnaireSendMailer < ApplicationMailer
  after_action :set_sent_status, only: [:send_questionnaire_link]
  default from: 'no-reply@seuapp.com'

  def send_questionnaire_link(evaluated, questionnaire, questionnaires_sent)
    @evaluated = evaluated
    @questionnaire = questionnaire
    @questionnaires_sent = questionnaires_sent
    host = Rails.application.routes.default_url_options[:host] || "http://localhost:3000"
    @url = "#{host}/evaluation_interaction/#{@questionnaires_sent.id}/validate"

    mail(to: @evaluated.email, subject: 'Complete sua avaliação')
  end

  private

  def set_sent_status
    @questionnaires_sent.update(status: "Enviado", link_email: @url) if mail.perform_deliveries
  end
end
