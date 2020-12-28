class Invoice < ApplicationRecord
  belongs_to :user
  belongs_to :company
  belongs_to :bill
end
