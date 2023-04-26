require_relative 'items'

class Book < Item
    
    def initialize(publisher, cover_state, id, publish_date, archived: false)
        super(id, publish_date, archived: archived)
        @publisher = publisher
        @cover_state = cover_state
      end
    
