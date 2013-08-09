# get '/sign_up' do

# end

post '/sign_up' do
  User.create(email: params[:email], password: params[:password])
  sessions[:email] = params[:email]
  erb :choose_deck
end

# get '/create_user' do

# end
