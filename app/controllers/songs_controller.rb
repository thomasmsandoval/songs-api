class SongsController < ApplicationController
  def songs
    @songs = Song.all
    render :index
  end

  def create
    @song = Song.create(
      title: params["title"],
      album: params["album"],
      artist: params["artist"],
      year: params["year"],
    )
    render :show
  end

  def update
    @song = Song.find_by(id: params[:id])
    @song.update(
      title: params["title"] || @song.title,
      album: params["album"] || @song.album,
      artist: params["artist"] || @song.artist,
      year: params { "year" } || @song.year,
    )
    render :show
  end

  def destroy
    @song = Song.find_by(id: params[:id])
    @song.destroy
    render json: { message: "Song has been deleted" }
  end

  def show
    @song = Song.find_by(id: params[:id])
    render :show
  end
end
