class CreateQuestionnaires < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires do |t|
      t.string :title, null: false
      t.string :physician_name, null: false
      t.string :clinic_address, null: false
      t.string :clinic_phone, null: false
      t.boolean :additional_information, null: false, default: false
      t.boolean :demographic_information, null: false, default: false
      t.string :status, null: false, default: "incomplete"

      t.timestamps
    end
  end
end
