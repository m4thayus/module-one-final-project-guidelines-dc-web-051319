class Board < ActiveRecord::Base
    has_many :squares
    def fill_board
        ids = Restaurant.ids.sample(24)
        p ids 
        n = 1 
        for i in 0..4 do
            for j in 0..4 do
                if i == 2 && j == 2
                    "free"
                else
                    id = ids.pop
                    Square.new(placement: n, restaurant_id: id, board_id: self.id).save
                end
                n += 1
            end
        end
    end

    def print_board(user)
        array_visits = user.visits
        array_visits.each do |visit|
            visit.restuarant_id 
            end 
        board = <<-END
        |----|----|----|----|----|
        | 01 | 02 | 03 | 04 | 05 |
        |----|----|----|----|----|
        | 06 | 07 | 08 | 09 | 10 |
        |----|----|----|----|----|
        | 11 | 12 | fr | 14 | 15 |
        |----|----|----|----|----|
        | 16 | 17 | 18 | 19 | 20 |
        |----|----|----|----|----|
        | 21 | 22 | 23 | 24 | 25 |
        |----|----|----|----|----|
        END
        board
    end

end
