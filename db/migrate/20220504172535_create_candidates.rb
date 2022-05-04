class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :candidate_name
      t.string :candidate_email

      t.timestamps
    end
  end
end
