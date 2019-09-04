class Song < ApplicationRecord
    validates :title, {presence: true, uniqueness:{scope: [:release_year, :artist_name]}}
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, numericality: { less_than_or_equal_to: 2019 }, if: :released_true?

    def released_true?
        released == true
    end
end
