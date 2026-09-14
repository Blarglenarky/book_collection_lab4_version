class Book < ApplicationRecord
    validates :title, presence: true
    validates :price, numericality: true, allow_nil: true
    #These caused error so I am testing without them
    #validates :author, allow_nil: true
    #validates :published_date, allow_nil: true
end
