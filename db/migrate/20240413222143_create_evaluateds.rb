class CreateEvaluateds < ActiveRecord::Migration[7.1]
  def change
    create_table :evaluateds, id: :uuid do |t|
      t.string :name
      t.string :cpf
      t.string :email
      t.date :birth_date

      t.timestamps
    end
  end
end
