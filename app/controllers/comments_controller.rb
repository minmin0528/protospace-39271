class CommentsController < ApplicationController
  before_action :set_prototype

  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
   if @comment.save
   redirect_to @prototype
  else
    render'prototypes/show'
  end
end

  private

  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :other_attribute1, :other_attribute2).merge(prototype_id: params[:prototype_id])
  end
end