class Bank < ApplicationRecord
  store :bank_info, accessors: %i[account_number account_digit bank_number iban swift_code nipc], coder: JSON

  enum document_type: {
    cpf: 1,
    cnpj: 2,
    passport: 3
  }

  enum bank_type: {
    brasil: 1,
    portugal: 2
  }

  enum account_type: {
    corrente: 1,
    poupanca: 2
  }

  validates :document_type, :document_number, :bank_type, :account_type, presence: true

  validates :bank_number, :account_number, :account_digit, presence: true, if: :brasil?
  validates :iban, :swift_code, :nipc, presence: true, if: :portugal?
end
