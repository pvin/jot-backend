class ListNotes
  def self.notes_and_roles shares, current_user
    details_hash = {}
    current_user.shares.group_by(&:note_id).each do |id, shared_array|
      note = Note.find(id)
      details_hash[id] = {title: note.title, description: note.description, roles: Role.where(id: shared_array.pluck(:role_id)).pluck(:name)}
    end
    details_hash
  end
end