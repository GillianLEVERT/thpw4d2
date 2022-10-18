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
player1 = Human_Player.new("#{name} LE SALVATEUR")


player2 = Player.new("Yannou-la-fripouille")
player3 = Player.new("Maeva-avec-le-trema")
ennemies = [player2, player3]



puts "Voici le status actuel des joueurs :"

puts "---------------"
player1.show_state
puts "---------------"
player2.show_state
puts "---------------"
player3.show_state

sleep 0.5

puts
puts "Passons à la phase de combat(musique de combat)"

while player1.life_points >0 && (player2.life_points > 0 || player3.life_points >0)
     puts player1.show_state

     puts "Quelle action veux-tu effectuer ?

     1 - chercher une meilleure arme
     2 - chercher à se soigner 

          Attaquer un joueur en vue :
          
     3 - #{player2.name} a #{player2.life_points} point de vie
     4 - #{player3.name} a #{player3.life_points} point de vie "

    print ">"
    input = gets.chomp

        if input == "1"
            player1.search_weapon
        elsif input == "2"
            player1.search_health_pack
        elsif input == "3"
            player1.attack(player2)
        elsif input == "4"
            player1.attack(player3)
        end 
        puts "------------"
        sleep 0.5
        puts "Les autres joueurs attaquent !"
        ennemies.each do |bot|
            if bot.life_points > 0
                bot.attack(player1)
                sleep 0.5
            end
    end
end

puts "La partie est terminé"
    if player1.life_points > 0
        puts "GG WP"
    else
        puts "Looser"
    end

    #PROBLEME DEGATS !