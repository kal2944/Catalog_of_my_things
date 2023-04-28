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
        items: author.items
      }
    end))
  end

  def load_data
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
    parsed_author = 'dasdas'
    #   author = File.read('author.json')
    #   parsed_author = JSON.parse(author)
    { games: @games, author: parsed_author }
  end
end
