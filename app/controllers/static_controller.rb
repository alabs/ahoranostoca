class StaticController < ApplicationController
  skip_forgery_protection
  def contact
      ContactRequest.create(:data => contact_params)
      render :json => {:status => "OK"} 
  end

  def newsletter
	  NewsletterRequest.create(:data => newsletter_params)
	  render :json => {:status => "OK"}
  end

  private
    def contact_params
	  params.permit(:name, :email, :subject, :message)
	end

	def newsletter_params
	  params.permit(:email)
	end

end
