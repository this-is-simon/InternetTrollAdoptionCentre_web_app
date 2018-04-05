require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner')
require_relative('../models/troll')

#show all trolls
get '/trolls' do
  @trolls = Troll.all
  erb(:"trolls/index")
end

#view individual troll
get '/trolls/:id' do
  @troll = Troll.find(params['id'])
  erb(:"trolls/show")
end

#edit individual troll
get '/trolls/:id/edit' do
  @owners = Owner.all
  @troll = Troll.find(params['id'])
  erb(:"trolls/edit")
end

#edit/post individual troll
post '/trolls/:id' do
  troll = Troll.new(params)
  troll.update
  id = params['id']
  redirect to "/trolls/#{id}"
end

#delete troll by id
post '/trolls/:id/delete' do
  troll = Troll.find(params['id'])
  troll.delete
end
