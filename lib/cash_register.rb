require 'pry'

class CashRegister
  attr_accessor :total
  attr_reader :discount
  
  def initialize(emp_discount=0.0)
    @total = 0.0
    @discount = emp_discount
    @items = []
    @last_transaction = []
  end
  
  def add_item(item, price, quantity=1)
    @total += price * quantity
    quantity.times do
      @items << item
    end
    @last_transaction = [item, price, quantity]
  end
  
  def apply_discount
    if @discount > 0
      @total *= ((100.0 - @discount) / 100.0)
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end
  
  def items
    @items
  end
  
  def void_last_transaction
    @total -= @last_transaction[1] * @last_transaction[2]
    @items.pop
  end
end
