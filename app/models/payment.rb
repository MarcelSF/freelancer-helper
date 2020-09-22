class Payment < ApplicationRecord
  belongs_to :project
  validates :value, :date_of_payment, presence: true
end
