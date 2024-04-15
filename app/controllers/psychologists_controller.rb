class PsychologistsController < ApplicationController
  def index
    @psychologist = Psychologist.find_by(users_id: current_user.id)

    if params[:query] && params[:query].present?
      @evaluateds = Evaluated.search_by_name_and_cpf(params[:query])
    else
      @evaluateds = Evaluated.all.order(name: :asc)
    end
  end
end
