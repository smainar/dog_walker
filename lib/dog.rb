require 'pry'

class Dog
  attr_reader :name,
              :age,
              :breed,
              :small_breed,
              :walks

  def initialize(name, age, breed, small_breed)
    @name = name
    @age = age
    @breed = breed
    @small_breed = small_breed
    @walks = 0
  end

  def bark
    if @small_breed == true
      p "Yap!"
    else
      p "ROOF"
    end
  end

  def walk
    @walks += 1
  end

end
