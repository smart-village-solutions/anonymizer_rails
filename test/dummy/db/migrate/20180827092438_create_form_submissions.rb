class CreateFormSubmissions < ActiveRecord::Migration
  def change
    create_table :form_submissions do |t|
      t.text :submitted_input

      t.timestamps null: false
    end
  end
end
