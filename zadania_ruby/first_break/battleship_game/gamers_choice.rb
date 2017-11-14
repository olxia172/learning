require "pry"

module GamersChoice
  def gamer_choice
    puts 'What is your choice?'
    choice = gets.chomp
    @choice_row, @choice_column = find_coordinate_index(choice)
    @choice_value = find_coordinate_value(choice)
    checking_gamer_choice(choice)
  end

  def find_coordinate_value(coordinate) # coordinate jest to "A1"
    row_index, column_index = find_coordinate_index(coordinate)
    @board.board.board[row_index][column_index]
  end

  def find_coordinate_index(coordinate) # coordinate jest to "A1"
    column_index = @board.board.columns.find_index(coordinate[0])

    if coordinate.size == 2
      positions = 1
    else
      positions = 1..2
    end
    row_index = @board.board.rows.find_index(coordinate[positions].to_i)
    [row_index, column_index]
  end

  def checking_gamer_choice(gamer_choice)
    choice_value = find_coordinate_value(gamer_choice)
    if missed?(choice_value)
      @board.board.board[@choice_row][@choice_column] = @field_options[:empty_selected_field]
      puts 'You missed. Try again!'
    elsif hit?(choice_value)
      @board.board.board[@choice_row][@choice_column] = @field_options[:filled_selected_field]
      puts 'Hit!'
      ship_sunk?(gamer_choice)
    else
      puts 'This field is already filled. Try again'
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

  def ship_sunk?(coordinate)
    index = 0
    ship = nil
    while index < @board.ships.size
      ship_coordinates = @board.ships[index].coordinates
      ship = @board.ships[index] if ship_coordinates.include?(coordinate)
      index += 1
    end

    if ship.class == OneDecker
      puts 'Hit and sunk!'
      ship.neighbours.each do |coord|
        row_index, column_index = find_coordinate_index(coord)
        @board.board.board[row_index][column_index] = @field_options[:empty_selected_field]
      end
    else
      #sprawdz wartosci na tablicy dla coordinates - jesli wszytskie sa 3 to trafiony zatopiony i fill neighbours
    end
  end
end
