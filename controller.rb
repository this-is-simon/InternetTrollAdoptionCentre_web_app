require('sinatra')
require('sinatra/contrib/all')
require_relative('models/owner')
require_relative('models/troll')

get '/trolls' do
  @trolls = Troll.all
  erb(:index)
end


#view individual troll
get '/trolls/:id' do
  @troll = Troll.find(params['id'])
  erb(:show)
end


#edit individual troll
get '/trolls/:id/edit' do
  @owner = Owner.all
  @troll = Troll.find(params['id'])
  erb(:edit)
end
