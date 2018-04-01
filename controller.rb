require('sinatra')
require('sinatra/contrib/all')
require_relative('models/owner')
require_relative('models/troll')

get '/trolls' do
  @trolls = Troll.all
  erb(:index)
end

get '/trolls/:id/edit' do
  @troll = Troll.find(params['id'])
  erb(:show)
end
