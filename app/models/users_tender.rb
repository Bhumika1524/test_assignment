class UsersTender < ApplicationRecord
  belongs_to :user, inverse_of: :users_tenders
  belongs_to :tender, inverse_of: :users_tenders

  accepts_nested_attributes_for :tender
end
