class CandidateWork < ApplicationRecord
    enum state: {pendiente:0, interesa: 1, contratado: 2, rechazado: 3}

    belongs_to :work
    belongs_to :candidate
end
