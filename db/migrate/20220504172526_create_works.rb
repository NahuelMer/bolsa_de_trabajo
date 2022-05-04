class CreateWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :works do |t|
      t.string :work_name
      t.text :work_description
      t.integer :company_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
