class UnshareNote
	def initialize user_id, note_id, role_id
    @role = role_with role_id.to_i
    @user = share_with user_id.to_i
    @note = sharing_note note_id.to_i
  end

  def unshare_it
  	Share.where(role_id: @role.id, user_id: @user.id, note_id: @note.id).delete_all
  end

  def role_with role_id
    Role.find_by_id(role_id)
  end

  def share_with user_id
    User.find_by_id(user_id)
  end

  def sharing_note note_id
    Note.find_by_id(note_id)
  end

  def valid_unshared?
    @role.present? && @note.present? && @user.present? && Share.where(role_id: @role.id, user_id: @user.id, note_id: @note.id).present?
  end	
end	