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

  def total
    subtotal = calculate_subtotal
    delivery = calculate_delivery(subtotal)
    const total = subtotal + delivery
    sprintf('%.2f', total)
  end

  private

  def calculate_subtotal
    @items
      .tally
      .sum { |code, qty| line_total(code, qty) }
  end

  def line_total(code, qty)
    price = PRODUCTS[code][:price]
    qty * price
  end

  def calculate_delivery(subtotal)
    rule = DELIVERY_RULES.find { |r| subtotal >= r[:threshold] }
    rule[:cost]
  end
end
