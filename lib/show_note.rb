class ShowNote
	
	def initialize note_id, user_id
		@note_id = note_id
		@user_id = user_id
	end

	def show
		note = Note.find(@note_id)
		if note
      roles = Role.find(Share.where(user_id: @user_id, note_id: note.id).pluck(:role_id)).pluck(:name)
      response = { status: 200, title: note.title, description: note.description, role: roles}
    else
      response = { status: 404 }
    end
	end
end