class Adjudicator

    attr_reader :tally

    def initialize
        @tally = [{x_tally: 0}, {o_tally: 0}]
    end

    # tally up score
    def tally_up(current_game)

        flats_points = 3
        pillars_points = 2
        stairs_points = 2
        diamond_stairs_points = 1

        # Groups of 3 squares on all boards (where flat combos can be made)
        flats = [
            # board 1
            (current_game[0][0][0] + current_game[0][0][1] + current_game[0][0][2]),
            (current_game[0][1][0] + current_game[0][1][1] + current_game[0][1][2]),
            (current_game[0][2][0] + current_game[0][2][1] + current_game[0][2][2]),
            (current_game[0][0][0] + current_game[0][1][0] + current_game[0][2][0]),
            (current_game[0][0][1] + current_game[0][1][1] + current_game[0][2][1]),
            (current_game[0][0][2] + current_game[0][1][2] + current_game[0][2][2]),
            (current_game[0][0][0] + current_game[0][1][1] + current_game[0][2][2]),
            (current_game[0][0][2] + current_game[0][1][1] + current_game[0][2][0]),
            # board 2
            (current_game[1][0][0] + current_game[1][0][1] + current_game[1][0][2]),
            (current_game[1][1][0] + current_game[1][1][1] + current_game[1][1][2]),
            (current_game[1][2][0] + current_game[1][2][1] + current_game[1][2][2]),
            (current_game[1][0][0] + current_game[1][1][0] + current_game[1][2][0]),
            (current_game[1][0][1] + current_game[1][1][1] + current_game[1][2][1]),
            (current_game[1][0][2] + current_game[1][1][2] + current_game[1][2][2]),
            (current_game[1][0][0] + current_game[1][1][1] + current_game[1][2][2]),
            (current_game[1][0][2] + current_game[1][1][1] + current_game[1][2][0]),
            # board 3
            (current_game[2][0][0] + current_game[2][0][1] + current_game[2][0][2]),
            (current_game[2][1][0] + current_game[2][1][1] + current_game[2][1][2]),
            (current_game[2][2][0] + current_game[2][2][1] + current_game[2][2][2]),
            (current_game[2][0][0] + current_game[2][1][0] + current_game[2][2][0]),
            (current_game[2][0][1] + current_game[2][1][1] + current_game[2][2][1]),
            (current_game[2][0][2] + current_game[2][1][2] + current_game[2][2][2]),
            (current_game[2][0][0] + current_game[2][1][1] + current_game[2][2][2]),
            (current_game[2][0][2] + current_game[2][1][1] + current_game[2][2][0]),]

        # Same for pillars combos
        pillars = [
            (current_game[0][0][0] + current_game[1][0][0] + current_game[2][0][0]),
            (current_game[0][0][1] + current_game[1][0][1] + current_game[2][0][1]),
            (current_game[0][0][2] + current_game[1][0][2] + current_game[2][0][2]),
            (current_game[0][1][0] + current_game[1][1][0] + current_game[2][1][0]),
            (current_game[0][1][1] + current_game[1][1][1] + current_game[2][1][1]),
            (current_game[0][1][2] + current_game[1][1][2] + current_game[2][1][2]),
            (current_game[0][2][0] + current_game[1][2][0] + current_game[2][2][0]),
            (current_game[0][2][1] + current_game[1][2][1] + current_game[2][2][1]),
            (current_game[0][2][2] + current_game[1][2][2] + current_game[2][2][2]),]

        # Same for stairs combos
        stairs = [
            (current_game[0][0][0] + current_game[1][0][1] + current_game[2][0][2]),
            (current_game[0][1][0] + current_game[1][1][1] + current_game[2][1][2]),
            (current_game[0][2][0] + current_game[1][2][1] + current_game[2][2][2]),
            (current_game[0][2][0] + current_game[1][1][0] + current_game[2][0][0]),
            (current_game[0][2][1] + current_game[1][1][1] + current_game[2][0][1]),
            (current_game[0][2][2] + current_game[1][1][2] + current_game[2][0][2]),
            (current_game[0][2][2] + current_game[1][2][1] + current_game[2][2][0]),
            (current_game[0][1][2] + current_game[1][1][1] + current_game[2][1][0]),
            (current_game[0][0][2] + current_game[1][0][1] + current_game[2][0][0]),
            (current_game[0][0][2] + current_game[1][1][2] + current_game[2][2][2]),
            (current_game[0][0][1] + current_game[1][1][1] + current_game[2][2][1]),
            (current_game[0][0][0] + current_game[1][1][0] + current_game[2][2][0]),]
            
        # Same again for diamond stairs combos
        diamond_stairs = [
            (current_game[0][0][0] + current_game[1][1][1] + current_game[2][2][2]),
            (current_game[0][2][0] + current_game[1][1][1] + current_game[2][0][2]),
            (current_game[0][2][2] + current_game[1][1][1] + current_game[2][0][0]),
            (current_game[0][0][2] + current_game[1][1][1] + current_game[2][2][0]),]
        
        # when joining above squares on boards, if they look like either of these strings
        # a combo has been made.
        combo_key = ["xxx","ooo"]
        
        # Cycle through potential combos and adjust scores as necessary
        flats.each do |combo|
            if combo == combo_key[0]
                @tally[0][:x_tally] += flats_points
            elsif combo == combo_key[1]
                @tally[1][:o_tally] += flats_points
            end
        end

        pillars.each do |combo|
            if combo == combo_key[0]
                @tally[0][:x_tally] += pillars_points
            elsif combo == combo_key[1]
                @tally[1][:o_tally] += pillars_points
            end
        end

        stairs.each do |combo|
            if combo == combo_key[0]
                @tally[0][:x_tally] += stairs_points
            elsif combo == combo_key[1]
                @tally[1][:o_tally] += stairs_points
            end
        end

        diamond_stairs.each do |combo|
            if combo == combo_key[0]
                @tally[0][:x_tally] += diamond_stairs_points
            elsif combo == combo_key[1]
                @tally[1][:o_tally] += diamond_stairs_points
            end
        end

        return @tally
    end

    def get_x_tally(game_squares)
        return tally_up(game_squares)[0][:x_tally]
    end
    def get_o_tally(game_squares)
        return tally_up(game_squares)[1][:o_tally]
    end

end