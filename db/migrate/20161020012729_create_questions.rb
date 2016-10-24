class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.belongs_to :questionnaire
      t.string :content, null: false
      t.integer :answer, null: false, default: 0
      t.boolean :reverse, null: false, default: false

      t.timestamps
    end
  end
end
