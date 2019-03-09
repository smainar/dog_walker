require 'minitest/autorun'
require 'minitest/pride'
require './lib/dog'
require 'pry'

class DogTest < Minitest::Test
  def setup
    @sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
    @max = Dog.new("Max", 11, "Cocker Spaniel", false)
  end

  def test_dog_exists
    assert_instance_of Dog, @sodie
  end

  def test_dog_has_attributes
    assert_equal "Sodie", @sodie.name
    assert_equal 9, @sodie.age
    assert_equal "Shih-Tzu", @sodie.breed
    assert_equal true, @sodie.small_breed
    assert_equal 0, @sodie.walks
  end

  def test_dogs_have_their_own_bark
    assert_equal "Yap!", @sodie.bark
    assert_equal "ROOF", @max.bark
  end

  def test_you_can_add_walks
    @sodie.walk
    assert_equal 1, @sodie.walks

    @sodie.walk
    assert_equal 2, @sodie.walks
  end
end
