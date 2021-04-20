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

end
