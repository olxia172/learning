def draw_level(padding, start, stop)
  start.step(stop, 2) do |i|
    print ' ' * padding
    print ' ' * ((stop - i) / 2)
    print '*' * i
    print "\n"
  end
end

draw_level(3, 1, 7)
draw_level(1, 3, 11)
draw_level(6, 1, 1)
