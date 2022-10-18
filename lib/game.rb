require 'pry'
require_relative 'player'
class Game
    attr_accessor :human_player, :ennemies


    def initialize(player_name)
        bot1 = Player.new("Lillian le Tyran")
        bot2 = Player.new("Yannou la Fripouille")
        bot3 = Player.new("Maeva avec le trema")
        bot4 = Player.new("JB the kids")
        @ennemies = [bot1, bot2, bot3, bot4]
        @human_player = Human_Player.new("#{player_name}")
    end

    def kill_player (player)
        @@ennemies.delete(player)
    end 

    def is_still_ongoing?
        if @human_player.life_points > 0 && @ennemies.life_points > 0
            true
        else
            false
        end
    end

    def show_players
        if @life_points > 0
            puts "#{@name} a #{@life_points} point de life et une arme de niveau #{@weapon_level} !"
            sleep 0.5
            puts "Il reste #{@ennemies} à combattre."
        else
            puts "le joueur #{@name} à perdu contre un ordinateur"
        end
    end

end

