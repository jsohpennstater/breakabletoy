class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.belongs_to :question, null: false
      t.string :user_id, null: false
      t.integer :answer, null: false, default: nil

      t.timestamps
    end
  end
end
