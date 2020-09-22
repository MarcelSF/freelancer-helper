class Project < ApplicationRecord
  has_many :payments, dependent: :destroy
  belongs_to :client
  validates :name, presence: true
end
