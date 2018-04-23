class PicturesController < ApplicationController
	
	def index
		@pictures = Picture.newest_first
		@most_recent_pictures = Picture.most_recent_five
		@picture_year = Picture.pictures_created_in_year(Time.now - 1.year)
		@picture_month = Picture.created_before(Time.now - 1.month)
	end 

	def show
		id = params[:id]
		@picture = Picture.find(id)

		@picture_owner = @picture.user

	end 

	def new 
		ensure_login
			@picture = Picture.new
	end 

	def create
		ensure_login
			@picture = Picture.new

			@picture.title = params[:picture][:title]
			@picture.artist = params[:picture][:artist]
			@picture.url = params[:picture][:url]
			@picture.user_id = current_user.id

		if @picture.save
			#if the picture gets saved, generate a get request to "/pictures" (the index)
			redirect_to "/pictures"
		else 
			#otherwise render new.html.erb
			render :new
		end 
	end 

	def destroy
		@picture = Picture.find(params[:id])

	 	if current_user.id == @picture.user.id
			
			@picture.destroy 
			redirect_to '/pictures'
		else
			
			redirect_to pictures_path, flash: {notice: 'must be picture owner to destroy'}
		end
	end 

	def edit
		@picture = Picture.find(params[:id])
		if current_user == @picture.user
			render :edit
		else
			redirect_to pictures_path, flash: {notice: 'must be picture owner to destroy'}
		end
	end 

	def update
		@picture = Picture.find(params[:id])

		if current_user.id == @picture.user.id

			@picture.title = params[:picture][:title]
			@picture.artist = params[:picture][:artist]
			@picture.url = params[:picture][:url]
			
			if @picture.save
				redirect_to "/pictures/#{@picture.id}"
			end
		else 
			redirect_to pictures_path
		end
	end
end
