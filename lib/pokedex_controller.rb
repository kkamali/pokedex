require_relative "./pokedex.rb"

class PokedexController
  def run
    dex = Pokedex.new
    puts "Hi, I'm a Pokédex! Give me a name of a Pokémon and I can tell you about it!"
    user_input = gets.chomp
    until user_input == "exit"
      mon = dex.make_pokemon(user_input.downcase)
      if mon != "error"
        mon.info
      else
        puts "There is no data. There are still Pokémon yet to be identified."
      end
      puts "Wanna learn about another Pokémon? You can also type 'exit' to leave!"
      user_input = gets.chomp
    end
  end
end