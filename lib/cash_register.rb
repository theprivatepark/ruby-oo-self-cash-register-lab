require 'pry'

class CashRegister

    attr_accessor :total, :items, :prices, :discount

    def initialize(discount=0)
       @total = 0
       @items = []
       @discount = discount
       @prices = []
    end

    def add_item(title, price, quantity=1) #egg, 0.98 
        @total += price * quantity
        quantity.times {@items << title}
        quantity.times {@prices << price * quantity}
    end

    def apply_discount
       if self.discount > 0
            @total -= self.discount.to_f / 100 * self.total
            return "After the discount, the total comes to $#{@total.to_i}."
        else 
            return "There is no discount to apply."
        end 
    end
    
    def void_last_transaction
        @total -= @prices.last
       
    end
end

