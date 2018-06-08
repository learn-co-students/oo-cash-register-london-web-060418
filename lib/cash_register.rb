require "pry"

class CashRegister
 attr_reader :discount
 attr_accessor :total, :lastitem
  def initialize(discount = 0)
    @discount=discount
    @total=0
    @item_arr = []
  end

  def items
    @item_arr
  end

  def add_item(item,price,quantity=1)
          @lastitem=price
          temp_quantity= quantity
   while temp_quantity >0
      @item_arr << item
         temp_quantity -= 1
       end
      @total+= price*quantity

  end

  def apply_discount
      if discount == 0
        return "There is no discount to apply."
      else
        new_total=@total*((100-@discount)/100.0)
      @total=new_total.to_i
      "After the discount, the total comes to $#{@total}."



    end

  end
 def void_last_transaction
    @total=@total-@lastitem
 end
end