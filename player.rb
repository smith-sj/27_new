# frozen_string_literal: true

require_relative 'game_output'
require_relative 'game_validator'
require_relative 'game_input'
require_relative 'game_board'
require_relative 'adjudicator'

class Player
  # Add current move to game
  def add_move(token, move, game)
    move_key = GameValidator.new.move_converter(move)
    game[move_key[0]][move_key[1]][move_key[2]] = token

  end

  # adds 3 to row (i.e. 2a -> 5a) = same spot on next board
  def move_up_board(move)
    move[0..0] = ((move[0]).to_i + 3).to_s
    move
  end

  # loop that moves the players current move up boards
  def move_up_loop(move, game_squares, token, player_x, player_o, x_tally, o_tally)
    i = 0
    new_move = move_up_board(move)
    while i < 2
      # if the new move is unique add it to second board
      if GameValidator.new.is_unique(new_move, game_squares)
        add_move(token, new_move, game_squares)
        GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)
        return true
        break
      # if the move is not unique, check on final board
      else
        move_up_board(new_move)
        i += 1
      end
    end
    # If the loop didn't return a value, then the stack is full, return false
    GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)
    GameOutput.new.user_error(2)
    false
  end

  # Play a turn
  def play_turn(player_x, player_o, player_name, token, game_squares)
    # set current score set as variable
    x_tally = Adjudicator.new.tally_up_x(game_squares)
    o_tally = Adjudicator.new.tally_up_o(game_squares)
    # Print current game board
    GameOutput.new.print_game(player_x, player_o, game_squares, x_tally, o_tally)
    # Starts a turn loop, in case move is invalid or not unique
    loop do
      # get the move
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
        GameOutput.new.user_error(1)
      # if the move is not unique, start loop that moves up boards
      elsif !GameValidator.new.is_unique(move, game_squares)
        move_up_loop(move, game_squares, token, player_x, player_o, x_tally, o_tally) ? break : nil
      end
    end
  end
end
