class SaveLoadBookData
  def initialize
    @books = []
    @labels = []
    @book_data_file = ''
  end

  def save_data(books, labels)
    File.write('books.json', JSON.pretty_generate(books.map do |book|
      {
        id: book.id,
        publish_date: book.publish_date,
        publisher: book.publisher,
        cover_state: book.cover_state,
        archived: book.archive
      }
    end))
    File.write('labels.json', JSON.pretty_generate(labels.map do |label|
      {
        id: label.id,
        title: label.title,
        color: label.color,
        items: label.items.map do |item|
          { id: item.id }
        end
      }
    end))
  end

  def load_data
    load_books
    load_labels
    { books: @books, labels: @labels }
  end

  def load_books
    books = File.read('books.json')
    parsed_books = JSON.parse(books)
    parsed_books.each do |book_data|
      book = Book.new(
        book_data['publisher'],
        book_data['cover_state'],
        book_data[' publish_date'],
        archived: book_data['archived']
      )
      book.instance_variable_set(:@id, book_data['id'])
      @books << book
    end
  end

  def load_labels
    label = File.read('labels.json')
    parsed_label = JSON.parse(label)
    parsed_label.each do |label_data|
      label = Label.new(
        label_data['title'],
        label_data['color']
      )
      label.instance_variable_set(:@id, label_data['id'])
      find_book = nil
      @books.each do |book|
        if book.id == label_data['items'][0]['id']
          find_book = book
          break
        end
      end
      label.add_item(find_book) if find_book
      @labels << label
    end
  end
end
