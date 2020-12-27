class Company < ApplicationRecord

  validates :company_name, presence: true
end
