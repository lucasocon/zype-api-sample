class SessionsController < ApplicationController
  def create
    session[:access_token] = Zype.new.get_access_token(params[:session][:email], params[:session][:password])

    if session[:access_token]
      redirect_to video_path(params[:session][:id])
    else
      redirect_to sessions_error_path
    end
  end

  def remove
    if session[:access_token]
      session[:access_token] = nil
    end
    redirect_to videos_path
  end

  def error
  end
end
