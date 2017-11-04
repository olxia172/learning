require "pry"

@columns = ('A'..'J').to_a
@rows = (1..10).to_a
@field_options = {
  empty_unselected_field: 0,
  empty_selected_field: 1,
  filled_unselected_field: 2,
  filled_selected_field: 3
}

ship_coordinates = ["A1", "A2", "A3"]

@board = Array.new(10) { Array.new(10, @field_options[:empty_unselected_field])}

def find_coordinate_value(coordinate) # coordinate jest to "A1"
  @column_index = @columns.find_index(coordinate[0])
  @row_index = @rows.find_index(coordinate[1].to_i)
  @value_on_board = @board[@row_index][@column_index]
  @value_on_board
end

def are_fields_empty?(coordinates)
  fields = []
binding.pry
  coordinates.each { |coord| fields << find_coordinate_value(coord) }
  fields.delete(0)
  if fields.empty?
    true
  else
    false
  end
end

def fill(coordinates)
  i = 0
  while i < coordinates.size
    find_coordinate_value(coordinates[i])
    @board[@row_index][@column_index] = @field_options[:filled_unselected_field]
    i += 1
  end
end

if are_fields_empty?(ship_coordinates)
  fill(ship_coordinates)
end

print @board
