class Movie < ApplicationRecord
    validates :title, presence: true
    validates :genre, presence: true
    has_many :reviews #1 to many relationship, 1 movie has many reviews
    #Perform model was the relationship and now is two '1 to many' relationships
    #one actor many performs
    #one movie many performs
    has_many :performs
    #In order to connect movies and actors we have to do it through performs
    has_many :actors, through: :performs
    def count_reviews 
        return self.reviews.count
    end
end
