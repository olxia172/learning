ROCK = 'rock'
PAPER = 'paper'
SCISSORS = 'scissors'

def rps(gamer1_choice, gamer2_choice)
  if gamer1_choice == gamer2_choice
    puts 'Remis'
  elsif gamer1_choice == ROCK && gamer2_choice == PAPER
    puts 'Gracz 2 wygywa'
  elsif gamer1_choice == ROCK && gamer2_choice == SCISSORS
    puts 'Gracz 1 wygrywa'
  elsif gamer1_choice == PAPER && gamer2_choice == ROCK
    puts 'Gracz 1 wygrywa'
  elsif gamer1_choice == PAPER && gamer2_choice == SCISSORS
    puts 'Gracz 2 wygrywa'
  elsif gamer1_choice == SCISSORS && gamer2_choice == ROCK
    puts 'Gracz 2 wygrywa'
  elsif gamer1_choice == SCISSORS && gamer2_choice == PAPER
    puts 'Gracz 1 wygrywa'
  end
end

rps('rock', 'scissors')
rps('paper', 'rock')
