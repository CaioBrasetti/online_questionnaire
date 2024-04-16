class CreateQuestionnaireSents < ActiveRecord::Migration[7.1]
  def change
    create_table :questionnaire_sents, id: :uuid do |t|
      t.references :psychologist, type: :uuid, null: false, foreign_key: true
      t.references :evaluated, type: :uuid, null: false, foreign_key: true
      t.references :questionnaire, type: :uuid, null: false, foreign_key: true
      t.string :status
      t.string :link_email
      t.json :answers

      t.timestamps
    end
  end
end
