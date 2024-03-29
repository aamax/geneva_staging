class ContactsController < ApplicationController
  load_and_authorize_resource

  def index
    @contacts = Contact.all
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def destroy
    contact = Contact.find(params[:id])

    if current_user.has_role :admin
      contact.destroy
      redirect_to contacts_path, :notice => "Contact deleted."
    else
      redirect_to contacts_path, :notice => "Un Authorized."
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(params[:contact])

    if @contact.save
      redirect_to root_path, notice: 'Contact was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      redirect_to contacts_path, :notice => "Thank you for registering and your comments."
    else
      redirect_to edit_contact_path, :alert => "Unable to make contact entry."
    end
  end
end
