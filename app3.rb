require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts"------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

puts "Ton pseudo, guerrier ?"
print ">"
name = gets.chomp  

game1 = Game.new(name)
game1.show_players

puts "C'est l'heure du DUEEEELLLLLLL, YUUUGIIIH.. ouais bon bref "

loop do
    if game1.is_still_ongoing?
        game1.menu
        puts
        choice = gets.chomp.to_i
        puts
        game1.menu_choice(choice)
        puts
        game1.ennemies_attack
        puts @human_player.show_state
    else
        game1.end
        break
    end
end
