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
    @hairdresser = Hairdresser.create(hairdresser_params)
    @hairdresser.save ? (redirect_to hairdresser_path(@hairdresser)) : (render 'new')
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
  params.require(:haridresser).permit(:name, :description, :photo, :location)
end
