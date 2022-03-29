# frozen_string_literal: true

class GameValidator
  # Every valid move
  VALID_MOVES = %w[
    1a 1b 1c
    2a 2b 2c
    3a 3b 3c
    4a 4b 4c
    5a 5b 5c
    6a 6b 6c
    7a 7b 7c
    8a 8b 8c
    9a 9b 9c
  ].freeze

  # A key for referencing every square
  GAME_KEY = [

    [%w[1a 1b 1c],
     %w[2a 2b 2c],
     %w[3a 3b 3c]],

    [%w[4a 4b 4c],
     %w[5a 5b 5c],
     %w[6a 6b 6c]],

    [%w[7a 7b 7c],
     %w[8a 8b 8c],
     %w[9a 9b 9c]]
  ].freeze

  # Checks if the move is included in valid moves
  def is_valid(move)
    return false unless VALID_MOVES.include? move

    true
  end

  # converts move from "1a" to [0,0] etc.
  def move_converter(move)
    # once converted the move_id will represent [board,row,column]
    move_id = [0, 0, 0]
    # cycle through the Game Key boards...
    GAME_KEY.each_with_index do |_board, index|
      # if the current board being searched includes the move...
      next unless GAME_KEY[index].join.include? move.to_s

      # ...then the first value of move_id [board] is the current iteration
      move_id[0] = index
      # cycle through the rows in that board...
      GAME_KEY[index].each_with_index do |row, index2|
        # if the current row includes the move...
        next unless row.include? move

        # ... the move_id's second value [row] is the current iteration
        move_id[1] = index2
        # cycle through the columns in that row...
        GAME_KEY[index][index2].each_with_index do |column, index3|
          # if the column is equal to the move
          if column == move
            # the move_id's third and final value [column] has been found
            move_id[2] = index3
          end
        end
      end
    end
    move_id
  end

  # Checks if move has already been played
  def is_unique(move, game)
    move_key = move_converter(move)
    game[move_key[0]][move_key[1]][move_key[2]] == " "
  end

  def reorder_move(move)
    move.chars.sort.join
  end
end
