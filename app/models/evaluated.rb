class Evaluated < ApplicationRecord
  validates :name, :cpf, :email, :birth_date, presence: true
  validates :email, presence: true, uniqueness: true, format: {
    with: URI::MailTo::EMAIL_REGEXP, message: "formato de email inválido"
  }
  validate :valid_cpf

  include PgSearch::Model
  pg_search_scope :search_by_name_and_cpf,
  against: [ :name, :cpf ],
  using: {
    tsearch: { prefix: true }
  }

  def valid_cpf
    return if cpf.blank?

    errors.add(:cpf, "O CPF não é válido") unless CPF.valid?(cpf)
  end
end
