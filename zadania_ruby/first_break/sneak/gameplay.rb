# zaladowanie ekranu
# wybieranie akcji: graj, najlepsze wyniki, autorzy, koniec
# granie

require 'curses'

x, y = 10, 10

dx, dy = 0, -1

Curses.init_screen
begin
  Curses.crmode
  Curses.noecho
  Curses.stdscr.keypad(true)
  Curses.nonl
  Curses.timeout = 0
  while true
    key = Curses.getch
    if key == Curses::Key::RIGHT
      dx, dy = 1, 0
    elsif key == Curses::Key::LEFT
      dx, dy = -1, 0
    elsif key == Curses::Key::UP
      dx, dy = 0, -1
    elsif key == Curses::Key::DOWN
      dx, dy = 0, 1
    elsif key == 'q'
      break
    end
    x += dx
    y += dy
    Curses.clear
    Curses.setpos(y, x)
    Curses.addch('@')
    Curses.setpos(0, 0)
    Curses.refresh
    sleep 0.2
  end
ensure
  Curses.close_screen
end
