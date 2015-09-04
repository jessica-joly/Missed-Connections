require("bundler/setup")
require('pry')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/login') do
  erb(:login)
end

post('/login') do
  email = params.fetch('email')
  password = params.fetch('password')
  User.all.each() do |user|
    if user.email == email && user.password == password
      @user = user
      redirect("/users/#{@user.id()}")
    end
  end
  erb(:login_error)
end

get('/users/new') do
  erb(:new_user_form)
end

get('/users/:id') do
  user_id = params.fetch('id').to_i()
  @user = User.find(user_id)
  @email = @user.email()
  @keywords = []
  Keywords_Users.all.each() do |connection|
    if connection.user_id() == @user.id()
      @keywords.push(Keyword.find(connection.keyword_id()))
    end
  end
  @posts = @user.posts()
  erb(:user)
end


get('/users/:user_id/posts/:post_id') do
  post_id = params.fetch('post_id').to_i()
  @post = Post.find(post_id)
  erb(:post)
end


post('/users/new') do
  name = params.fetch('name')
  email = params.fetch('email')
  password = params.fetch('password')
  new_user = User.new({:name => name, :email => email, :password => password})
  if new_user.save()
    redirect("/users/#{new_user.id()}")
  else
    erb(:errors)
  end
end

post('/users/:id/keywords/new') do
  keyword = params.fetch('new_keyword')
  new_keyword = Keyword.create({:keyword => keyword})
  user_id = params.fetch('id').to_i()
  Keywords_Users.create({:user_id => user_id, :keyword_id => new_keyword.id})
  redirect back
end

post('/users/:id/keywords/find') do
  user_id = params.fetch('id').to_i()
  @user = User.find(user_id)
  @keywords = []
  Keywords_Users.all.each() do |connection|
    if connection.user_id() == @user.id()
      @keywords.push(Keyword.find(connection.keyword_id()))
    end
  end
  @keywords.each() do |keyword|
    keyword.scraper(@user.id)
  end
  @posts = @user.posts()
  redirect back
end

delete('/users/:user_id/keywords/:keyword_id/delete') do
  user_id = params.fetch('user_id').to_i()
  keyword_id = params.fetch('keyword_id').to_i()
  keyword = Keyword.find(keyword_id)
  Keywords_Users.all.each() do |connection|
    if connection.user_id() == user_id && connection.keyword_id() == keyword_id
      connection.destroy()
    end
  end
  Post.all.each() do |post|
    if post.user_id() == user_id && post.keyword_id() == keyword_id
      post.destroy()
    end
  end
  keyword.destroy()
  redirect back
end

get('/users/:id/settings') do
  erb(:settings)
end

delete('/users/:id/delete') do
  user_id = params.fetch('id').to_i()
  user = User.find(user_id)
  Keywords_Users.all.each() do |connection|
    if connection.user_id() == user_id
      keyword = Keyword.find(connection.keyword_id())
      keyword.destroy()
      connection.destroy()
    end
  end
  user.destroy()
  erb(:index)
end

patch('/users/:id/update') do
  user_id = params.fetch('id').to_i()
  name = params.fetch('name_update')
  user = User.find(user_id)
  user.update({:name => name})
  redirect back
end

patch('/users/:id/email') do
  user_id = params.fetch('id').to_i()
  user = User.find(user_id)
  email = params.fetch('email')
  user.update({:email => email})
  redirect back
end

patch('/users/:id/email/update') do
  user_id = params.fetch('id').to_i()
  user = User.find(user_id)
  user.update({:email => nil})
  redirect back
end
