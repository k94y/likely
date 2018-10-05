class Admin::ContactsController < Admin::Base
  def index
  	@contacts = Contact.all.order("id desc")
  end

  def show
  end

  def update
  end
end
