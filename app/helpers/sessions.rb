helpers do

  def current_user
    if session[:user] 
      return session[:user]
    else 
      return session[:users]
    end
    # TODO: return the current user if there is a user signed in.
  end

end
