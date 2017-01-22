class ContactMesController < ApplicationController
  
  def new
    
  end
  
  def create
  	if (permitted_params.contact_me["terms"])
		User.find_by_credentials(ENV["DEV_EMAIL"], ENV["DEV_PASSWORD"]).send_contact_me_email(permitted_params.contact_me)
	end

	flash[:notice] = ["Message Sent!"]
	redirect_to root_url
  end
  
end
