class Bill < ApplicationRecord
  has_many :invoices, dependent: :destroy
end
