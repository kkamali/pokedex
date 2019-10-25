require "poke-api-v2"
require "pry"

class Pokedex
  def get_pokemon(pokemon)
    begin
      mon = PokeApi.get(pokemon: pokemon)
    rescue JSON::ParserError
      return "No such Pokemon!"
    end
    height = mon.height.to_f / 10
    weight = mon.weight.to_f / 10
    types =  mon.types.map{|type| type.type.name}
    flavor_text = PokeApi.get(pokemon_species: pokemon).flavor_text_entries[1].flavor_text
    mon
  end
end