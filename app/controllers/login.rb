enable :sessions


post '/login' do
  user = User.find_by_email(params[:email]) 
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


