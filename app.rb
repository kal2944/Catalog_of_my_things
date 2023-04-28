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
    @albums = SaveLoadMusicAlbumData.new
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
    end
  end

  def list_labels
    puts 'This will list the labels'
  end

  def list_authors
    return puts 'no author found' if @authors.empty?

    @authors.each_with_index do |author, index|
      puts "#{index}) First_name: #{author.first_name}, Last_name: #{author.last_name}"
    end
  end

  def add_book
    puts 'This will add a book'
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
    @authors.concat(load_game_data[:author])
  end

  def exit_app
    add_data
    puts 'Thanks for using the app'
    exit
  end
end
