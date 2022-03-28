require_relative "game_output"
require_relative "game_input"
require_relative "turn_master"
require_relative "game_board"
require_relative "adjudicator"
require_relative "ai"
require_relative "player"
require_relative "game_modes"

# -----MAIN LOOP-----

while true

    GameOutput.new.start_screen()
    game_mode =  gets.strip
    system("cls") || system("clear")

    # Choose Game Mode Loop
    while true
        
        # Player vs Player

        if game_mode == "1"
            game_board = GameBoard.new
            game_squares = game_board.squares
            GameMode.new.p_v_p(game_squares)
            puts "Press ENTER to continue"
            gets
            break

        # Player vs AI

        elsif game_mode == "2"
            game_board = GameBoard.new
            game_squares = game_board.squares
            GameMode.new.p_v_ai(game_squares)
            puts "Press ENTER to continue"
            gets
            break
            
        # AI vs AI

        elsif game_mode == "3"
            game_board = GameBoard.new
            game_squares = game_board.squares
            GameMode.new.ai_v_ai(game_squares)
            puts "Press ENTER to continue"
            gets
            break

        # Read Rules

        elsif game_mode == "4"
            input = File.read("./rules.txt")      
            puts input
            puts "↑ SCROLL TO TOP FOR RULES ↑\n\n"
            puts "Press ENTER back to menu"
            gets
            break

        # Invalid option

        else
            GameOutput.new.start_screen()
            puts "\nPlease type '1', '2' or '3' and press ENTER"
            game_mode =  gets.strip
            system("cls") || system("clear")
        end
    end
end

