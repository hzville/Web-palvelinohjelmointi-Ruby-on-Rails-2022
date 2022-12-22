class Beer < ApplicationRecord
    belongs_to :brewery
    has_many :ratings

    def average_rating
        result = ratings.reduce(0){|sum, rating| sum+rating.score}
        float_number = result/ratings.count.to_f.truncate(1)
        float_number.truncate(1)
    end

    def to_s
        name + ", " + brewery.name
    end
end