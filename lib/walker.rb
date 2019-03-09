require 'pry'

class Walker
  attr_reader :name,
              :poop_bags,
              :clients

  def initialize(name, poop_bags)
    @name = name
    @poop_bags = 6
    @clients = []
  end

  def add_client(dog_object)
    @clients << dog_object
  end

  def dog_is_walked(dog_object)
    dog_object.walk && @poop_bags -= 1
  end

  def count_clients
    @clients.length
  end

  def puppy_clients
    @clients.select do |client|
      client.age <= 1
    end
  end

  def elderly_clients
    @clients.select do |client|
      client.age > 6
    end
  end

  def client_names
    @clients.map do |client|
      client.name
    end
  end

  def client_names_ending_in_y
    client_names.select do |client_name|
      client_name.match("y", -1)
    end
  end

  def client_names_ending_in_ie
    client_names.select do |client_name|
      client_name.end_with?("ie")
    end
  end
  
  def check_specific_breed(dog_breed)
    @clients.select do |client|
      client.breed == dog_breed
    end
  end

  def client_list_categorized_by_breed
    @clients.group_by do |client|
      client.breed
    end
  end

  # Refactored method "client_names_ending_in_y" on lines 44-48:
    # def client_names_ending_in_y
    #   ending_in_y = @clients.select do |client|
    #     client.name.match?("y", -1)
    #   end
    #   ending_in_y.map do |client|
    #     client.name
    #   end
    # end

  # Refactored method "client_names_ending_in_ie" on lines 50-54:
    # def client_names_ending_in_ie
    #   ending_in_ie = @clients.select do |client|
    #     client.name.end_with?("ie")
    #   end
    #   ending_in_ie.map do |client|
    #     client.name
    #   end
    # end

end
