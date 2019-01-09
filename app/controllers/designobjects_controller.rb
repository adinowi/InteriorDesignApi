class DesignobjectsController < ApplicationController
	before_action :set_designobject, only: [:show]


	def show
		render :show
	end

	def create
		@designobject = Designobject.new(designobject_params)

		if @designobject.save
    		render :endpoint, status: :created, location: @designobject, content_type: "application/json"
    	else
      		render json: @designobject.errors, status: :unprocessable_entity
    	end
	end

	private
		def set_designobject
			@designobject = Designobject.find(params[:id])
		end
		def designobject_params
			params.require([:name, :category, :image, :sfb])
			params.permit(:name, :category, :image, :sfb)
		end


end
