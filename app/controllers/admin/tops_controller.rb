class Admin::TopsController < Admin::Base
	load_and_authorize_resource class: false
  def index
  end
end
