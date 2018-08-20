class CreateFormSubmissions < ActiveRecord::Migration[5.2]
  def change
    create_table :form_submissions do |t|
      t.text :submitted_input

      t.timestamps
    end
  end
end
