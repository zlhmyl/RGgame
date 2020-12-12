class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  def create
    @micropost = current_user.microposts.build(micropost_params)
    # @micropost.tags = TextRank.extract_keywords(@micropost.content)
    # algor = RMMSeg::Algorithm.new(@micropost.content)
    # loop do
    #   tok = algor.next_token
    #   break if tok.nil?
    #   # puts "#{tok.text} [#{tok.start}..#{tok.end}]"
    #   @micropost.tags = tok.text
    # end
        if @micropost.save
      flash[:success] = "帖子发布成功!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  def destroy
    @micropost.destroy
    flash[:success] = "帖子删除成功!"
    redirect_to request.referrer || root_url
  end
  def show
    @micropost = Micropost.find(params[:id])
    store_micropost @micropost
    @user = current_user
    @comment  = @micropost.comments.build
    @comments_items = @micropost.feed.paginate(page: params[:page])
  end
  private
  def micropost_params
    params.require(:micropost).permit(:title, :content)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
