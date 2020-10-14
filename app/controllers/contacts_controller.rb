class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create 
    @contact = Contact.create(contact_params)
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :title, :body).merge(user_id: current_user.id)
  end
end
 