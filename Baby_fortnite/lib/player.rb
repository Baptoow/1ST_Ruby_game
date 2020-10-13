require 'pry'

class Player
attr_accessor :name, :life_points

  def initialize(name)
  @name = name
  @life_points = 10
  end

  def show_state
  puts "#{name} has #{life_points} life points left."
  end 

  def gets_damages(hit_points)
    @life_points = (@life_points - hit_points)
    if life_points <= 0 
      return "Player '#{name}' is dead !"
    end
  end 

  def attacks(player_attacked)
    puts "'#{name}' attacks #{player_attacked.name} !!!"
    @hit_points = compute_damage
    return player_attacked.gets_damages(@hit_points)
    puts "'#{name}' takes #{compute_damage} points out of '#{player_attacked.name}' life !"

  end 

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
attr_accessor :name,:weapon_level 

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
    end

    def show_state
      puts "#{name} has #{life_points} life points left and a Lv.#{weapon_level} weapon!"
    end 
    
    def compute_damage
      rand(1..6) * @weapon_level
    end

    def search_weapon
      found_weapon_lv = rand(1..6) 
        puts "You've found a weapon Lv.#{found_weapon_lv}"
      if @weapon_level < found_weapon_lv
        puts "--YEAH ! This is a better weapon ! You equip it! --"
      return @weapon_level = found_weapon_lv
      else puts "-- LAME ! This weapon is garbage! You throw it away --" 
        end
    end

    def search_health_pack
      found_health = rand(1..6)
        if found_health < 2
          puts "-- You dind't find anything! --"
          elsif found_health.between?(2, 5)
            puts "-- YEAH! you've found a +50HP Health Pack! --"
            @life_points = @life_points + 50 
          else found_health > 5
          @life_points = @life_points + 80
          puts "Damn! you've found a +80HP Health Pack"
        end
          if @life_points + found_health > 100 
            @life_points = 100
          end
    end


end