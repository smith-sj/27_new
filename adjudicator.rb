# frozen_string_literal: true

class Adjudicator
  attr_reader :tally

  def initialize
    @tally = [{ x_tally: 0 }, { o_tally: 0 }]
  end

  # n1-n3 = starting numbers & i1-i3 = increments
  def incrementer(current_game,n1,n2,n3,i1,i2,i3)
    i = 0
    arr = []
    while i < 3
      arr << (current_game[n1 + (i1 * i)][n2 + (i2 * i)][n3 + (i3 * i)])
      i += 1
    end
    return arr.join()
  end

  # The 8 flat combos are identical on all boards, this tallies all 24 in one loop
  def flats_counter(current_game)
    i = 0
    arr = []
    while i < 3
      arr.push(incrementer(current_game,(0+i),0,0,0,0,1),
        incrementer(current_game,(0+i),0,0,0,1,0),
        incrementer(current_game,(0+i),0,0,0,1,1),
        incrementer(current_game,(0+i),0,1,0,1,0),
        incrementer(current_game,(0+i),0,2,0,1,-1),
        incrementer(current_game,(0+i),0,2,0,1,0),
        incrementer(current_game,(0+i),1,0,0,0,1),
        incrementer(current_game,(0+i),2,0,0,0,1))
      i += 1
    end
    return arr
  end

  # tally up score
  def tally_up(current_game)

    #Points Awarded for Flats, Pillars, Stairs, Diamond Stairs
    combo_points = [3,2,2,1]

    # Combinations of 3 squares, across 3 boards, where points can be scored
    combo_groups = [
      #FLATS
      flats_counter(current_game),
      #PILLARS
      [incrementer(current_game,0,0,0,1,0,0),
        incrementer(current_game,0,0,1,1,0,0),
        incrementer(current_game,0,0,2,1,0,0),
        incrementer(current_game,0,1,0,1,0,0),
        incrementer(current_game,0,1,1,1,0,0),
        incrementer(current_game,0,1,2,1,0,0),
        incrementer(current_game,0,2,0,1,0,0),
        incrementer(current_game,0,2,1,1,0,0),
        incrementer(current_game,0,2,2,1,0,0),],
      # STAIRS
      [incrementer(current_game,0,0,0,1,0,1),
        incrementer(current_game,0,1,0,1,0,1),
        incrementer(current_game,0,2,0,1,0,1),
        incrementer(current_game,0,2,0,1,-1,0),
        incrementer(current_game,0,2,1,1,-1,0),
        incrementer(current_game,0,2,2,1,-1,0),
        incrementer(current_game,0,2,2,1,0,-1),
        incrementer(current_game,0,1,2,1,0,-1),
        incrementer(current_game,0,0,2,1,0,-1),
        incrementer(current_game,0,0,2,1,1,0),
        incrementer(current_game,0,0,1,1,1,0),
        incrementer(current_game,0,0,0,1,1,0),],
      # DIAMOND STAIRS
      [incrementer(current_game,0,0,0,1,1,1),
        incrementer(current_game,0,2,0,1,-1,1),
        incrementer(current_game,0,2,2,1,-1,-1),
        incrementer(current_game,0,0,2,1,1,-1)]]

    # above moves will == 'xxx' or 'ooo' if combo has been made
    combo_key = %w[xxx ooo]

    # cycle through combos >> if match combo key >> adjust scores as necessary
    combo_groups.each_with_index do |group, index|
      group.each do |combo|
        if combo == combo_key[0]
          @tally[0][:x_tally] += combo_points[index]
        elsif combo == combo_key[1]
          @tally[1][:o_tally] += combo_points[index]
        end
      end
    end

    @tally
  end

  def tally_up_x(game_squares)
    tally_up(game_squares)[0][:x_tally]
  end

  def tally_up_o(game_squares)
    tally_up(game_squares)[1][:o_tally]
  end
end
