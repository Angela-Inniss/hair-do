#
class HairdressersController < ApplicationController
  def index
    @hairdressers = Hairdresser.all
  end

  def show
    @hairdresser = Hairdresser.find(params[:id])
  end

  def new
    @hairdresser = Hairdresser.new
  end

  def create
    @hairdresser = Hairdresser.new(hairdresser_params)
    # @hairdresser.save ? (redirect_to hairdresser_path(@hairdresser)) : (render 'new')
      if @hairdresser.save!
        redirect_to hairdresser_path(@hairdresser)
      else
        render 'new'
      end
  end

  def edit
    @hairdresser = Hairdresser.find(params[:id])
  end

  def update
    @hairdresser =  Hairdresser.find(params[:id])
  end

  def destroy
    @hairdresser =  Hairdresser.find(params[:id])
  end
end
private

def hairdresser_params
  params.require(:hairdresser).permit(:name, :address, :photo, :location, :description, :photo_cache)
end
