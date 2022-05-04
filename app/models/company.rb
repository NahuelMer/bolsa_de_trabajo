class Company < ApplicationRecord

    before_create :set_token
    # before_validation :set_token, only:[:create]
    # SecureRandom ya controla el before_validation por lo que se puede hacer con un before_create y sin uniqueness
    # Si usara una alternativa a SecureRandom tendria que ser con before_validation 

    validates :company_name, presence: true
    validates :contact_email, presence: true
    validates :token, uniqueness: true

    has_many :works, dependent: :destroy

    def set_token
        self.token = SecureRandom.uuid
    end
end
