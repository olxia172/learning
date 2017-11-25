require 'curses'

class Screen
  SCREEN_HIGHT = Curses.lines
  SCREEN_WIDTH = Curses.cols

  def initialize
    Curses.init_screen
    begin
      Curses.crmode
      Curses.noecho
      Curses.stdscr.keypad(true)
      Curses.nonl
      header_window
      action_window
    ensure
      Curses.close_screen
    end
  end

  def header_window
    header = Curses::Window.new(10, SCREEN_WIDTH, 0, 0)
    header.box('#', '#')
    header.refresh
  end

  def action_window
    action = Curses::Window.new(30, SCREEN_WIDTH, 10, 0)
    action.box('#', '#')
    action.refresh
    action.getch
  end
end
