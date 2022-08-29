# frozen_string_literal: true

require_relative "modules.rb"

class Board
include DisplayText

  WIN_COMB = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8],[0, 4, 8], [2, 4, 6]]

  def initialize
    @cross = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @row_seperator = "---+---+---"
    @col_seperator = " | "
    display_board
  end

  def display_board
    puts "          " + @cross.slice(0, 3).join(@col_seperator) + "         "
    puts "          " + @row_seperator
    puts "          " + @cross.slice(3, 3).join(@col_seperator) + "         "
    puts "          " + @row_seperator
    puts "          " + @cross.slice(6, 3).join(@col_seperator) + "         "
  end

  def update_board(choice, symbol)
    choice_index = choice - 1
    @cross[choice_index] = symbol
    display_board
  end

  def check_for_win(player)
    win = false
    WIN_COMB.each do |comb|
      if @cross.values_at(*comb) === %w(X X X)
        announce_winner(player.name)
        win = true
        return true
      end
      if @cross.values_at(*comb) === %w(O O O)
        announce_winner(player.name)
        win = true
        return true
      end
    end
    if win == false
      draw?
    end
  end

  def draw?
    if @cross.all? { |num| num.is_a? String }
      announce_draw
      true
    end
  end

  def reset_board
    @cross = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def valid_move?(choice)
    if @cross[choice - 1].is_a? Integer
      true
    else false
    end
  end

end
