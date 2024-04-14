class CreatePsychologists < ActiveRecord::Migration[7.1]
  def change
    create_table :psychologists, id: :uuid do |t|
      t.string :name
      t.references :users, type: :uuid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
