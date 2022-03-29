# frozen_string_literal: true

class GameBoard
  attr_accessor :squares

  ROWS = 3
  BOARDS = 3
  COLUMNS = 3

  def squares
    # @squares = [[[' ']*COLUMNS]*ROWS]*COLUMNS

    @squares = [
    # board 1
    [[' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']],
    # board 2
    [[' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']],
    # baord 3
    [[' ', ' ', ' '],
      [' ', ' ', ' '],
      [' ', ' ', ' ']]
  ]
  end


end
