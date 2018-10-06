class Admin::ContactsController < Admin::Base
  def index
  	@contacts = Contact.all.order("id desc")
  	@no_members = NonMember.all
  end

  def show
  	@contact = Contact.find(params[:id])
  	if @contact.user_id.blank?
  		@name = NonMember.find(@contact.non_member_id).name
  	else
  		@name = User.find(@contact.user_id).name
  	end
  end

  def update
  	contact = Contact.find(params[:id])
  	contact.update(reply_status: true)
  	redirect_to admin_contacts_path
  end
end
