class BookmarksController < ApplicationController
  before_action :set_list, only: %i[create new]

  def new
    @bookmark = Bookmark.new
  end
  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list # Extrae la instancia
    @bookmark.save

    redirect_to(list_path(@bookmark.list_id))
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy

    redirect_to list_path(@bookmark.list_id), status: :see_other
  end
  # Params no va con @, es solo para las urls

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
