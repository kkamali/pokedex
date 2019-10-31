class Team
  attr_accessor :pokemon

  def initialize
    @pokemon = []
  end

  def add_to_team(pokemon)
    @pokemon << pokemon
  end

  def list_pokemon
    puts "We made you a team with..."
    @pokemon.each {|mon| puts mon.name}
  end
end