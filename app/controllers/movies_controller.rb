class MoviesController < ApplicationController
  def index
    params[:page] ||= 1
    @movies = MovieService.get_movies_list["Search"]
    if params[:search].present?
      @movies = @movies.select{|movie| movie["Title"].downcase.include?(params[:search].downcase)}
    end
  end

  def show
     @movie = Rails.cache.fetch(params[:id], expires_in: 30.minutes) do
      MovieService.get_movies_list({id: params['id']})
    end
  end

  def search
  end

  def add_to_favorite
    @favourite = Favorite.new(movie_id: params[:id])
    if @favourite.save
      flash[:notice] = 'Movie added to favourites'
    else
      flash[:error] = @favourite.errors.full_messages
    end
    redirect_to movies_path
  end

  def remove_from_favorite
    @favourite = Favorite.find_by(movie_id: params[:id])
    if @favourite.destroy
      flash[:notice] = 'Movie removed from favourites'
    else
      flash[:error] = @favourite.errors.full_messages
    end
    redirect_to movies_path
  end

  def favorites
    favourite_ids = Favorite.pluck(:movie_id)
    movies = MovieService.get_movies_list["Search"]
    @movies = movies.map{|movie| movie if favourite_ids.include?(movie['imdbID'])}.compact
    if params[:search].present?
      @movies = @movies.select{|movie| movie["Title"].downcase.include?(params[:search].downcase)}
    end
  end


end
