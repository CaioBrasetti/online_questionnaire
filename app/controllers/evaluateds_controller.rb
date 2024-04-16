class EvaluatedsController < ApplicationController
  before_action :find_evaluated, only: %i[show edit update]

  def index
    @evaluateds = Evaluated.all
  end

  def show
    @questionnaires_sent = QuestionnaireSent.where(evaluated_id: @evaluated.id)
    @questionnaires = Questionnaire.all
  end

  def create_questionnaire_sent
    psychologist = Psychologist.find_by(users_id: current_user[:id])

    questionnaires_sent = QuestionnaireSent.create!(
      psychologist_id: psychologist.id,
      evaluated_id: params[:evaluated_id],
      questionnaire_id: params[:questionnaire_id],
      status: "Pendente"
    )

    send_mail(questionnaires_sent)
  end

  def send_mail(questionnaires_sent)
    evaluated = Evaluated.find(params[:evaluated_id])
    questionnaire = Questionnaire.find(params[:questionnaire_id])

    QuestionnaireSendMailer.send_questionnaire_link(evaluated, questionnaire, questionnaires_sent).deliver_now

    redirect_to evaluateds_path, notice: 'Email enviado com sucesso!'
  end

  def new
    @evaluated = Evaluated.new
  end

  def create
    @evaluated = Evaluated.new(evaluated_params)
    evaluated_params[:psychologist_id] = current_user.id

    if @evaluated.save
      redirect_to evaluated_path(@evaluated.id),
                  notice: 'Avaliado criado com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @evaluated.update!(evaluated_params)
      redirect_to evaluated_path(@evaluated), notice: "Avaliado atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def evaluated_params
    params.require(:evaluated).permit(:name, :cpf, :email, :birth_date)
  end

  def find_evaluated
    @evaluated = Evaluated.find(params[:id])
  end
end
