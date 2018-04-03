require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/owner')
require_relative('../models/troll')

#show all owners
get '/owners' do
  @owners = Owner.all
  erb(:"owners/index")
end

#show create new owner form
get '/owners/new' do
  @trolls = Troll.all
  @owners = Owner.all
  erb(:"owners/new")
end
