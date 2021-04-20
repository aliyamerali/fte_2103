require './lib/item'
require './lib/food_truck'
require './lib/event'

RSpec.describe Event do
  describe '#initialize' do
    event = Event.new("South Pearl Street Farmers Market")

    it 'exists' do
      expect(event).to be_instance_of(Event)
    end

    it 'has attribute name + food_trucks, initializes to an empty array' do
      expect(event.name).to eq("South Pearl Street Farmers Market")
      expect(event.food_trucks).to eq([])
    end
  end

  describe 'food truck management' do
    event = Event.new("South Pearl Street Farmers Market")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)


    it '#add_food_truck adds a food truck to the food_trucks array' do
      event.add_food_truck(food_truck1)
      event.add_food_truck(food_truck2)
      event.add_food_truck(food_truck3)
      expected = [food_truck1, food_truck2, food_truck3]

      expect(event.food_trucks).to eq(expected)
    end

    it '#food_truck_names returns the names of the food trucks' do
      expected = [food_truck1.name, food_truck2.name, food_truck3.name]

      expect(event.food_truck_names).to eq(expected)
    end
  end

end
