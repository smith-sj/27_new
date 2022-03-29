# frozen_string_literal: true

require_relative 'game_output'
require_relative 'game_input'
require_relative 'turn_master'
require_relative 'game_board'
require_relative 'adjudicator'
require_relative 'ai'
require_relative 'player'
require_relative 'game_modes'

def setup_clean_board
  @game_squares = GameBoard.new.squares
end

# -----MAIN LOOP-----

loop do
  GameOutput.new.start_screen
  game_mode = gets.strip
  system('cls') || system('clear')
  # Choose Game Mode Loop
  loop do
    # Player vs Player
    case game_mode
    when '1'
      setup_clean_board
      GameMode.new.p_v_p(@game_squares)
      GameInput.new.wait_for_enter('continue')
      break
    # Player vs AI
    when '2'
      setup_clean_board
      GameMode.new.p_v_ai(@game_squares)
      GameInput.new.wait_for_enter('continue')
      break
    # AI vs AI
    when '3'
      setup_clean_board
      GameMode.new.ai_v_ai(@game_squares)
      GameInput.wait_for_enter('continues')
      break
    # Read Rules
    when '4'
      GameOutput.new.how_to_play
      GameInput.new.wait_for_enter('go back')
      break
    # Invalid option
    else
      GameOutput.new.start_screen
      GameOutput.new.user_error(0)
      game_mode = gets.strip
      system('cls') || system('clear')
    end
  end
end
