require_relative "./directions.rb"

class TwoDecker
  def initialize
    @coordinates = []
  end

  attr_accessor :coordinates

  def generate_coordinates
    next_coordinates
    puts @coordinates
  end

private

  def next_coordinates
    first_coordinate
    directions = Directions.new(@first_coord)
    x_direction = directions.x.sample
    y_direction = directions.y.sample

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
end
