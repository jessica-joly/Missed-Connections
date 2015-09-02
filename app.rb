require("bundler/setup")
require('pry')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/login') do
  @users = User.all()
  erb(:login)
end

get('/users/new') do
  erb(:new_user_form)
end

get('/users/:id') do
  user_id = params.fetch('id').to_i()
  @user = User.find(user_id)
  @keywords = []
  Keywords_Users.all.each() do |connection|
    if connection.user_id() == @user.id()
      @keywords.push(Keyword.find(connection.keyword_id()))
    end
  end
  @posts = @user.posts()
  erb(:user)
end

post('/users/new') do
  name = params.fetch('name')
  new_user = User.create({:name => name})
  redirect("/users/#{new_user.id()}")
end

post('/users/:id/keywords/new') do
  keyword = params.fetch('new_keyword')
  new_keyword = Keyword.create({:keyword => keyword})
  user_id = params.fetch('id').to_i()
  Keywords_Users.create({:user_id => user_id, :keyword_id => new_keyword.id})
  redirect back
end
