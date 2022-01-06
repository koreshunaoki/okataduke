class Item::CommentsController < ApplicationController
  def create
    item = Item.find(params[:buy_id])
    comment = current_customer.comments.new(comment_params)
    comment.item_id = item.id
    comment.save!
    redirect_to item_buy_path(item.id)
  end


  def destroy
    Comment.find_by(id: params[:id]).destroy
    redirect_to item_buy_path(params[:buy_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
