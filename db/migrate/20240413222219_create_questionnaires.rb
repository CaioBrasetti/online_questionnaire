class CreateQuestionnaires < ActiveRecord::Migration[7.1]
  def change
    create_table :questionnaires, id: :uuid do |t|
      t.json :questions
      t.string :title

      t.timestamps
    end
  end
end
