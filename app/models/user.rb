class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :clients
  has_many :projects, through: :clients

  def my_payments
    Payment.joins(project: {client: :user}).where(users: {id: self.id})
  end
end
