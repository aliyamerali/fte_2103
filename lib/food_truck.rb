class FoodTruck
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item, count)
    if inventory[item] == nil
      inventory[item] = count
    else
      inventory[item] +=  count
    end
  end

  def check_stock(item)
    if inventory.keys.include?(item)
      inventory[item]
    else
      0
    end
  end

  def potential_revenue
    potential_revenue = 0
    inventory.each do |item, count|
      potential_revenue += item.price * count
    end
    potential_revenue
  end
end
