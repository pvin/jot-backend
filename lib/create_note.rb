class CreateNote
  
  def self.create note_params, current_user
    note = Note.create!(note_params)
    note.roles = Role.where(name: 'owner')
    update_user_id note.shares.last, current_user
    note
  end

  def self.update_user_id share, current_user
    share.update(user_id: current_user.id)
  end

end