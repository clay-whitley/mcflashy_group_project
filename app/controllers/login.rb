enable :sessions


post '/login' do
  if User.find_by_email(params[:email])
    sessions[:email] = params[:email]
    erb :choose_deck
  else
    redirect '/'
  end
end

get '/sign_out' do
  sessions[:email] = nil
  erb :index
end


