require 'pry'

class CashRegister

  attr_accessor :total, :discount, :items

  def initialize(discount = 0.00)
    @total = 0.00
    @discount = discount
    @items = []
    @last_item = []
  end

  def add_item(title, price, quantity=1)
      self.total += price * quantity
      quantity.times do
        self.items << title
      end
    @last_item = [title, price, quantity]
  end

  def apply_discount
    self.total = self.total - (self.total * (self.discount / 100.0))
    num = self.total.to_i
    if self.discount > 0.00
      return "After the discount, the total comes to $#{num}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total = self.total - @last_item[1] * @last_item[2]
  end




end
