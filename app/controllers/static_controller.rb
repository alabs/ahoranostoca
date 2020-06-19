class StaticController < ApplicationController
  skip_forgery_protection
  def contact
	  p "contact post"
	  p contact_params.inspect
	  p contact_params
	  p "contact post"
  end

  def newsletter
  end

  private
    def contact_params
	  params.permit(:name, :email, :subject, :message)
	end

end
