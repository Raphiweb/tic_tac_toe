# frozen_string_literal: true

require_relative "player.rb"
require_relative "game.rb"
require_relative "board.rb"
require_relative "modules.rb"

include DisplayText

class Game

  def initialize
    intro_text
    @player1 = create_player1(1)
    @player2 = create_player2(2)
    welcome_players(@player1, @player2)
    begin_game_text
    @starting_player = who_starts
    @next_player = who_is_next_player
    @board = Board.new
    instructions
    turns
  end

  def create_player1(i)
    get_player_name_text(i)
    name = gets.chomp.upcase
    get_player_symbol_text
    symbol = gets.chomp.upcase
    
    def check_symbol(symbol)
      unless symbol == "X" || symbol == "O"
        invalid_symbol_text
        new_symbol = gets.chomp.upcase
        check_symbol(new_symbol)
      end
      if new_symbol == "X" || new_symbol == "O"
        new_symbol
      else symbol
      end
    end

    symbol = check_symbol(symbol)
    player = Player.new(name, symbol)
    player
  end

  def create_player2(i)
    get_player_name_text(i)
    name = gets.chomp.upcase
    symbol = ""
    if @player1.symbol == "X"
      symbol = "O"
    else symbol = "X"
    end
    assign_symbol_text(name, symbol)
    player = Player.new(name, symbol)
    player
  end

  def who_starts
    starting_number = rand(1..2)
    if starting_number == 1
      player_begins_text(1)
      @player1
    else 
      player_begins_text(2)
      @player2
    end
  end

  def who_is_next_player
    if @starting_player == @player1
      @player2
    else
      @player1
    end
  end

  def get_starting_players_choice
    get_player_choice_text(@starting_player.name)
    choice = gets.chomp.to_i
    symbol = @starting_player.symbol
    if @board.valid_move?(choice) == false
      invalid_move_text
      get_starting_players_choice
    else @board.update_board(choice, symbol)
    end
  end

  def get_next_players_choice
    get_player_choice_text(@next_player.name)
    choice = gets.chomp.to_i
    symbol = @next_player.symbol
    if @board.valid_move?(choice) == false
      invalid_move_text
      get_next_players_choice
    else @board.update_board(choice, symbol)
    end
  end

  def turns
    while win?(@next_player) == false
      get_starting_players_choice
    break if win?(@starting_player) == true
      get_next_players_choice
    end
    new_match
  end

  def win?(player)
    @board.check_for_win(player) == true ? true : false
  end

  def new_match
    new_match_text
    choice = gets.chomp.upcase
    if choice == "Y"
      begin_game_text
      @starting_player = who_starts
      @next_player = who_is_next_player
      @board.reset_board
      @board.display_board
      turns
    end
    if choice == "N"
      goodbye_text
    end
  end
end
