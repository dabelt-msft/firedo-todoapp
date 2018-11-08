class SessionsController < ApplicationController
  def new
    @e = "Invalid credentials"
  end

  def create
    @user = User.find_by_email(params[:email].downcase)
    # If the user exists AND the password entered is correct.
    if @user && @user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      log_in @user
      redirect_to "/users/#{@user.id}/todos"
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to new_session_path flash[:error] = "Invalid Credentials"
    end
  end

  def destroy
    log_out
    redirect_to '/'
  end

end