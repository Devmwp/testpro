class HomeController < ApplicationController
  def index
  end

  def upload
    respond_to do |format|
      format.html do
        upload_params[:image].each do |image|
          photo = Photo.create
          photo.image.attach(image)
        end
        redirect_to root_path, notice: "Images uploaded successfully"
      end
    end
  end

  def play
    @plays = Play.all
    @random_photos = Photo.all.sample(rand(5..10))
  end

  def store_tick
    respond_to do |format|
      format.json do
        @play = Play.create(store_tick_params)
        render json: { status: :success }
      end
    end
  end

  private

  def upload_params
    params.require(:photos).permit(image: [])
  end

  def store_tick_params
    params.require(:store_tick).permit(:tick, :photo_id)
  end
end
