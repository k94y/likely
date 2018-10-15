class User::SongsController < User::Base
  def show
  	@track = TrackRelation.find(params[:id])
    track_list = TrackRelation.where(song_id: @track.song_id)

    # queryの曲を含む商品array
    @products = []
    track_list.each do |track|
      p = track.disc.product
      if !@products.include?(p)
        @products << p
      end
    end

  end

end
