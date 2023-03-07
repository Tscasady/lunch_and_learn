class User < ApplicationRecord
  validates :name, presence: true
  validates_uniqueness_of :email
  validates_uniqueness_of :api_key
end
