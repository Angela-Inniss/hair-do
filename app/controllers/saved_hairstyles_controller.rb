class SavedHairstylesController < ApplicationController
include Pundit
  after_action :verify_authorized, except: [:create, :destroy]

  def create
    # 1. find the hairstyle i want to save
    @hairstyle = Hairstyle.find(params[:hairstyle_id])
    # 2. Create a new instance of saved hairstyle and find the id of the user (current user) &  hairstyle
    @saved_hairstyle = SavedHairstyle.new(user: current_user, hairstyle: @hairstyle)
    # 3. save  hairstyle
    if @saved_hairstyle.save
      respond_to do |format|
        # redirect to hairstyle just liked (hairstyle_path) and the new instance of saved recipe
        # and the saved recipe
        format.html { redirect_to hairstyle_path(@saved_hairstyle.hairstyle) }
        format.js  # <-- will render `app/views/saved_hairstyles/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'hairstyles' }
        format.js  # <-- idem
      end
    end
  end

  def destroy
    # 1. I need to find the recipe I want to unsave
    @saved_hairstyle = SavedHairstyle.find(params[:id])
    # 2. then destroy it
    @saved_hairstyle.destroy
    @hairstyle = @saved_hairstyle.hairstyle
    respond_to do |format|
      format.html { redirect_to hairstyle_path(@saved_hairstyle.hairstyle)}
      format.js
    end
  end
end
