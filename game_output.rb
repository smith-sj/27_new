class GameOutput

    #prints the main game screen
    def print_game(player_x, player_o, to_print, x_tally, o_tally)
        system("cls") || system("clear")
        printed_rows = [
            ["|",to_print[2][0][0],"|",to_print[2][0][1],"|",to_print[2][0][2],"|"],
            ["|",to_print[2][1][0],"|",to_print[2][1][1],"|",to_print[2][1][2],"|"],
            ["|",to_print[2][2][0],"|",to_print[2][2][1],"|",to_print[2][2][2],"|"],

            ["|",to_print[1][0][0],"|",to_print[1][0][1],"|",to_print[1][0][2],"|"],
            ["|",to_print[1][1][0],"|",to_print[1][1][1],"|",to_print[1][1][2],"|"],
            ["|",to_print[1][2][0],"|",to_print[1][2][1],"|",to_print[1][2][2],"|"],

            ["|",to_print[0][0][0],"|",to_print[0][0][1],"|",to_print[0][0][2],"|"], 
            ["|",to_print[0][1][0],"|",to_print[0][1][1],"|",to_print[0][1][2],"|"], 
            ["|",to_print[0][2][0],"|",to_print[0][2][1],"|",to_print[0][2][2],"|"]
        ]
    
        puts "    a b c\n\n"
        puts "1  " + printed_rows[0].join
        puts "2  " + printed_rows[1].join
        puts "3  " + printed_rows[2].join
        puts "\n"
        puts "\n    a b c\n\n"
        puts "1  " + printed_rows[3].join
        puts "2  " + printed_rows[4].join
        puts "3  " + printed_rows[5].join
        puts "\n"
        puts "\n    a b c\n\n"
        puts "1  " + printed_rows[6].join
        puts "2  " + printed_rows[7].join
        puts "3  " + printed_rows[8].join
        puts "\n"

        puts "#{player_x}(x): #{x_tally}  |  #{player_o}(o): #{o_tally}"
    end

    # Prompts the player for move
    def prompt_move (player)
        puts "\n#{player}, where would you like to go?\n"
    end

    # Prints Start Screen
    def start_screen()
        system("cls") || system("clear")
        puts "\n"
        puts "                  ::::::::  :::::::::::  "
        puts "                 :+:    :+: :+:     :+:  "  
        puts "                      +:+         +:+    "    
        puts "                   +#+          +#+      "      
        puts "                +#+           +#+        "        
        puts "              #+#           #+#          "         
        puts "             ##########     ###          "
        puts "\n\n1. Player v Player
                \n2. Player v AI
                \n3. AI v AI
                \n4. How To Play"
        puts "\n\nType 1,2,3 or 4 > press ENTER"
    end

end