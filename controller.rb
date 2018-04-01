require('sinatra')
require('sinatra/contrib/all')
require_relative('models/owner')
require_relative('models/troll')

get '/trolls' do
  erb(:index)
end
