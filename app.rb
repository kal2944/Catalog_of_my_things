require 'date'
require 'json'
require_relative 'create_game'
require_relative 'create_music_album'
require_relative 'item'
require_relative 'game'
require_relative 'music_album'
require_relative 'author'
require_relative 'save_load_game_data'
require_relative 'book'
require_relative 'create_book'
require_relative 'catalog'


class App
  MENU_OPTIONS = {
    '1' => :list_books,
    '2' => :list_albums,
    '3' => :list_games,
    '4' => :list_genres,
    '5' => :list_labels,
    '6' => :list_authors,
    '7' => :add_book,
    '8' => :add_album,
    '9' => :add_game,
    '10' => :exit_app
  }.freeze

  def initialize
    @game_data = SaveLoadGameData.new
    @books = []
    @albums = []
    @games = []
    @authors = []
    @labels = []
    @genres = []
    @catalog = Catalog.new
   

    book1 = CreateBook.create_book('The Catcher in the Rye', 'J.D. Salinger', '1951-07-16')
    book2 = CreateBook.create_book('To Kill a Mockingbird', 'Harper Lee', '1960-07-11')
    @catalog.add_item(book1)
    @catalog.add_item(book2)
  end

  def option_select
    selected_opt = gets.chomp
    action = MENU_OPTIONS[selected_opt]
    send(action) if action
    exit_app unless action
  end

  def list_books
    puts "list_books called" # debug print
    return puts 'no books found' if @catalog.items.empty?

    @catalog.items.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author}, Published: #{book.published_date}"
    end
  end
  def list_albums
    return puts 'no albums found' if @albums.empty?

    @albums.each_with_index do |album, index|
      puts "#{index}) Publish_date: #{album.publish_date}, On_spotify: #{album.on_spotify},
      Archived: #{album.archived}"
    end
  end

  def list_games
    return puts 'no games found' if @games.empty?

    @games.each_with_index do |game, index|
      puts "#{index}) Publish_date: #{game.publish_date}, Multiplayer: #{game.multiplayer},
      Last_played_at: #{game.last_played_at}"
    end
  end

  def list_genres
    puts 'This will list the genres'
  end

  def list_labels
    return puts 'No labels found.' if @labels.empty?

    @labels.each_with_index do |label, index|
      puts "#{index}) Label name: #{label.name}"
      if label.items.empty?
        puts "\tNo items in this label."
      else
        puts "\tItems in this label:"
        label.items.each do |item|
          puts "\t- #{item.title} (#{item.class})"
        end
      end
    end
  end

  def list_authors
    return puts 'no author found' if @authors.empty?

    @authors.each_with_index do |author, index|
      puts "#{index}) First_name: #{author.first_name}, Last_name: #{author.last_name}"
    end
  end

  def add_book
    puts "Create a book"
    puts "Enter publisher:"
    publisher_name = gets.chomp
    publisher = Publisher.new(publisher_name)
    puts "Enter cover state:"
    cover_state = gets.chomp
    puts "Enter ID:"
    id = gets.chomp.to_i
    puts "Enter publish date (yyyy-mm-dd):"
    publish_date = gets.chomp
    book = Book.new(publisher, cover_state, id, publish_date)
    @catalog.add_item(book)  # add the book to the catalog
    puts "Book created successfully!"
  end
  

  def add_album
    print "Create an album\n"

    album_func = MusicAlbumfunc.new
    publish_dates = album_func.publish_date

    print 'On_spotify: '
    on_spotify = gets.chomp

    print 'archived_status [Y/N]: '
    archived = gets.chomp.upcase
    if %w[Y N].include?(archived)
      if archived == 'Y'
        archived = true
      elsif archived == 'N'
        archived = false
      end
      @albums << MusicAlbum.new(publish_dates, on_spotify, archived: archived)
      print "Album created successfully!\n"
    else
      print "Invalid option type Y or N\n"
      nil
    end
  end

  def add_game
    game_func = GameFunc.new
    publish_dates = game_func.publish_date
    print 'Multiplayer: '
    multiplayer = gets.chomp
    last_played = game_func.last_played_at
    print 'archived_status [Y/N]: '
    archived = gets.chomp.upcase
    if %w[Y N].include?(archived)
      if archived == 'Y'
        archived = true
      elsif archived == 'N'
        archived = false
      end
      @games << Game.new(publish_dates, multiplayer, last_played, archived: archived)
      @authors << game_func.create_author
      print "Game created successfully!\n"
    else
      print "Invalid option type Y or N\n"
      nil
    end
  end

  def add_data
    @game_data.saved_data(@games, @authors)
  end

  def load_data
    load_game_data = @game_data.load_data
    @games.concat(load_game_data[:games])
    p load_game_data[:author]
  end

  def exit_app
    add_data
    puts 'Thanks for using the app'
    exit
  end
end
