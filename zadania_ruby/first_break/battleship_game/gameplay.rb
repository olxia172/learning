require_relative './shipsonboard.rb'
require_relative './gamers_choice.rb'

# @board.ships[0].coordinates

require "pry"
class Gameplay < Board
  include GamersChoice

  attr_reader :board

  def initialize
    super
    @board = ShipsOnBoard.new
  end

  def gameplay
    board_for_gamer
    gamer_input = gamer_choice
    puts "\e[H\e[2J"
    checking_gamer_choice(gamer_input)
    # sprawdzenie czy wygrał
    # jeśli
  end

  private

  def board_for_gamer
    print frame
    print create_headline
    rows
  end

  def frame
    '+---' * 11 + "+\n"
  end

  def create_headline
    headline_names = @columns + [' ']
    headline_names.sort!
    headline = '| '
    index = 0
    while index < headline_names.size
      a = "#{headline_names[index]} "
      b = '| '
      headline << (a + b)
      index += 1
    end
    headline << "\n"
    headline
  end

  def rows
    row_index = 0
    while row_index < @rows.size
      print frame
      column_index = 0
      row = [@rows[row_index].to_s]
      while column_index < @columns.size
        value_on_board = @board.board.board[row_index][column_index]
        row << field_output(value_on_board)
        column_index += 1
      end
      print '|'
      row.each { |elem| print elem.center(3) + '|' }
      print "\n"
      row_index += 1
    end
    print frame
  end

  def field_output(value)
    if value == @field_options[:empty_unselected_field]
      @field = ' '
    elsif value == @field_options[:filled_unselected_field]
      @field = 'O'
    elsif value == @field_options[:empty_selected_field]
      @field = '*'
    elsif value == @field_options[:filled_selected_field]
      @field = 'X'
    end
    @field
  end

  #rysowanie planszy z ShipsOnBoard
  #użytkownik podaje nr pola
  #przetworzenie akcji z Board
  #czy koniec gry? Tak -> wygrałeś
  #jeśli nie, wróć do linii 2
end

gra = Gameplay.new

gra.gameplay
