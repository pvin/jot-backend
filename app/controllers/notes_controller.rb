class NotesController < ApplicationController

  def create
    render json: { status: 'success', note: CreateNote.create(note_params, current_user)}
  end

  def index
    render json: { status: 'success', notes_and_roles: ListNotes.notes_and_roles(current_user.shares, current_user)}
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

  def unshare
    unshare_note = UnshareNote.new(params['share']['user_id'], params['share']['note_id'], params['share']['role_id'])
    if unshare_note.valid_unshared?
      unshare_note.unshare_it
      status = 200
    else
      status = 422
    end
    render json: { status: status}
  end

  def show
    show_note = ShowNote.new(params[:note_id], current_user.id)
    render json: show_note.show
  end

  def edit
    note_id = params[:note_id]
    edit_note = EditNote.new(note_id, params[:title], params[:description])
    if edit_note.valid?
      edit_note.edit
      response = {status: 200, note: ShowNote.new(note_id, current_user.id).show}
    else
      response = {status: 422}
    end
    render json: response
  end
  
  def destroy
    note_id = params[:note_id]
    delete_note = DestroyNote.new(note_id)
    if delete_note.valid?
      delete_note.delete
      response = {status: 200}
    else
      response = {status: 422}
    end
    render json: response
  end

  private

  def note_params
    params.require(:note).permit(:title, :description)
  end

end