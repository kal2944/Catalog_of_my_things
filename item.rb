require 'date'

class Item
    attr_writer: genre, :author, :sourse, :labels
    
    def initialize(id, publish_date, archived:false)
        @id = id
        @publish_date = publish_date
        @archive = archived
    end

    def move_to_archive
        @archive = true if can_be_archived?
    end

    private

    def can_be_archived?
        return true if @publish_date < Date.today - 365
    end
end 