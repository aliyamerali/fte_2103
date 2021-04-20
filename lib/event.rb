class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(truck)
    @food_trucks << truck
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

end
# #food_truck_names that returns an array of all the FoodTruck's names.
# #food_trucks_that_sell that takes an argument of an item represented as a String.
#   It will return a list of FoodTrucks that have that item in stock.
