class CashRegister

  attr_accessor :total, :discount, :items, :last_transaction

# ::new
  # def initialize(total=0, discount=20)
  #   @total = total
  #   @discount = discount
  #   @items = []
  # end

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
   self.total += price * quantity
   quantity.times do
     items << title
   end
   self.last_transaction = price * quantity
  end

  def apply_discount
    if discount != 0
      total_discount = (self.total.to_f * discount.to_f) / 100.00
      self.total -= total_discount.to_i
      "After the discount, the total comes to $#{self.total}."
   else
     "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_transaction
  end

end
