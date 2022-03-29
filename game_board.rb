# frozen_string_literal: true

class GameBoard
  attr_accessor :squares

  ROWS = 3
  BOARDS = 3
  COLUMNS = 3

  def squares
    @squares = Array.new(3) {Array.new(3) {Array.new(3){" "}}}
  end
end
