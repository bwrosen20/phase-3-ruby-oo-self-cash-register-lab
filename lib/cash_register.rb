require "pry"

class CashRegister

    attr_reader :discount
    attr_accessor :total, :items, :prices


    def initialize(discount=0)
        @discount=discount
        @total=0
        @items=[]
        @prices=[]
    end

    def add_item(item,price,quantity=1)
        self.total+=(price*quantity)
        i=0
        while i<quantity
        self.items<<item
        self.prices.push(price)
        i+=1
        end

    end

    def apply_discount
        if discount>0
            self.total-=self.total*discount/100
        "After the discount, the total comes to $#{self.total}."
        else
        "There is no discount to apply."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        deleted=@items.pop
        total_items=@items.length-1
       @prices.pop

       puts deleted
       puts total_items

       if  @items[total_items]==deleted
        @items.pop
        @prices.pop
       end 
       puts @prices
       @total=@prices.sum
    end


end

binding.pry
