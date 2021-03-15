class EditNote
  
  def initialize note_id, title, description
    @title = title
    @description = description
    @note = Note.find_by_id(note_id)
  end

  def valid? 
    @note.present?
  end
  
  def edit
    @note.update(title: @title, description: @description)
  end
end