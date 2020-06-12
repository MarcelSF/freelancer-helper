class Project < ApplicationRecord
  has_many :payments, dependent: :destroy
  belongs_to :client
end
