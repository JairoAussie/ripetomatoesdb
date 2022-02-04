class Review < ApplicationRecord
  validates :message, length: {minimum: 5}
  belongs_to :movie #1 to many relationship, 1 movie has many reviews
  belongs_to :user
end
