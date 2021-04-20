require './lib/item'
require './lib/food_truck'
require './lib/event'
require 'date'

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
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    food_truck1 = FoodTruck.new("Rocky Mountain Pies")
    food_truck1.stock(item1, 35)
    food_truck1.stock(item2, 7)
    food_truck2 = FoodTruck.new("Ba-Nom-a-Nom")
    food_truck2.stock(item4, 50)
    food_truck2.stock(item3, 25)
    food_truck3 = FoodTruck.new("Palisade Peach Shack")
    food_truck3.stock(item1, 65)
    food_truck3.stock(item3, 10)


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

    it '#food_trucks_that_sell returns trucks that have the item in stock' do

      expect(event.food_trucks_that_sell(item1)).to eq([food_truck1, food_truck3])
      expect(event.food_trucks_that_sell(item4)).to eq([food_truck2])
    end

    it '#total_inventory returns hash with items as keys, hashes as values' do

      expected = {
        item1 => {quantity: 100, food_trucks: [food_truck1, food_truck3]},
        item2 => {quantity: 7, food_trucks: [food_truck1]},
        item3 => {quantity: 35, food_trucks: [food_truck2, food_truck3]},
        item4 => {quantity: 50, food_trucks: [food_truck2]},
      }
      expect(event.total_inventory.class).to eq(Hash)
      expect(event.total_inventory.keys[0].class).to eq(Item)
      expect(event.total_inventory).to eq(expected)
    end

    it '#overstocked_items returns items sold by 2+ trucks and 50+ inventory' do
      expect(event.overstocked_items).to eq([item1])
    end

    it '#sorted_item_list gives alphabetical list of all stocked item names' do
      expected = ["Apple Pie (Slice)", "Banana Nice Cream", "Peach Pie (Slice)", "Peach-Raspberry Nice Cream"]

      expect(event.sorted_item_list).to eq(expected)
    end
  end

  describe '#sell' do
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
    item5 = Item.new({name: 'Onion Pie', price: '$25.00'})
    event = Event.new("South Pearl Street Farmers Market")

    it '#date returns a date for the event' do
      allow(event).to receive(:date_to_format) do
        Date.new(2020,2,24)
      end

      expect(event.date).to eq("24/02/2020")
    end

  end
end
