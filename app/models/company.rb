class Company < ApplicationRecord
  has_many :bills
  has_many :invoices
  validates :company_name, presence: true
end
