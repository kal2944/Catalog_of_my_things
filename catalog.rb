class Catalog
    attr_reader :items
  
    def initialize
      @items = []
    end
  
    def add_item(item)
      @items << item
    end
  
    def list_all_items
      @items.each { |item| puts item }
      puts "No items found." if @items.empty?
    end
  end
  