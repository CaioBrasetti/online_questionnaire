class PsychologistsController < ApplicationController
  def index
    @psychologist = Psychologist.find_by(users_id: current_user.id)
  end
end
