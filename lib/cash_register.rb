class CashRegister

  attr_accessor :total, :items, :previous_total, :discount


  def initialize(employee_discount = 0)
    @total = 0
    @items = []
    @discount = employee_discount
  end

  def add_item(title, price, quantity = 1)
    quantity.times do @items << title end
    @previous_total = @total
    @total += (price * quantity)
  end

  def apply_discount()
    if(@discount > 0)
      discount_to_apply = (@total * (@discount / 100.0)).to_i
      @total -= discount_to_apply
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def items()
    return @items
  end

  def void_last_transaction()
    @total = @previous_total
  end
end
