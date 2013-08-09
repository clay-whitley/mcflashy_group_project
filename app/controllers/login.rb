enable :sessions


post '/login' do
  user = User.find_by_email(params[:email]) 
  if user
    sessions[:user] = user
    redirect '/choose_deck'
  else
    redirect '/'
  end
end

get '/sign_out' do
  sessions[:user] = nil
  erb :index
end


