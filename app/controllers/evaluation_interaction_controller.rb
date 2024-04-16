class EvaluationInteractionController < ApplicationController
  before_action :find_questionnaires_sent, only: %i[show submit]

  def validate; end

  def check_patient
    @evaluated = Evaluated.find_by(name: params[:name], email: params[:email], cpf: params[:cpf], birth_date: params[:birth_date])

    if @evaluated
      redirect_to show_sent_evaluation_path(id: params[:evaluation_id], evaluated_id: @evaluated.id)
    else
      flash.now[:alert] = 'Dados inválidos, tente novamente.'
      render :validate_evaluated
    end
  end

  def show
    @questions = @questionnaires_sent.questionnaire
  end

  def submit
    @questionnaires_sent.update(answers: params[:responses], status: "Respondido")

    redirect_to confirmation_evaluation_interaction_path, notice: 'Respostas enviadas com sucesso!'
  end

  private

  def find_questionnaires_sent
    @questionnaires_sent = QuestionnaireSent.find_by(link_email: "oicaradeboi")
  end
end
