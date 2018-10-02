class User::GenresController < User::Base
  def index
  	@genres = Genre.all
  end

  def show
  end
end
