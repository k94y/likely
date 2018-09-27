class Admin::ArtistsController < Admin::Base
  def index
    @artist = Artist.new
    @artists = Artist.all
  end

  def show
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to admin_artists_path
    else
      render :index
    end
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update(artist_params)
      redirect_to admin_artists_path
    else
      render :edit
    end
  end

  def destroy
    artist = Artist.find(params[:id])
    artist.destroy
    redirect_to admin_artists_path
  end

  private
    def artist_params
      params.require(:artist).permit(:name, :name_kana, :image)
    end
end
