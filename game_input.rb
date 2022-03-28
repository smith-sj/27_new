# frozen_string_literal: true

require_relative 'game_output'

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

  # Wait for enter screen
  def wait_for_enter(go_where)
    GameOutput.new.prompt_enter(go_where)
    gets
  end
end
