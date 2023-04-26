class Label
    
    attr_accessor :title, :color

    def initialize(id, title, color)
      @id = id
      @title = title
      @color = color
      @items = []
    end