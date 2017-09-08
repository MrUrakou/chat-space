class Group < ApplicationRecord
  has_many :users, through: :members
  has_many :messages
  accepts_nested_attributes_for :group_users
end
