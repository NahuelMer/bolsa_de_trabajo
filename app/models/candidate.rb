class Candidate < ApplicationRecord
    validates :candidate_name, presence: true
    validates :candidate_email, presence: true
    before_create :set_token

    has_many :candidate_works, dependent: :destroy
    has_many :works, through: :candidate_works

    def set_token
        self.token = SecureRandom.uuid
    end
end
