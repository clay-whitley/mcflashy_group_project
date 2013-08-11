post '/sign_up' do
  p params
  user = User.new(params[:user])
  user.password = params[:password]
  user.save
  session[:user] = user
  redirect '/choose_deck'
end
