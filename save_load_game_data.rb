class SaveLoadGameData
  def initialize
    @games = []
    @authors = []
  end

  def saved_data(games, authors)
    File.write('games.json', JSON.pretty_generate(games.map do |game|
      {
        id: game.id,
        publish_date: game.publish_date,
        multiplayer: game.multiplayer,
        last_played_at: game.last_played_at,
        archived: game.archive
      }
    end))
    File.write('author.json', JSON.pretty_generate(authors.map do |author|
      {
        id: author.id,
        first_name: author.first_name,
        last_name: author.last_name,
        items: author.items.map do |item|
          { id: item.id }
        end
      }
    end))
  end

  def load_data
    load_games
    load_authors
    { games: @games, author: @authors }
  end

  def load_games
    games = File.read('games.json')
    parsed_games = JSON.parse(games)
    parsed_games.each do |game_data|
      game = Game.new(
        game_data['publish_date'],
        game_data['multiplayer'],
        game_data['last_played_at'],
        archived: game_data['archived']
      )
      game.instance_variable_set(:@id, game_data['id'])
      @games << game
    end
  end

  def load_authors
    author = File.read('author.json')
    parsed_author = JSON.parse(author)
    parsed_author.each do |author_data|
      author = Author.new(
        author_data['first_name'],
        author_data['last_name']
      )
      author.instance_variable_set(:@id, author_data['id'])
      find_game = nil
      @games.each do |game|
        if game.id == author_data['items'][0]['id']
          find_game = game
          break
        end
      end
      author.add_item(find_game) if find_game
      @authors << author
    end
  end
end
