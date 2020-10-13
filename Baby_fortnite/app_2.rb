require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
#Logo
puts"___,---.__          /'|`\          __,---,___          
,-'    \`    `-.____,-'  |  `-.____,-'    //    `-.       
,'        |           ~'\     /`~           |        `.      
/      ___//              `. ,'          ,  , \___      \    
|    ,-'   `-.__   _         |        ,    __,-'   `-.    |    
|   /          /\_  `   .    |    ,      _/\          \   |   
\  |           \ \`-.___ \   |   / ___,-'/ /           |  /  
\  \           | `._   `\\  |  //'   _,' |           /  /      
`-.\         /'  _ `---'' , . ``---' _  `\         /,-'     
 ``       /     \    ,='/ \`=.    /     \       ''          
         |__   /|\_,--.,-.--,--._/|\   __|                  
         /  `./  \\`\ |  |  | /,//' \,'  \                  
THE LAST WARRIOR  \||--+--|--+-/-|     \   \                 
       |   |     /'\_\_\ | /_/_/`\     |   |                
        \   \__, \_     `~'     _/ .__/   /            
         `-._,-'   `-._______,-'   `-._,-'
"
puts 
#greeting message
puts "------------------------------------------------"
puts "|   Welcome to 'The last standing warrior'!     |"
puts "|Your only goal is being the one who's standing!|"
puts "------------------------------------------------"

#choose name
puts "choose a Warrior name >>"
name = gets.chomp
player0 = HumanPlayer.new("#{name}")

#creating bots
enemys = []
enemys.push(player1 = Player.new("Josiane"))
enemys.push(player2 = Player.new("José"))


while player0.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
 
  player0.show_state
  puts 
  puts
  puts "--- What's you next moove ? ---\n\n"
  puts "a - find a better weapon"
  puts "s - search for heath pack " 
  puts "--- attack an opponant : ---"
  print "0 - "
  print "#{player1.show_state}"
  print "1 - "
  print "#{player2.show_state}"
  result = gets.chomp

  if result == "a"
    puts "--- Seraching for weapons ---\n\n"
    player0.search_weapon
  elsif result == "s"
    puts "--- Searching for health pack ---\n\n"
    player0.search_health_pack
  elsif result == "0"
    puts "--- Attack #{player1.name} ---\n\n"
    player0.attacks(player1)
  elsif result == "1"
    puts "--- Attack #{player2.name} ---\n\n"
    player0.attacks(player2)
  end
  puts "--- Opponant's Turn ---\n\n"
  
  puts">>> Your opponant's attack"
  enemys.each do |i|
    if i.life_points > 0
      i.attacks(player0)
    end
  end

end

puts "*---------------------*"
puts "------GAME---OVER------"
puts "*---------------------*"
if player0.life_points > 0
  puts "#####-YOU-WIN-###### "
else
  puts ":::::-YOU-LOOSE-:::::"
end


binding.pry