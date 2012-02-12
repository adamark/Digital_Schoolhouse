class SessionController < ApplicationController
  def new
      # @user = User.new
      @title = "Sign in"
      
  end

  def create
      
      user = User.find_by_username(params[:session][:username])
      if user.authenticate(params[:session][:username],params[:session][:password])
          session[:user_id] = user.id
          
          redirect_to articles_path
          # redirect_back_or user
      else
          flash.now[:error] = "Invalid username/password combination"
          @title = "Sign in"
          render 'new'
          
      end
  end

  def destroy
    reset_session
  end

end

