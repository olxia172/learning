class Animals
  def give_sound
  end
end

class Dog < Animals
  def give_sound
    puts 'Hau! Hau!'
  end
end

class Cat < Animals
  def give_sound
    puts 'Miau! Miau!'
  end
end

class Duck < Animals
  def give_sound
    puts 'Qua! Qua!'
  end
end

class Goose < Animals
  def give_sound
    puts 'Duck! Duck!'
  end
end

class Farm
  def initialize(animals_array)
    @animals_array = animals_array
  end

  def give_sound
    @animals_array.each { |animal| animal.give_sound }
  end
end

farm = Farm.new([Dog.new, Cat.new])
farm.give_sound

farm2 = Farm.new([Duck.new, Cat.new, Goose.new, Duck.new, Dog.new])
farm2.give_sound
