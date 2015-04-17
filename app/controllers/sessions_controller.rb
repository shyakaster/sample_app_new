class SessionsController < ApplicationController
  def new
    render 'new'
  end
  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      #Sign the user in and redirect to the user profile
      sign_in user
      redirect_back_or user
    else
      #Create an error and re-render the sign in form
      flash.now[:error] = "Invalid email/password combination"
      render 'new'
    end
  end
  def destroy
    sign_out
    redirect_to root_url
  end
end
