class User::ContactsController < User::Base
  def new
  	@contact = Contact.new
    @non_member = NonMember.new
  end

  def create
    if user_signed_in?
      contact = Contact.new(contact_params)
      contact.user_id = current_user.id
      contact.save!
      redirect_to new_contacts_path,alert: "お問い合わせを受け付けました。"
    else
      non_member = NonMember.new(non_member_params)
      if non_member.save!
         contact = Contact.new(contact_params)
         contact.non_member_id = non_member.id
         contact.save!
         redirect_to new_contacts_path,alert: "お問い合わせを受け付けました。"
      end
    end
  end

  private
  def contact_params
  	params.require(:contact).permit(:title, :body)
  end
  def non_member_params
    params.require(:non_member).permit(:name, :email)
  end


end
