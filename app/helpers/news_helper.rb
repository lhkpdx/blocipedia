module NewsHelper

  def user_is_article_owner?
    news.user == current_user
  end

end
