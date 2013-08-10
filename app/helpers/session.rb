helpers do
  def current_user
    if session[:user]
      return session[:user]
    else
      return nil
    end
  end
end