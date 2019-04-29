class SavedHairstylesController < ApplicationController
  def update
  # grab reference to the favourite and see if the fav exitsts
  # We grab the hairstyle params "(params[:hairstyle])" which we are going to
  # pass in i.e name, image, description etc
  # we are calling "Hairstyle.find" on those params to find the id of the
  # hairstyle that will be saved, then we need a ref to the user "current_user"
  saved_hairstyle = SavedHairstyle.where(hairstyle: Hairstyle.find(params[:hairstyle]), user: current_user)
 # if the savedhairstyle(bookmark) does not exist we need to create it
  if saved_hairstyle == []
    SavedHairstyle.create(hairstyle: Hairstlye.find(params[:hairstyle]), user: current_user)
    @saved_hairstyle._exists = true
  else
    # delete the saved hairstyle(s)
    saved_hairstyle.destroy_all
    @saved_hairstyle_exists = false
  end
  respond_to do |format|
    format.html {}
    format.js {}
  end
  end

  def show
    @saved_hairstyle = SavedHairstyle.where(hairstyle: Hairstyle.find(params[:hairstyle]), user: current_user)
  end
end
