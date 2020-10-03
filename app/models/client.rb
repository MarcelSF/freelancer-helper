class Client < ApplicationRecord
  belongs_to :user
  has_many :projects, dependent: :destroy
  has_many :payments, through: :projects
  has_one_attached :avatar

  validates :name, presence: true
end
