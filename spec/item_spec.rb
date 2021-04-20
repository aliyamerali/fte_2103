require './lib/item'

RSpec.describe Item do
  describe '#initialize' do
    item = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    it 'exists' do
      expect(item).to be_instance_of(Item)
    end

    it 'has attributes name and price available' do
      expect(item.name).to eq('Peach Pie (Slice)')
      expect(item.price).to eq(3.75)
    end

  end
end
