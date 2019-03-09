require 'minitest/autorun'
require 'minitest/pride'
require './lib/walker'
require './lib/dog'
require 'pry'

class WalkerTest < Minitest::Test
 def setup
   @walker = Walker.new("Eli", 6)
   @sodie = Dog.new("Sodie", 9, "Shih-Tzu", true)
   @max = Dog.new("Max", 11, "Cocker Spaniel", false)
   @charlie = Dog.new("Charlie", 4, "Basset Hound", false)
   @lucy = Dog.new("Lucy", 3, "Dachshund", true)
   @lenny = Dog.new("Lenny", 1, "Dachshund", true)
 end

 def test_walker_exists
   assert_instance_of Walker, @walker
 end

 def test_walker_has_attributes
   assert_equal "Eli", @walker.name
   assert_equal 6, @walker.poop_bags
 end

 def test_walker_begins_with_empty_list_of_clients
   assert_equal [], @walker.clients
 end

 def test_walker_can_add_clients
   @walker.add_client(@sodie)
   @walker.add_client(@max)
   assert_equal [@sodie, @max], @walker.clients

   @walker.add_client(@charlie)
   @walker.add_client(@lucy)
   assert_equal [@sodie, @max, @charlie, @lucy], @walker.clients
 end

 def test_after_dog_is_walked_poop_bags_decrease
   @walker.dog_is_walked(@sodie)
   @walker.dog_is_walked(@max)
   @walker.dog_is_walked(@charlie)
   assert_equal 3, @walker.poop_bags

   @walker.dog_is_walked(@lucy)
   @walker.dog_is_walked(@lucy)
   assert_equal 1, @walker.poop_bags
 end

 def test_dog_walks_increase_after_dog_is_walked
   @walker.dog_is_walked(@sodie)
   @walker.dog_is_walked(@max)
   @walker.dog_is_walked(@charlie)
   @walker.dog_is_walked(@lucy)
   @walker.dog_is_walked(@sodie)
   assert_equal 2, @sodie.walks

   assert_equal 1, @lucy.walks
 end

 def test_can_count_the_number_of_clients
   @walker.add_client(@sodie)
   @walker.add_client(@max)
   assert_equal 2, @walker.count_clients

   @walker.add_client(@charlie)
   @walker.add_client(@lucy)
   @walker.add_client(@lenny)
   assert_equal 5, @walker.count_clients
 end

 def test_can_list_all_puppy_clients
   @walker.add_client(@sodie)
   @walker.add_client(@max)
   @walker.add_client(@charlie)
   @walker.add_client(@lucy)
   @walker.add_client(@lenny)

   assert_equal [@lenny], @walker.puppy_clients
 end

 def test_can_list_all_elderly_clients
   @walker.add_client(@sodie)
   @walker.add_client(@max)
   @walker.add_client(@charlie)
   @walker.add_client(@lucy)
   @walker.add_client(@lenny)

   assert_equal [@sodie, @max], @walker.elderly_clients
 end

 def test_can_list_all_client_names
   @walker.add_client(@sodie)
   @walker.add_client(@max)
   @walker.add_client(@charlie)
   @walker.add_client(@lucy)
   @walker.add_client(@lenny)

   assert_equal ["Sodie", "Max", "Charlie", "Lucy", "Lenny"], @walker.client_names
 end

 def test_can_list_all_client_name_ending_in_y
   @walker.add_client(@sodie)
   @walker.add_client(@max)
   @walker.add_client(@charlie)
   @walker.add_client(@lucy)
   @walker.add_client(@lenny)

   assert_equal ["Lucy", "Lenny"], @walker.client_names_ending_in_y
 end

 def test_can_list_all_clients_ending_in_ie
   @walker.add_client(@sodie)
   @walker.add_client(@max)
   @walker.add_client(@charlie)
   @walker.add_client(@lucy)
   @walker.add_client(@lenny)

   assert_equal ["Sodie", "Charlie"], @walker.client_names_ending_in_ie
 end

 def test_can_list_clients_by_specific_breed
   @walker.add_client(@sodie)
   @walker.add_client(@max)
   @walker.add_client(@charlie)
   @walker.add_client(@lucy)
   @walker.add_client(@lenny)

   assert_equal [@lucy, @lenny], @walker.check_specific_breed("Dachshund")
 end

 def test_can_list_clients_categorized_by_breed
   @walker.add_client(@sodie)
   @walker.add_client(@max)
   @walker.add_client(@charlie)
   @walker.add_client(@lucy)
   @walker.add_client(@lenny)

   expected = {
               "Shih-Tzu" => [@sodie],
               "Cocker Spaniel" => [@max],
               "Basset Hound" => [@charlie],
               "Dachshund" => [@lucy, @lenny]
              }

   assert_equal expected, @walker.client_list_categorized_by_breed
 end

end
