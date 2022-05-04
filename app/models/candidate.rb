class Candidate < ApplicationRecord
    validates :candidate_name, presence: true
    validates :candidate_email, presence: true

    has_many :candidate_works, dependent: :destroy
    has_many :works, through: :candidate_works
end
