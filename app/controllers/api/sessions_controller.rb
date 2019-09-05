class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
       params[:user][:username],
       params[:user][:password]
      )
    if @user
      login(@user)
      debugger
      render "/api/users/show.json.jbuilder"   
    else
      render json: ['Invalid credentials'], status: 422
    end
  end

  def destroy
    logout
    if logged_in?
      render json: {}
    else
      render json: ["No user to log out"], status: 404
    end
  end
end
