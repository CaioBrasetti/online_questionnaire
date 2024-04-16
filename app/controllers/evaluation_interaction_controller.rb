class EvaluationInteractionController < ApplicationController
  def validate; end

  def check_patient
    @evaluated = Evaluated.find_by(name: params[:name], email: params[:email], cpf: params[:cpf], birth_date: params[:birth_date].to_date)
    url = request.original_url
    updated_url = url.sub('check_patient', 'validate')

    if @evaluated
      @questionnaires_sent = QuestionnaireSent.find_by(evaluated_id: @evaluated.id, link_email: updated_url)
      session[:questionnaires_sent] = @questionnaires_sent.attributes

      redirect_to evaluation_interaction_path(id: @questionnaires_sent.questionnaire_id)
    else
      flash.now[:alert] = 'Dados inválidos, tente novamente.'
      render :validate_patient_evaluation_interaction
    end
  end

  def show
    @questions = Questionnaire.find(params[:id])
  end

  def submit
    @questionnaires_sent = QuestionnaireSent.find(session[:questionnaires_sent]["id"])

    session.delete(:questionnaires_sent)

    @questionnaires_sent.update(answers: params[:responses], status: "Respondido")

    redirect_to confirmation_evaluation_interaction_path, notice: 'Respostas enviadas com sucesso!'
  end
end
