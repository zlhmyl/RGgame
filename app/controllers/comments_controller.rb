class CommentsController < ApplicationController
  def create
    @micropost = Micropost.find(current_micropost.id)
    @comment = current_micropost.comments.build(comment_params)
    if @comment.save
      flash[:success] = "评论发布成功!"
      redirect_to @micropost
    else
      render 'static_pages/home'
    end
  end
  def destroy
    @comment.destroy
    flash[:success] = "评论删除成功!"
    redirect_to request.referrer || root_url
  end
  private
  def comment_params
    params.require(:comment).permit(:content)
  end

end