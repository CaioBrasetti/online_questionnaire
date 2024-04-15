class Evaluated < ApplicationRecord
  validates :name, :cpf, :email, :birth_date, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_and_cpf,
  against: [ :name, :cpf ],
  using: {
    tsearch: { prefix: true }
  }
end
