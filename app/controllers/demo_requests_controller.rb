class DemoRequestsController < ApplicationController
	layout "front"

	def new
		@organization_types = OrganizationType.all
		@demo_request = DemoRequest.new
	end

	def create
	    @demo_request = DemoRequest.new demo_request_params

	    if @demo_request.valid?
	    	# New thread to send mail
        	Thread.new do
				Rails.application.executor.wrap do
	      			DemoRequestMailer.contact(@demo_request).deliver_now
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
  def demo_request_params
    params.require(:demo_request).permit(:organization_type, :name, :country, :city, :email, :website, :phone_number, :body)
  end

end
