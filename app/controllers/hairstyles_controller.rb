class HairstylesController < ApplicationController
  def index
    @hairstyles = Hairstyle.all
  end

  def show
    @hairstyle =  Hairstyle.find(params[:id])
  end

  def new
    @hairstyle = Hairstyle.new
  end

  def create
    @hairstyle = Hairstyle.create(hairstyle_params)
    @hairstyle.save ? (redirect_to hairstyle_path(@hairstyle)) : (render 'new')
  end

  def edit
   @hairstyle = Hairstyle.find(params[:id])
  end

  def update
    @hairstyle =  Hairstyle.find(params[:id])
  end

  def destroy
    @hairstyle =  Hairstyle.find(params[:id])
  end
end

private

def hairstyle_params
  params.require(:hairstlye).permit(:name, :description, :photo, :video_url)
end
