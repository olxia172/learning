require 'curses'

class Screen
  SCREEN_HIGHT = 50
  SCREEN_WIDTH = 50

  def initialize
    Curses.clear
    header_window
    action_window
  end

  def header_window
    header = Curses::Window.new(10, SCREEN_WIDTH, 0, 0)
    header.box('O', 'o')
    header.addstr('Hello')
    header.refresh
  end

  def action_window
    action = Curses::Window.new(30, SCREEN_WIDTH, 10, 0)
    action.box('O', 'o')
    action.addstr('Hello again')
    action.refresh
    action.getch
  end
end

Curses.init_screen
begin
  Curses.crmode
  Screen.new
ensure
  Curses.close_screen
end
