# get '/sign_up' do

# end

post '/sign_up' do
  p params
  user = User.create(email: params[:email], password_hash: params[:password])
  session[:user] = user
  redirect '/choose_deck'
end

# get '/create_user' do

# end
