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
    @pokemon.each_with_index do |mon, index|
      if index == @pokemon.length - 1
        puts "and #{mon.name}!"
      else
        puts "#{mon.name},"
      end
    end
    list_types
  end

  def list_types
    types =  []
    @pokemon.each {|mon| types << mon.types}
    puts "You pokemon team has these types: #{types.flatten.uniq}"
  end
end