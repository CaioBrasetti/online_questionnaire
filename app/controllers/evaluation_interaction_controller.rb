class EvaluationInteractionController < ApplicationController
  skip_before_action :authenticate_user!

  def validate; end

  def check_evaluated
    @evaluated = Evaluated.find_by(name: params[:name], email: params[:email], cpf: params[:cpf], birth_date: params[:birth_date].to_date)
    url = request.original_url
    updated_url = url.sub('check_evaluated', 'validate')

    if @evaluated
      @questionnaires_sent = QuestionnaireSent.find_by(evaluated_id: @evaluated.id, link_email: updated_url)
      session[:questionnaires_sent] = @questionnaires_sent.attributes

      redirect_to evaluation_interaction_path(id: @questionnaires_sent.questionnaire_id)
    else
      flash[:notice] = 'Dados inválidos, tente novamente.'
      render :validate, status: :unprocessable_entity
    end
  end

  def show
    @questions = Questionnaire.find(params[:id])
  end

  def submit
    @questionnaires_sent = QuestionnaireSent.find(session[:questionnaires_sent]["id"])

    session.delete(:questionnaires_sent)

    @questionnaires_sent.update(answers: params[:responses], status: "Finalizado")

    redirect_to confirmation_evaluation_interaction_path, notice: 'Respostas enviadas com sucesso!'
  end
end
