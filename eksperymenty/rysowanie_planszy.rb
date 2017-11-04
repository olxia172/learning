#require "pry"

@columns = ('A'..'J').to_a
@rows = (1..10).to_a

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
  field = ' '
  index = 0
  while index < @rows.size
    print frame
    row = [@rows[index].to_s] + [field] * 10
    print '|'
    row.each { |elem| print elem.center(3) + '|'}
    print "\n"
    index += 1
  end
  print frame
end

board_for_gamer
