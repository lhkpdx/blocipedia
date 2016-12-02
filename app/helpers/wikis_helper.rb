module WikisHelper

  def wiki_owner?
    @wiki = Wiki.find(params[:id])
    current_user == @wiki.user ? true : false
  end
end
