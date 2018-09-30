class User::SongsController < User::Base
  def show
  	@track = TrackRelation.find(params[:id])
  end
end
