class Bill < ApplicationRecord
  belongs_to :company
  has_many :invoices
end
