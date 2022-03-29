# frozen_string_literal: true

class GameBoard
  attr_accessor :squares

  ROWS = 3
  BOARDS = 3
  COLUMNS = 3

  def squares
    # These refactors return the correct array structure, but don't work.
    # Due to memory allocation, all nested arrays behave as if they're the same.

    # @squares = [[[' ']*COLUMNS]*ROWS]*BOARDS
    # @squares = Array.new 3, (Array.new 3, (Array.new 3, (' ')))

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
