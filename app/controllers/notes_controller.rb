class NotesController < ApplicationController

  def create
    note = Note.create!(note_params)
    note.roles = Role.where(name: 'owner')
    update_user_id note.shares.last
    render json: { status: 'success', note: note}
  end

  def update_user_id share
    share.update(user_id: current_user.id)
  end

  def index
    render json: { status: 'success', notes_and_roles: notes_and_roles(current_user.shares)}
  end

  def notes_and_roles shares
    details_hash = {}
    current_user.shares.group_by(&:note_id).each do |id, shared_array|
      note = Note.find(id)
      details_hash[id] = {title: note.title, description: note.description, roles: Role.where(id: shared_array.pluck(:role_id)).pluck(:name)}
    end
    details_hash
  end

  def share
    share_note = ShareNote.new(params['share']['user_id'], params['share']['note_id'], params['share']['role_id'])
    if share_note.already_shared?
      status = 422
    else
      share_note.share_it
      status = 200
    end
    render json: { status: status}
  end

  private

  def note_params
    params.require(:note).permit(:title, :description)
  end

end