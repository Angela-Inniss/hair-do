class HairstylesController < ApplicationController
  def index
    if params[:category].present?
      @hairstyles = policy_scope(Hairstyle).order(created_at: :desc)
     # @hairstyles.search_by_category(params[:category])
      @hairstyles = Hairstyle.where(category: params[:category])
    elsif params[:search].present?
      @hairstyles = policy_scope(Hairstyle).order(created_at: :desc)
      @hairstyles = Hairstyle.where('name ILIKE ?', '%#{params[:search]}%')
    else
      # @hairstyles = Hairstyle.all - this is showing all hairstyles w/o pundit
      # below shows all hairstyles with pundit- see  hairstylepolicy resolve mtd
      @hairstyles = policy_scope(Hairstyle).order(created_at: :desc)
    end
  end

  def show
    @hairstyle = Hairstyle.find(params[:id])
    authorize @hairstyle
    @comment = Comment.new
    @saved_hairstyle_exists = SavedHairstyle.where(hairstyle: @hairstyle, user: current_user) == [] ? false : true
    #@comments = @comment.hairstyle
  end

  def new
    @hairstyle = Hairstyle.new
    authorize @hairstyle
  end

  def create
    @hairstyle = Hairstyle.create(hairstyle_params)
    # @hairstyle.save ? (redirect_to hairstyle_path(@hairstyle)):(render 'new')
    @hairstyle.user = current_user
    authorize @hairstyle
    if @hairstyle.save!
      redirect_to hairstyle_path(@hairstyle)
    else
      render 'new'
    end
  end

  def edit
    @hairstyle = Hairstyle.find(params[:id])
    authorize @hairstyle
  end

  def update
    @hairstyle = Hairstyle.find(params[:id])
    @hairstyle.update(hairstyle_params)
    redirect_to hairstyles_path
  end

  def destroy
    @hairstyle = Hairstyle.find(params[:id])
    authorize @hairstyle
    @hairstyle.destroy
    redirect_to hairstyles_path
  end

  def upvote
    @hairstyle = Hairstyle.find(params[:id])
    authorize @hairstyle
    @hairstyle.upvote_from current_user
    redirect_to hairstyles_path
  end

  def downvote
    @hairstyle = Hairstyle.find(params[:id])
    authorize @hairstyle
    @hairstyle.downvote_from current_user
    redirect_to hairstyles_path
  end

  private

  def hairstyle_params
    params.require(:hairstyle).permit(:name, :description, :category, :location, :stylist, :photo, :video_url, :photo_cache)
  end
end
