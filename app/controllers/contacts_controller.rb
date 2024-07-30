class ContactsController < ApplicationController
  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.save
        format.html { redirect_to contact_path, notice: 'Thank you for your message. We will get back to you soon.' }
        format.json { render json: { message: "Thank you for your message. We will get back to you soon." }, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def contact_params
    params.permit(:name, :email, :subject, :message)
  end
end
