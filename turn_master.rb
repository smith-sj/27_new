# frozen_string_literal: true

class TurnMaster
  # X is always first,
  def whos_turn(turn_count, player_x, player_o)
    turn_count.even? ? player_o.to_s : player_x.to_s
  end
end
