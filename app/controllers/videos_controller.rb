class VideosController < ApplicationController
  def index
    @videos = Zype.new.get_videos
  end

  def show
    @video = Zype.new.get_video(params[:id])
  end
end
