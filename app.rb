require 'date'
require 'json'
require_relative 'create_game'
require_relative 'create_music_album'
require_relative 'item'
require_relative 'game'
require_relative 'music_album'
require_relative 'author'
require_relative 'genre'
require_relative 'save_load_game_data'
require_relative 'save_load_musicalbum_genre_data'

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
    @music_album_data = SaveLoadMusicAlbumData.new
    @albums = []
    @games = []
    @authors = []
    @labels = []
    @genres = []
  end

  def option_select
    selected_opt = gets.chomp
    action = MENU_OPTIONS[selected_opt]
    send(action) if action
    exit_app unless action
  end

  def list_books
    puts 'This will list the books'
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
    return puts 'no genre found' if @genres.empty?

    @genres.each_with_index do |genre, index|
      puts "#{index}) Name: #{genre.name}"
      if genre.items.empty?
        puts "\tNo items in this genre."
      else
        puts "\tItems in this genre:"
        genre.items.each do |item|
          puts "\tpublish_date: #{item.publish_date}, on_spotify: #{item.on_spotify}"
        end
      end
    end
  end

  def list_labels
    puts 'This will list the labels'
  end

  def list_authors
    return puts 'no author found' if @authors.empty?

    @authors.each_with_index do |author, index|
      puts "#{index}) First_name: #{author.first_name}, Last_name: #{author.last_name}"
      if author.items.empty?
        puts "\tNo items in this author."
      else
        puts "\tItems in this author:"
        author.items.each do |item|
          puts "\tpublish_date: #{item.publish_date}, multiplayer: #{item.multiplayer},
          last_played_at: #{item.last_played_at}"
        end
      end
    end
  end

  def add_book
    puts 'This will add a book'
  end

  def add_album
    album_func = MusicAlbumFunc.new
    @albums.concat(album_func.create_album)
    @genres.concat(album_func.create_genre)
    print "Album created successfully!\n"
  end

  def add_game
    game_func = GameFunc.new
    @games.concat(game_func.create_game)
    @authors.concat(game_func.create_author)
    print "Game created successfully!\n"
  end

  def add_data
    @game_data.saved_data(@games, @authors)
    @music_album_data.save_data(@albums, @genres)
  end

  def load_data
    load_game_data = @game_data.load_data
    @games.concat(load_game_data[:games])
    @authors.concat(load_game_data[:author])
    load_album_data = @music_album_data.load_data
    puts load_album_data[:music_albums]
    @albums.concat(load_album_data[:music_albums])
    @genres.concat(load_album_data[:genres])
  end

  def exit_app
    add_data
    puts 'Thanks for using the app'
    exit
  end
end
