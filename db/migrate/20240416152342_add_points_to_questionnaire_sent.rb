class AddPointsToQuestionnaireSent < ActiveRecord::Migration[7.1]
  def change
    add_column :questionnaire_sents, :points, :integer, default: 0, null: false
  end
end
