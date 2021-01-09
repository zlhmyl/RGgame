json.extract! game, :id, :name, :type, :info, :point, :created_at, :updated_at
json.url game_url(game, format: :json)
