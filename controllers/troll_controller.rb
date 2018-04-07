require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner')
require_relative('../models/troll')

#show all trolls
get '/trolls' do
  @trolls = Troll.all
  erb(:"trolls/index")
end

#show form for new troll
get '/trolls/new' do
  @trolls = Troll.all
  erb(:"trolls/new")
end

#post form for new troll
post '/trolls' do
  troll = Troll.new(params)
  troll.save
  redirect '/trolls'
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
  redirect to "/trolls"
end
