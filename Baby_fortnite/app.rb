require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#players to be fighting together
player1 = Player.new("Josiane")
player2 = Player.new("José")

while player1.life_points > 0 && player2.life_points > 0
  #players state
  puts "> Here is how in shape our competitors are :"
  puts player1.show_state
  puts player2.show_state
  puts "> Let's FIGHT !!!"

  #the fight
  player1.attacks(player2)
    if player2.life_points <= 0 
      break puts "#{player2.name} is dead #{player1.name} wins !"

    elsif player1.life_points <=0
      break puts "#{player1.name} is dead #{player2.name} wins !"
    else 
  puts "> Here we Go !\n"
  player2.show_state

  player2.attacks(player1)
  player1.show_state
  puts "> #{player2.name} isn't ganna stay here and do Fuck All, he's striking back!!!\n"
    end
end

binding.pry
