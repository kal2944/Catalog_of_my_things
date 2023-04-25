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
    puts 'This will list the games'
  end

  def list_genres
    puts 'This will list the genres'
  end

  def list_labels
    puts 'This will list the labels'
  end

  def list_authors
    puts 'This will list the authors'
  end

  def add_book
    puts 'This will add a book'
  end

  def add_album
    puts 'This will add a music album'
  end

  def add_game
    puts 'This will add a game'
  end

  def exit_app
    puts 'Thanks for using the app'
    exit
  end
end
