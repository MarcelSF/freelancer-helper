class Client < ApplicationRecord
  belongs_to :user
  has_many :projects, dependent: :destroy
  has_many :payments, through: :projects
end
