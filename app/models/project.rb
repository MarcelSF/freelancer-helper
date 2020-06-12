class Project < ApplicationRecord
  has_many :payments
  belongs_to :client
end
