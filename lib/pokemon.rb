class Pokemon
  attr_accessor :height, :weight, :types, :flavor_text

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end

end