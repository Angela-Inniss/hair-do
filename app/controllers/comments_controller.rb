class CommentsController < ApplicationController
  def new
    @hairstyle = Hairstyle.find(params[:hairstyle_id])
    @comment = Comment.new
  end

  def create
    # we need to find the hairstyle route would be
    # hairstyle/hairstyle id/comments
    @hairstyle = Hairstyle.find(params[:hairstyle_id])
    @comment = Comment.new(comment_params)
    @comment.hairstyle = @hairstyle
    if @comment.save
      redirect_to hairstyle_path(@hairstyle)
    else
      render 'hairstyles/show'
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
