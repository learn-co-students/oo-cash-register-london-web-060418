require "pry"

class CashRegister
  attr_accessor :total, :discount, :previous_total

  def initialize(employee_discount=0)
    @total = 0.0
    @discount = employee_discount
    @basket = []
    @items = []
    @transactions = []
  end

  def add_item(title, price, quantity=1)
    quantity.times{@items.push(title)}
    bundle = price.to_f * quantity
    @basket << title
    @previous_total = @total
    @total += bundle
    @transactions << bundle
  end

  def apply_discount
    if @discount > 0
      @total = @total - (@total * (@discount / 100.0))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end


  def items
    @items
  end

  def void_last_transaction
    @total = @previous_total
  end


end
