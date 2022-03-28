require_relative "game_output"
require_relative "game_validator"
require_relative "game_input"
require_relative "game_board"
require_relative "adjudicator"


class Player

    # Add current move to game
    def add_move(token, move, game)
        move_key = GameValidator.new.move_converter(move)
        game[move_key[0]][move_key[1]][move_key[2]] = token
    end

    # Play a turn
    def play_turn(player_x, player_o, player_name, token, game_squares)
        # set current score set as variable
        x_tally = Adjudicator.new.get_x_tally(game_squares)
        o_tally = Adjudicator.new.get_o_tally(game_squares)
        # Print current game board
        GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)

        # Starts a turn loop, in case move is invalid
        while true
            #get the move
            GameOutput.new.prompt_move(player_name)
            move = GameInput.new.get_move

            # if the move is valid and unique, add to game
            if GameValidator.new.is_valid(move) && GameValidator.new.is_unique(move, game_squares)
                add_move(token, move, game_squares)
                GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)
                break
            # if the move is not valid, restart loop
            elsif !GameValidator.new.is_valid(move)
                GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)
                puts "\nInvalid Move! Try again.\n"
            # if the move is not unique, check on next board
            elsif !GameValidator.new.is_unique(move, game_squares)
                # adds 3 to row (2a -> 5a) same spot on next board
                move[0..0]= ((move[0]).to_i + 3).to_s
                # if the new move is unique add it to second board
                if GameValidator.new.is_unique(move, game_squares)
                    add_move(token, move, game_squares)
                    GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)
                    break
                # if the move is not unique, check on final board
                elsif !GameValidator.new.is_unique(move, game_squares)
                    move[0..0]= ((move[0]).to_i + 3).to_s
                    # if move is unique add it to last board
                    if GameValidator.new.is_unique(move, game_squares)
                        add_move(token, move, game_squares)
                        GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)
                        break
                    # if move is not unique, then stack is full. restart turn loop
                    elsif !GameValidator.new.is_unique(move, game_squares)
                        GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)
                        puts "\nStack is full! Try again.\n"
                    end
                end
            end
        end
    end

end