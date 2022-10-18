require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Yannou-la-fripouille")
player2 = Player.new("Maeva-avec-le-trema")

puts "Voici 'l'état' des joueurs :"
player1.show_state
player2.show_state

puts
puts "Passons à la phase de combat(musique de combat)"
    while player1.life_points > 0 && player2.life_points > 0
        if player1.life_points > 0
        puts
        player1.attack(player2)
        end
        if player2.life_points > 0
        puts
        player2.attack(player1)
        end
    end
