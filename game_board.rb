# frozen_string_literal: true

class GameBoard
  attr_accessor :squares

  def squares
    @squares = Array.new(3) { Array.new(3) { Array.new(3) { ' ' } } }
  end
end
