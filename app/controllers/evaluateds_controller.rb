class EvaluatedsController < ApplicationController
  def index
    @evaluateds = Evaluated.all
  end

  def show
    @evaluated = Evaluated.find(params[:id])
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

  private

  def evaluated_params
    params.require(:evaluated).permit(:name, :cpf, :email, :birth_date)
  end
end
