post '/sign_up' do
  p params
  user = User.new(email: params[:email])
  user.password = params[:password]
  user.save
  session[:user] = user
  redirect '/choose_deck'
end
