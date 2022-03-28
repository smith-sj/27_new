# frozen_string_literal: true

require_relative 'game_output'
require_relative 'adjudicator'
require_relative 'turn_master'

class GameMode
  #----- PvP MODE -----

  def p_v_p(game_squares)
    puts "Player x, enter name: \n\n"
    player_x_name = gets.strip
    system('cls') || system('clear')
    puts "Player o, enter name: \n\n"
    player_o_name = gets.strip
    system('cls') || system('clear')

    turn_count = 0

    loop do
      turn_count += 1
      player_name = TurnMaster.new.whos_turn(turn_count, player_x_name, player_o_name)
      token = player_name == player_x_name.to_s ? 'x' : 'o'

      Player.new.play_turn(player_x_name, player_o_name, player_name, token, game_squares)
      next unless turn_count >= 27

      x_tally = Adjudicator.new.tally_up_x(game_squares)
      o_tally = Adjudicator.new.tally_up_o(game_squares)
      GameOutput.new.print_game(player_x_name, player_o_name, game_squares, x_tally, o_tally)
      x_final_tally = Adjudicator.new.tally_up_x(game_squares).to_i
      o_final_tally = Adjudicator.new.tally_up_o(game_squares).to_i
      if x_final_tally > o_final_tally
        puts "\nGame over! #{player_x_name} wins!"
      elsif x_final_tally < o_final_tally
        puts "\nGame over! #{player_o_name} wins!"
      else
        puts "\nGame over! It's a draw."
      end
      break
    end
  end

  #----- PvAI MODE -----

  def p_v_ai(game_squares)
    puts "Player x, enter name: \n\n"
    player_x_name = gets.strip
    player_o_name = Ai.new.name

    turn_count = 0

    loop do
      turn_count += 1
      player_name = TurnMaster.new.whos_turn(turn_count, player_x_name, player_o_name)
      token = player_name == player_x_name.to_s ? 'x' : 'o'
      if player_name == player_o_name
        Ai.new.play_ai_turn(player_x_name, player_o_name, player_name, token, game_squares)
      else
        Player.new.play_turn(player_x_name, player_o_name, player_name, token, game_squares)
      end
      next unless turn_count >= 27

      x_tally = Adjudicator.new.tally_up_x(game_squares)
      o_tally = Adjudicator.new.tally_up_o(game_squares)
      GameOutput.new.print_game(player_x_name, player_o_name, game_squares, x_tally, o_tally)
      x_final_tally = Adjudicator.new.tally_up_x(game_squares).to_i
      o_final_tally = Adjudicator.new.tally_up_o(game_squares).to_i
      if x_final_tally > o_final_tally
        puts "\nGame over! #{player_x_name} wins!"
      elsif x_final_tally < o_final_tally
        puts "\nGame over! #{player_o_name} wins!"
      else
        puts "\nGame over! It's a draw."
      end
      break
    end
  end

  #----- AIvAI -----

  def ai_v_ai(game_squares)
    player_x_name = Ai.new.name
    player_o_name = Ai.new.name
    player_o_name == player_x_name ? player_o_name = Ai.new.name : nil

    turn_count = 0

    loop do
      turn_count += 1
      player_name = TurnMaster.new.whos_turn(turn_count, player_x_name, player_o_name)
      token = player_name == player_x_name.to_s ? 'x' : 'o'
      Ai.new.play_ai_turn(player_x_name, player_o_name, player_name, token, game_squares)
      if player_name == player_o_name
      end
      next unless turn_count >= 27

      x_tally = Adjudicator.new.tally_up_x(game_squares)
      o_tally = Adjudicator.new.tally_up_o(game_squares)
      GameOutput.new.print_game(player_x_name, player_o_name, game_squares, x_tally, o_tally)
      x_final_tally = Adjudicator.new.tally_up_x(game_squares).to_i
      o_final_tally = Adjudicator.new.tally_up_o(game_squares).to_i
      if x_final_tally > o_final_tally
        puts "\nGame over! #{player_x_name} wins!"
      elsif x_final_tally < o_final_tally
        puts "\nGame over! #{player_o_name} wins!"
      else
        puts "\nGame over! It's a draw."
      end
      break
    end
  end
end
