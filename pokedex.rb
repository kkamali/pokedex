require "poke-api-v2"
require "pry"
require_relative './pokemon.rb'

class Pokedex
  def find_pokemon(pokemon)
    begin
      mon = PokeApi.get(pokemon: pokemon)
    rescue JSON::ParserError
      return "error"
    end
    mon
  end

  def make_pokemon(pokemon)
    dex_info = find_pokemon(pokemon)
    if dex_info != "error"
      pokemon_attributes = {}
      pokemon_attributes[:height] = dex_info.height.to_f / 10
      pokemon_attributes[:weight] = dex_info.weight.to_f / 10
      pokemon_attributes[:flavor_text] = get_flavor_text(pokemon)
      Pokemon.new(pokemon_attributes)
    else
      "I don't know that Pokémon!"
    end
  end

  def get_flavor_text(pokemon)
    PokeApi.get(pokemon_species: pokemon).flavor_text_entries[1].flavor_text
  end
end