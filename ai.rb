require_relative "game_output"
require_relative "adjudicator"

class Ai

    # returns a random name from list
    def name
        names = ['Bob', 'Jenny', 'HorseyChick93', 'SpicyKing22', 'Albert', 'ThePun!sh3r', 'Kyle', 'PJ', 'David', 'Samantha', 'Charlie', 'Keegan', 'TheGodfather', 'Janice']
        return names[rand(names.length)]
    end
    
    # returns a random move, i.e. "2c"
    def get_move
        letters = ["a","b","c"]
        random_letter = letters[rand(3)]
        random_number = rand(1..3).to_s
        random_move = (random_number + random_letter).strip
        return "#{random_move}"
    end

    # Add current move to game
    def add_move(player, move, game)
        move_key = GameValidator.new.move_converter(move)
        game[move_key[0]][move_key[1]][move_key[2]] = player
    end


    def play_ai_turn(player_x, player_o, player_name, token, game_squares)

        x_tally = Adjudicator.new.tally_up(game_squares)[0][:x_tally]
        o_tally = Adjudicator.new.tally_up(game_squares)[1][:o_tally]

        # Print current game

        GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)
        puts "\nWaiting for #{player_name}..."

        # Delays AI's turn to look like it's thinking
        sleep rand(3..6)

        # Check move is valid and unique
        while true
            # get AI move
            move = Ai.new.get_move
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