class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include MicropostsHelper
  private
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "请登录."
      redirect_to root_path
    end
  end
end
