class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user.present?
      session[:user_id] = user.id
      redirect_to(root_url, :notice => "Bienvenido")
    else
      session[:user_id] = nil
      flash[:notice] = "error al crear la session"
      render action: 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end
