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

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.check_stock(item) != 0
    end
  end

  def total_inventory
    total_inventory = {}
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item, count|
        if total_inventory[item] != nil
          total_inventory[item][:quantity] += count
          total_inventory[item][:food_trucks] << food_truck
        else
          total_inventory[item] = {quantity: count, food_trucks: [food_truck]}
        end
      end
    end
    total_inventory
  end

  def overstocked_items
    overstocked_items = []
    total_inventory.each do |item, inventory|
      if inventory[:quantity] > 50 && inventory[:food_trucks].length > 1
        overstocked_items << item
      end
    end
    overstocked_items.uniq
  end
  #ITERATION 3:
  ##sorted_item_list that returns a list of names of all items the FoodTrucks
  # have in stock, sorted alphabetically. This list should not include any
  # duplicate items.

end
