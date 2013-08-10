post '/login' do
  user = User.authenticate(params[:email], params[:password])
  if user
    session[:user] = user
    redirect '/choose_deck'
  else
    redirect '/'
  end
end

get '/sign_out' do
  session[:user] = nil
  erb :index
end



