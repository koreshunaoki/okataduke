class CommentsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    comment = current_user.comments.new(comment_params)
    comment.item_id = item.id
    if comment.commment.present?
      comment.save
    else
      render :show
    end
    redirect_to item_buy_path(@item)
  end


  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to item_buy_path(params[:item_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

end
