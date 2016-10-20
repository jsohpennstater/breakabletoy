class CreateAssignments < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.belongs_to :user, null: false
      t.belongs_to :questionnaire, null: false

      t.timestamps null: false
    end
  end
end
