class CommentsController < ApplicationController
  def new
    @hairstyle = Hairstyle.find(params[:hairstyle_id])
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @hairstyle = Hairstyle.find(params[:hairstyle_id])
    @hairstyle.comments << @comment
    @comment.save
    redirect_to hairstyle_path(@comment.hairstyle)
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
