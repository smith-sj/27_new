# frozen_string_literal: true

class GameInput
  # rearranges a2 => 2a etc.
  def reorder_move(move)
    move.chars.sort.join
  end

  # gets move from player
  def get_move
    move = gets.strip
    reorder_move(move)
  end
end
