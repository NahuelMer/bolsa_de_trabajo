class Work < ApplicationRecord
    validates :work_name, presence: true
    validates :work_description, presence: true

    belongs_to :company

    has_many :candidate_works, dependent: :destroy
    has_many :candidates, through: :candidate_works
end
