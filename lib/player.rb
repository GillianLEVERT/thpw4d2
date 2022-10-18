require 'pry'
class Player
    attr_accessor :name, :life_points #name = string, lifeP = integer
    @@all_players = []

    def initialize(name_to_save)
        @name = name_to_save
        @life_points = 10
        @@all_players << self
    end

    def show_state
        if @life_points > 0
        puts "#{@name} a #{@life_points} point de life !"
        else
            puts "le joueur #{@name} est DCD comme une crotte"
        end
    end

    def gets_damages(damages)
        @life_points = @life_points - damages 
    end

    def attack(player)
        dice = compute_damage
        player.gets_damages(dice)
        puts "#{self.name} inflige #{dice} point de dégat(s) à son adversaire"
        sleep 0.5
    end

    def compute_damage
        rand(1..6)
    end
end

class Human_Player < Player
    attr_accessor :weapon_level, :life_points, :name

    def initialize(name_to_save)
        @weapon_level = 1

        super(name_to_save)
        @life_points = 100
    end

    def show_state
        if @life_points > 0
            puts "#{@name} a #{@life_points} point de life et une arme de niveau #{@weapon_level} !"
        else
            puts "le joueur #{@name} est DCD comme une crotte"
        end
    end

    def compute_damage
        super
        rand(1..6) * @weapon_level
        
      end

      def search_weapon
        level = rand(1..6) 
        puts "Tu as trouvé une arme de niveaux #{level}"
        if level > @weapon_level
            @weapon_level = level
            puts "YIPIKAI YEAH ! elle est meilleure que ton arme actuelle : tu la prends."
        else
            puts "SAPERLIPOPETTE elle n'est pas mieux que ton arme actuelle..."
        end
      end

      def search_health_pack
        search = rand (1..6)
        puts search
        if search == 1
            puts "Tu n'as rien trouvé pov nul"
        elsif search == 2 or 3 or 4 or 5
            puts "Bravo tu as trouvé 50 points de vie"
            if @life_points + 50 > 100
                @life_points = 100
            else
                @life_points += 50
            end
        elsif search == 6
            puts "GG tu as trouvé un pack de 80 points de vie (CHEATER)"
            if @life_points + 80 > 100
                @life_points = 100
            else
                @life_points += 80
            end 
        end
    end
end

