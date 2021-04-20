class Event
  attr_reader :name, :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end


end
# #food_truck_names that returns an array of all the FoodTruck's names.
# #food_trucks_that_sell that takes an argument of an item represented as a String.
#   It will return a list of FoodTrucks that have that item in stock.
