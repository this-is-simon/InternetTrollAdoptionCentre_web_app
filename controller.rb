require('sinatra')
require('sinatra/contrib/all')
require_relative('models/owner')
require_relative('models/troll')

#show all trolls
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
  @owners = Owner.all
  @troll = Troll.find(params['id'])
  erb(:edit)
end

#edit/post individual troll
post '/trolls/:id' do
  troll = Troll.new(params)
  if troll.owner_id == ""
    troll.owner_id = nil
  end
  troll.update
  redirect to "/trolls/#{params['id']}"
end
