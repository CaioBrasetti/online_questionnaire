class Evaluated < ApplicationRecord
  validates :name, :cpf, :email, :birth_date, presence: true
end
