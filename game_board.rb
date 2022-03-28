class GameBoard

    attr_accessor :squares

    def initialize
        @squares = [
            # board 1            
            [[" "," "," "],
            [" "," "," "],
            [" "," "," "]],
            # board 2
            [[" "," "," "],
            [" "," "," "],
            [" "," "," "]],
            # baord 3
            [[" "," "," "],
            [" "," "," "],
            [" "," "," "]],
        ]
    end

end
