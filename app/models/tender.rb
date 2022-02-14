class Tender < ApplicationRecord
  has_many :users_tenders, inverse_of: :tender
  has_many :users, through: :users_tenders
  accepts_nested_attributes_for :users_tenders
end
