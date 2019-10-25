require_relative "./pokedex.rb"

class PokedexController
  def run
    dex = Pokedex.new
    puts "Hi, I'm a Pokédex! Give me a name of a Pokémon and I can tell you about it!"
    user_input = gets.chomp
    until user_input == "exit"
      mon = dex.make_pokemon(user_input.downcase)
      if mon != "error"
        puts "#{mon.flavor_text} It's height is usually #{mon.height} meters while its weight is usually #{mon.weight} kilos."
      else
        puts "Sorry there is no information about that Pokémon, there are still many yet to be discovered!."
      end
      puts "Wanna learn about another Pokémon? You can also type 'exit' to leave!"
      user_input = gets.chomp
    end
  end
end