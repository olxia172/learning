# zaladowanie ekranu
# wybieranie akcji: graj, najlepsze wyniki, autorzy, koniec
# granie

require_relative './screen.rb'
require 'curses'

class Gameplay
  def initialize
    Curses.init_screen
    begin
      Curses.crmode
      Curses.noecho
      Curses.stdscr.keypad(true)
      Curses.nonl
    ensure
      Curses.close_screen
    end
    game
  end

  def game
    x, y = 1, 11
    begin
      Curses.timeout = 0
      dx, dy = 1, 0
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
  end
end

wunsz = Gameplay.new
