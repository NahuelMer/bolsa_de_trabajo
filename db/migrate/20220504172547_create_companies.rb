class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :contact_email
      t.string :token

      t.timestamps
    end
  end
end
