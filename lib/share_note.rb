class ShareNote

  def initialize user_id, note_id, role_id
    @role = role_with role_id.to_i
    @user = share_with user_id.to_i
    @note = sharing_note note_id.to_i
  end

  def share_it
    @note.roles << [@role]
    update_user
  end

  def update_user
    Share.where(role_id: @role.id, note_id: @note.id).first.update(user_id: @user.id)
  end

  def role_with role_id
    Role.find(role_id)
  end

  def share_with user_id
    User.find(user_id)
  end

  def sharing_note note_id
    Note.find(note_id)
  end

  def already_shared?
    Share.where(role_id: @role.id, user_id: @user.id, note_id: @note.id).present?
  end

end