class CommentsController < ApplicationController
  def new
    @hairstyle = Hairstyle.find(params[:hairstyle_id])
    @comment = Comment.new
  end

  def create
    # we need to find the hairstyle route would be
    # hairstyle/hairstyle id/comments
    @hairstyle = Hairstyle.find(params[:hairstyle_id])
    authorize @hairstyle
    @comment = Comment.new(comment_params)
    @comment.hairstyle = @hairstyle
    @comment.user = @user
    # format looks at the request headers in the browser, console>network>header
    if @comment.save!
      respond_to do |format|
        format.js # will render your create.js.erb file in case of an ajax call
        format.html do
          redirect_to hairstyle_path(@hairstyle) # will redirect to the correct path in case of a html call
        end
      end
    else
      respond_to do |format|
        format.html { render 'hairstyles/show' }
        format.js # <-- idem
      end
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end

=begin  def create
    @comment = Comment.new(comment_params)
    @hairstyle = Hairstyle.find(params[:hairstyle_id])
    @hairstyle.comments << @comment
    @comment.save
    redirect_to hairstyle_path(@comment.hairstyle)
  end
=end
