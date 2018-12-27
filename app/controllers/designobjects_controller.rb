class DesignobjectsController < ApplicationController
	before_action :set_designobject, only: [:show]

	def show
		render :show
	end

	private
		def set_designobject
			@designobject = Designobject.find(params[:id])
		end

end
