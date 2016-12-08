module WikisHelper

  def current_user_is_owner?
    current_user == @wiki.user
  end

  def wiki_owner_is_premium?
    current_user == @wiki.user
    current_user.premium?
  end

  def wiki_owner_is_admin?
    current_user == @wiki.user
    current_user.admin?
  end

  def wiki_owner_is_standard?
    current_user == @wiki.user
    current_user.standard?
  end

  def user_is_authorized_to_mark_wikis_private?
    ((current_user && current_user.premium?) ||
      (current_user && current_user.admin?)) &&
      current_user_is_owner?
  end

  def user_is_authorized_to_edit_private_wikis?
  end

  def wiki_is_private?
    @wiki.private == true
  end

  def wiki_is_public?
    @wiki.private == false
  end

  def user_is_authorized_to_edit_wikis?
      current_user_is_owner? ||
      wiki_is_public? ||
      (wiki_is_private? && (current_user && current_user.premium?)) ||
      (current_user && current_user.admin?)
  end

  def original_submission_by
    if @wiki.created_at?
      @role = @wiki.user.role
        if current_user == @wiki.user
          "Original submission by your badass self!"
        else
          "Original submission by one of our #{@role} members."
        end
      end
    end



end
