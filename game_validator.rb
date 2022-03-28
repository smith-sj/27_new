class GameValidator

    #Every valid move
    VALID_MOVES = [
        "1a", "1b", "1c", 
        "2a", "2b", "2c", 
        "3a", "3b", "3c",
        "4a", "4b", "4c", 
        "5a", "5b", "5c", 
        "6a", "6b", "6c",
        "7a", "7b", "7c", 
        "8a", "8b", "8c", 
        "9a", "9b", "9c"]

    # A key for referencing every square
    GAME_KEY = [

        [["1a","1b","1c"],
        ["2a","2b","2c"],
        ["3a","3b","3c"]],
    
        [["4a","4b","4c"],
        ["5a","5b","5c"],
        ["6a","6b","6c"]],
    
        [["7a","7b","7c"],
        ["8a","8b","8c"],
        ["9a","9b","9c"]],
    ]

    # Checks if the move is included in valid moves
    def is_valid(move)
        if !VALID_MOVES.include? move
          return false
        end
        return true
    end

    #converts move from "1a" to [0,0] etc.
    def move_converter(move)
        # once converted the move_id will represent [board,row,column]
        move_id = [0,0,0]
        # cycle through the Game Key boards...
        GAME_KEY.each_with_index do |board,index|
            # if the current board being searched includes the move...
            if GAME_KEY[index].join.include? "#{move}"
                # ...then the first value of move_id [board] is the current iteration 
                move_id[0] = index
                # cycle through the rows in that board...
                GAME_KEY[index].each_with_index do |row,index2|
                    # if the current row includes the move...
                    if row.include? move
                        # ... the move_id's second value [row] is the current iteration
                        move_id[1] = index2
                        # cycle through the columns in that row...
                        GAME_KEY[index][index2].each_with_index do |column,index3|
                            # if the column is equal to the move
                            if column == move
                                # the move_id's third and final value [column] has been found
                                move_id[2] = index3
                            end
                        end
                    end
                end
            end
        end
        return move_id
    end

    # Checks if move has already been played
    def is_unique(move, game)
        move_key = move_converter(move)
        if game[move_key[0]][move_key[1]][move_key[2]] == " "
            return true
        else
            return false
        end
    end
end