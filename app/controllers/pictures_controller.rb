class PicturesController < ApplicationController
	
	def index
		@pictures = Picture.all
	end 

	def show
		id = params[:id]
		@picture = Picture.find(id)
	end 

end
