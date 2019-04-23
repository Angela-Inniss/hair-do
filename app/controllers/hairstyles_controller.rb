class HairstylesController < ApplicationController
  def index
    if params[:category].present?
     # @hairstyles.search_by_category(params[:category])
      @hairstyles = Hairstyle.where(category: params[:category])
    elsif params[:search].present?
      @hairstyles = Hairstyle.where('name ILIKE ?', '%#{params[:search]}%')
    else
      @hairstyles = Hairstyle.all
    end
  end

  def show
    @hairstyle = Hairstyle.find(params[:id])
    @comment = Comment.new
    #@comments = @comment.hairstyle
  end

  def new
    @hairstyle = Hairstyle.new
  end

  def create
    @hairstyle = Hairstyle.create(hairstyle_params)
    # @hairstyle.save ? (redirect_to hairstyle_path(@hairstyle)):(render 'new')
    if @hairstyle.save!
      redirect_to hairstyle_path(@hairstyle)
    else
      render 'new'
    end
  end

  def edit
    @hairstyle = Hairstyle.find(params[:id])

  end

  def update
    @hairstyle = Hairstyle.find(params[:id])
    @hairstyle.update(hairstyle_params)
    redirect_to hairstyles_path
  end

  def destroy
    @hairstyle =  Hairstyle.find(params[:id])
    @hairstyle.destroy
    redirect_to hairstyles_path
  end

  private

  def hairstyle_params
    params.require(:hairstyle).permit(:name, :description, :category, :location, :stylist, :photo, :video_url, :photo_cache)
  end
end

