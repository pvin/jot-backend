class DestroyNote

	def initialize note_id
		@note = Note.find_by_id(note_id)
	end

	def valid?
		@note.present?
	end

	def delete
		@note.delete
	end
end