class ToppagesController < ApplicationController
  def index
    if logged_in?
      @post = current_user.posts.build  # form_with 用
      @pagy, @posts = pagy(current_user.feed_posts.order(id: :desc), items: 3)
    end
  end
end
