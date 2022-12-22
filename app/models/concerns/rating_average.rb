module RatingAverage
    extend ActiveSupport::Concern
    
    def printnewthings
        "this works"
    end
    def average_rating
        result = ratings.reduce(0){|sum, rating| sum+rating.score}
        float_number = result/ratings.count.to_f.truncate(1)
        float_number.truncate(1)
    end
end