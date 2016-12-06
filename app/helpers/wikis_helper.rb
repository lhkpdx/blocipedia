module WikisHelper

  def user_is_authorized_for_private_wikis
    current_user.admin? || current_user.premium?
  end

  def original_submission_by
      @wiki = Wiki.find(params[:id])
      @role = @wiki.user.role
        if current_user == @wiki.user
          "Original submission by your badass self!"
        else
          "Original submission by one of our #{@role} members."
        end

    end

end
