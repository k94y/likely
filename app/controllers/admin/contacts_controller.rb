class Admin::ContactsController < Admin::Base
  def index
  	@contacts = Contact.all.order("id desc")
  end

  def show
  	@contact = Contact.find(params[:id])
  	if @contact.user_id.blank?
  		@user = NonMember.find(@contact.non_member_id)
  	else
  		@user = User.find(@contact.user_id)
  	end
  end

  def update
  end
end
