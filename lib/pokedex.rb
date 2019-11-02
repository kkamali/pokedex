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
      pokemon_attributes[:name] = dex_info.name
      pokemon_attributes[:height] = dex_info.height.to_f / 10
      pokemon_attributes[:weight] = dex_info.weight.to_f / 10
      types =  dex_info.types.map{|type| type.type.name}
      pokemon_attributes[:types] = types
      pokemon_attributes[:flavor_text] = get_flavor_text(pokemon)
      Pokemon.new(pokemon_attributes)
    else
      "error"
    end
  end

  def get_flavor_text(pokemon)
    entries = PokeApi.get(pokemon_species: pokemon).flavor_text_entries
    entries.each do |entry|
      language = entry.language.name
      if language == "en"
        return entry.flavor_text
      end
    end
  end
end