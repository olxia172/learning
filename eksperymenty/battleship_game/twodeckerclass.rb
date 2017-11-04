class TwoDecker
  def initialize
    @coordinates = []
    @board_rows = (1..10).to_a
    @board_columns = ('A'..'J').to_a
  end

  attr_accessor :coordinates

  def coordinates
    next_coordinates
    puts @coordinates
  end

private

  def first_coordinate
    @first_column = @board_columns.sample
    @first_row = @board_rows.sample
    @first_coord = @first_column + @first_row.to_s
    @coordinates << @first_coord
    @first_coord
  end

  def next_coordinates
    first_coordinate
    directions
    x_direction = @x_directions.sample
    y_direction = @y_directions.sample

    if x_direction.zero?
      next_row = @first_row + y_direction
      next_coordinate = @first_column + next_row.to_s
      @coordinates << next_coordinate
    else
      index = @board_columns.find_index(@first_column)
      next_column = @board_columns[index + x_direction]
      next_coordinate = next_column + @first_row.to_s
      @coordinates << next_coordinate
    end
    @coordinates
  end

  def directions
    area1 = ['A1', 'A2', 'A3', 'B1', 'B2', 'B3', 'C1', 'C2', 'C3']
    area2 = ['D1', 'D2', 'D3', 'E1', 'E2', 'E3', 'F1', 'F2', 'F3', 'G1', 'G2', 'G3']
    area3 = ['H1', 'H2', 'H3', 'I1', 'I2', 'I3', 'J1', 'J2', 'J3']
    area4 = ['A4', 'A5', 'A6', 'A7', 'B4', 'B5', 'B6', 'B7', 'C4', 'C5', 'C6', 'C7']
    area5 = ['D4', 'D5', 'D6', 'D7', 'E4', 'E5', 'E6', 'E7', 'F4', 'F5', 'F6', 'F7', 'G4', 'G5', 'G6', 'G7']
    area6 = ['H4', 'H5', 'H6', 'H7', 'I4', 'I5', 'I6', 'I7', 'J4', 'J5', 'J6', 'J7']
    area7 = ['A8', 'A9', 'A10', 'B8', 'B9', 'B10', 'C8', 'C9', 'C10']
    area8 = ['D8', 'D9', 'D10', 'E8', 'E9', 'E10', 'F8', 'F9', 'F10', 'G8', 'G9', 'G10']
    area9 = ['H8', 'H9', 'H10', 'I8', 'I9', 'I10', 'J8', 'J9', 'J10']

    if area1.include?(@first_coord)
      @x_directions = [0, 1]
      @y_directions = [1]
    elsif area2.include?(@first_coord)
      @x_directions = [-1, 0, 1]
      @y_directions = [1]
    elsif area3.include?(@first_coord)
      @x_directions = [-1, 0]
      @y_directions = [1]
    elsif area4.include?(@first_coord)
      @x_directions = [0, 1]
      @y_directions = [-1, 1]
    elsif area5.include?(@first_coord)
      @x_directions = [-1, 0, 1]
      @y_directions = [-1, 1]
    elsif area6.include?(@first_coord)
      @x_directions = [-1, 0]
      @y_directions = [-1, 1]
    elsif area7.include?(@first_coord)
      @x_directions = [1, 0]
      @y_directions = [-1]
    elsif area8.include?(@first_coord)
      @x_directions = [-1, 0, 1]
      @y_directions = [-1]
    elsif area9.include?(@first_coord)
      @x_directions = [-1, 0]
      @y_directions = [-1]
    end
  end
end

statek = TwoDecker.new
statek.coordinates
