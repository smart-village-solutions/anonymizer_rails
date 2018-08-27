class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :form_data

      t.timestamps null: false
    end
  end
end
