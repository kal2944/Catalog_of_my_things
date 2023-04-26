require 'date'
require_relative 'create_game'
require_relative 'item'
require_relative 'game'
require_relative 'author'

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
    '9' => :add_game
  }.freeze

  def initialize
    @books = []
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

  private

  def list_books
    puts 'This will list the books'
  end

  def list_albums
    puts 'This will list the music albums'
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
    puts 'This will add a music album'
  end

  def add_game
    print "Create a game\n"

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
      create_author
    else
      print "Invalid option type Y or N\n"
      nil
    end
  end

  def create_author
    print "Add author to the Game\n"
    print 'First_name: '
    first_name = gets.chomp
    print 'Last_name: '
    last_name = gets.chomp
    @authors << Author.new(first_name, last_name)
    print "Game created successfully!\n"
  end

  def exit_app
    puts 'Thanks for using the app'
    exit
  end
end
