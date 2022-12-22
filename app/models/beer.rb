class Beer < ApplicationRecord
    belongs_to :brewery
    has_many :ratings

    def average_rating
        sum = 0
        for rating in ratings do
            sum += rating.score
        end
        float_number = sum/ratings.count.to_f.truncate(1)
        float_number.truncate(1)
    end
end