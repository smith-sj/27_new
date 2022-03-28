class GameInput

    # rearranges a2 => 2a etc.
    def reorder_move(move)
        return move.chars.sort.join
    end

    # gets move from player
    def get_move
        move = gets.strip
        return reorder_move(move)
    end
    
end