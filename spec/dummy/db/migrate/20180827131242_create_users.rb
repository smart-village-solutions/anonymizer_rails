class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :form_data

      t.timestamps
    end
  end
end
