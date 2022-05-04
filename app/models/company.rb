class Company < ApplicationRecord
    validates :company_name, presence: true
    validates :contact_email, presence: true

    has_many :works, dependent: :destroy
end
