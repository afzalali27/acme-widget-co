class Basket
  PRODUCTS = {
    'R01': { name: 'Red Widget',   price: 32.95 },
    'G01': { name: 'Green Widget', price: 24.95 },
    'B01': { name: 'Blue Widget',  price:  7.95 }
  }

  DELIVERY_RULES = [
    { threshold: 90, cost: 0.00 },
    { threshold: 50, cost: 2.95 },
    { threshold:  0, cost: 4.95 }
  ]

  def initialize
    @items = []
  end

  def add(code)
    raise "Product code #{code} not found" unless PRODUCTS.key?(code)
    @items << code
  end

  
end
