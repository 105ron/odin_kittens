class KittensController < ApplicationController

	def index
		@kittens = Kitten.all
		respond_to do |format|
      format.html # index.html.erb 
      format.json { render :json => @kittens }
    end
	end

	def create
		@kitten = Kitten.new(kitten_params)
		if @kitten.save
      flash[:success] = "Your account was successfully saved."
      redirect_to root_url
    else
      render 'new'
    end
	end

	def new
		@kitten = Kitten.new
	end

	def edit 
		@kitten = Kitten.find_by(id: params[:id])
	end

	def show
		@kitten = Kitten.find_by(id: params[:id])
		respond_to do |format|
      format.html # index.html.erb 
      format.json { render :json => @kitten }
    end
	end

	def update
		@kitten = Kitten.find_by(id: params[:id])
    if @kitten.update_attributes(kitten_params)
      flash[:success] = "Your account was successfully updated."
      redirect_to root_url
    else
      render 'new'
    end
	end
	
	def destroy
		Kitten.find(params[:id]).destroy
    flash[:success] = "Poor kitty deleted"
    redirect_to kittens_path
	end

	private

		def kitten_params
			params.require(:kitten).permit(:name, :age, :cuteness, :softness)
		end
end
