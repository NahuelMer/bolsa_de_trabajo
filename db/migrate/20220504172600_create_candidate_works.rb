class CreateCandidateWorks < ActiveRecord::Migration[7.0]
  def change
    create_table :candidate_works, id: false do |t|
      t.belongs_to :candidate
      t.belongs_to :work
      t.integer :state, default: 0

      t.timestamps
    end
  end
end
