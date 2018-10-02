class User::SongsController < User::Base
  def show
  	@track = TrackRelation.find(params[:id])
  	@track_list = TrackRelation.where(song_id: @track.song_id)
  end
end
