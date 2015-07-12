class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = movie_from_params_id
  end

  def new
  end

  def create
    @movie = Movie.create(movie_params)
    flash[:notice] = "#{@movie.title} successfully created"
    redirect_to_movies_path
  end

  def edit
    @movie = movie_from_params_id
  end

  def update
    @movie = movie_from_params_id.update_attributes(movie_params)
    flash[:notice] = "#{@movie.title} successfully updated"
    redirect_to_movies_path
  end

  def destroy
    @movie = movie_from_params_id
    @movie.destroy
    flash[:notice] = "#{@movie.title} has been deleted"
    redirect_to_movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def movie_from_params_id
    @movie = Movie.find_by_id(params[:id])
  end
end
