require_relative "./pokedex.rb"
require_relative "./team.rb"

class PokedexController
  def run
    dex = Pokedex.new
    puts "Hi, I'm a Pokédex! Give me a name of a Pokémon and I can tell you about it! Or you can say 'team' and I'll make you a trainer!"
    user_input = gets.chomp
    until user_input == "exit"
      if user_input == "team" || user_input == "new team"
        make_team(dex)
      else
        mon = dex.make_pokemon(user_input.downcase)
        if mon != "error"
          mon.info
        else
          puts "There is no data. There are still Pokémon yet to be identified."
        end
      end
      puts "Wanna learn about another Pokémon? Or do you want another team? You can also type 'exit' to leave!"
      user_input = gets.chomp
    end
  end

  def make_team(pokedex)
    puts "Alright, let's make a new team! This might take a few moments..."
    pokemon_ids = Array.new(6) { rand(1..829) }
    team = Team.new
    pokemon_ids.each do |id|
      team.add_to_team(pokedex.make_pokemon(id))
    end
    team.list_pokemon
  end
end