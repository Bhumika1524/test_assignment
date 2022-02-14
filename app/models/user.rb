class User < ApplicationRecord
  has_many :users_tenders, inverse_of: :user
  has_many :tenders, through: :users_tenders

  accepts_nested_attributes_for :users_tenders
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
