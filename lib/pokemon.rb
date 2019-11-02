class Pokemon
  attr_accessor :name, :height, :weight, :types, :flavor_text

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end

  def info
    puts "#{@flavor_text} It's height is usually #{@height} meters while its weight is usually #{@weight} kilos. It's type(s) are: #{@types.join(", ")}"
  end
end