require_relative "./shipsonboard.rb"
require_relative "./board.rb"

require "pp"
class Gameplay < Board
  def initialize
    @board = ShipsOnBoard.new
    @columns = ('A'..'J').to_a
    @rows = (1..10).to_a
    @field_options = {
      empty_unselected_field: 0,
      empty_selected_field: 1,
      filled_unselected_field: 2,
      filled_selected_field: 3
    }
  end

  attr_reader :board

  def gameplay
    board_for_gamer
    pp @board
    gamer_choice
  #  checking_gamer_choice(@choice_value)
    # sprawdzenie wyniku
    # wprowadzenie zmian do board
    # narysowanie zmienionej board
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
      @field = '.'
    elsif value == @field_options[:filled_selected_field]
      @field = 'X'
    end
    @field
  end

  def gamer_choice
    puts "What is your choice?"
    choice = gets
    @choice_row, @choice_column = find_coordinate_index(choice)
    @choice_value = find_coordinate_value(choice)
    checking_gamer_choice(@choice_value)
  end

  def find_coordinate_value(coordinate) # coordinate jest to "A1"
    row_index, column_index = find_coordinate_index(coordinate)
    @board.board.board[row_index][column_index]
  end

  def find_coordinate_index(coordinate) # coordinate jest to "A1"
    column_index = @columns.find_index(coordinate[0])
    row_index = @rows.find_index(coordinate[1].to_i)
    [row_index, column_index]
  end

  def checking_gamer_choice(choice_value)
    if missed?(choice_value)
      @board.board.board[@choice_row][@choice_column] = @field_options[:empty_selected_field]
      puts 'You missed'
    elsif hit?(choice_value)
      @board.board.board[@choice_row][@choice_column] = @field_options[:filled_selected_field]
      puts 'Hit!'
      # metoda na sprawdzenie trafienia
    else
      puts "You have already chosen this field. Try again"
    end
    gameplay
  end

  def missed?(value)
    if value == @field_options[:empty_unselected_field]
      true
    end
  end

  def hit?(value)
    if value == @field_options[:filled_unselected_field]
      true
    end
  end

  #rysowanie planszy z ShipsOnBoard
  #użytkownik podaje nr pola
  #przetworzenie akcji z Board
  #czy koniec gry? Tak -> wygrałeś
  #jeśli nie, wróć do linii 2
end

gra = Gameplay.new

gra.gameplay
