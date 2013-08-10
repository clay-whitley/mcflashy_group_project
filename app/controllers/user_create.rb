# get '/sign_up' do

# end

post '/sign_up' do
  p params
  User.create(email: params[:email], password_hash: params[:password])
  session[:email] = params[:email]
  erb :choose_deck
end

# get '/create_user' do

# end
