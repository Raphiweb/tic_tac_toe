# frozen_string_literal: true

module DisplayText
  def intro_text
    puts "Let's play a game of Tic-Tac-Toe!"
    # sleep 1.5
    puts "Are you ready?"
    # sleep 1.5
  end

  def get_player_name_text(i)
    puts "What's the ##{i} player's name?"
  end

  def get_player_symbol_text
    puts "Which symbol do you choose?"
    # sleep 1
    puts "Enter either \"X\" or \"O\"!"
  end

  def assign_symbol_text(player, symbol)
    # sleep 1.5
    puts "#{player}, you have been assigned with the symbol \"#{symbol}\"!"
    # sleep 1.5
  end

  def welcome_players(player1, player2)
    puts "Welcome #{player1.name} and #{player2.name}!"
    # sleep 1.5
    puts "You both are in for a match of \"Tic-Tac-Toe\" against each other!"
    # sleep 2.5
  end

  def begin_game_text
    puts "Okay then..."
    # sleep 1.5
    puts "Let's begin!"
    # sleep 1.5
    puts "The computer is calculating the player who goes first..."
    # sleep 2
    puts "..."
    # sleep 1.5
  end

  def player_begins_text(i)
    puts "Player ##{i} begins!"
    # sleep 1.5
  end

  def instructions
    puts "Enter the number of the field you want your symbol to be in!"
    # sleep 1.5
  end

  def get_player_choice_text(player)
    puts "#{player} make your choice!"
  end

  def announce_winner(player)
    puts "#{player} won!"
    sleep 1
    puts "Congratulations!"
  end

  def announce_draw
    puts "A DRAW!"
  end

  def new_match_text
    puts "Do you want to start a new match? (Y/N)"
  end

  def goodbye_text
    puts "Thanks for playing!"
    sleep 1
    puts "Bye! :)"
    sleep 1
    puts "||||||||||||||||||||||||||||||||||||||||||||||||||||||||||"
  end

  def invalid_symbol_text
    puts "Please enter a different symbol."
  end

  def invalid_move_text
    puts "Sorry, that field is already taken!"
  end
end
