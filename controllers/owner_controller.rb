require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner')
require_relative('../models/troll')

get '/owners' do
  @owners = Owner.all
  erb(:"owners/index")
end

get '/owners/new' do
  @trolls = Troll.all
  erb(:"owners/new")
end
