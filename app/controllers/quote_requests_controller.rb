class QuoteRequestsController < ApplicationController
	layout "front"

	def new
		@organization_types = OrganizationType.all
		@quote_request = QuoteRequest.new
	end

	def create
	    @quote_request = QuoteRequest.new quote_request_params

	    if @quote_request.valid?
	    	# New thread to send mail
        	Thread.new do
				Rails.application.executor.wrap do
	      			QuoteRequestMailer.contact(@quote_request).deliver_now
	      		end
            end
            flash[:notice] = "Nous avons bien reçu votre demande et vous contacterons bientôt!"
	      redirect_to root_path
	      
	    else
	      flash[:notice] = "Une erreur est survenue lors de l'envoi de votre demande. Veuillez réessayer."
	      render :new
	    end
	end

  private
  def quote_request_params
    params.require(:quote_request).permit(:organization_type, :name, :country, :city, :email, :website, :phone_number, :body)
  end

end
