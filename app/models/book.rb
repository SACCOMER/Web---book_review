class Book < ApplicationRecord
  has_many :reviews
  has_many :categorizations
  has_many :categories, through: :categorizations
end
