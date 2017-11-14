require 'pry'

class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.new(artists_params(:name, :bio))
    @artist.save
    redirect_to artist_path(@artist)
  end

  def update
    @artist = Artist.find_by(params[:id])
    @artist.update(artists_params(:name, :bio))
    redirect_to artist_path(@artist)
  end

  private
    def artists_params(*args)
      params.require(:artist).permit(*args)
    end
end
