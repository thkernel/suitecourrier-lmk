class SearchsController < ApplicationController
	before_action :authenticate_user!
	layout "dashboard"
	
	def search_mails
		@register_types = RegisterType.all
		@natures = Nature.all 
		@supports = Support.all
		@correspondents = Correspondent.all

		@selected_register_type = params[:register_type]
		@selected_nature = params[:nature]
		@selected_support = params[:support]
		@selected_correspondent = params[:correspondent_id]
		


		

		@selected_receipt_date_start = params[:receipt_date_start]
		@selected_receipt_date_end = params[:receipt_date_end]

		@selected_departure_date_start = params[:departure_date_start]
		@selected_departure_date_end = params[:departure_date_end]

		if params[:register_type].present? && params[:register_type] === "Registre arrivée"

			@arrival_mails = ArrivalMail.all
			@arrival_mails = @arrival_mails.where(nature_id: Nature.find_by(name: @selected_nature).id) if @selected_nature.present?
			@arrival_mails = @arrival_mails.where(support_id: Support.find_by(name: @selected_support).id) if @selected_support.present?
			@arrival_mails = @arrival_mails.where(correspondent_id: Correspondent.find(@selected_correspondent)) if @selected_correspondent.present?
			@arrival_mails = @arrival_mails.where("departure_date BETWEEN ? AND ? ", @selected_departure_date_start, @selected_departure_date_end) if @selected_departure_date_start.present? and  @selected_departure_date_end.present?
			@arrival_mails = @arrival_mails.where("receipt_date BETWEEN ? AND ? ", @selected_receipt_date_start, @selected_receipt_date_end) if @selected_receipt_date_start.present? and  @selected_receipt_date_end.present?


		else
			@departure_mails = DepartureMail.all
			@departure_mails = @departure_mails.where(nature_id: Nature.find_by(name: @selected_nature).id) if @selected_nature.present?
			@departure_mails = @departure_mails.where(support_id: Support.find_by(name: @selected_support).id) if @selected_support.present?
			@departure_mails = @departure_mails.where(correspondent_id: Correspondent.find(@selected_correspondent)) if @selected_correspondent.present?
			
			@departure_mails = @departure_mails.where("departure_date BETWEEN ? AND ? ", @selected_departure_date_start, @selected_departure_date_end) if @selected_departure_date_start.present? and  @selected_departure_date_end.present?
			#@departure_mails = @departure_mails.where("receipt_date BETWEEN ? AND ? ", @selected_receipt_date_start, @selected_receipt_date_end) if @selected_receipt_date_start.present? and  @selected_receipt_date_end.present?


		end

	end

end