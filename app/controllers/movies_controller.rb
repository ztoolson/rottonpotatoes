class MoviesController < ApplicationController
  def index
    sort_column = params[:sort] || :title # default sort by title
    @movies = Movie.order(sort_column)
  end

  def show
    if @movie = Movie.find_by_id(params[:id])
      render :show
    else
      flash[:warning] = 'Movie not in database.'
      redirect_to movies_path
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    flash[:notice] = "#{@movie.title} successfully created"
    redirect_to movie_path(@movie)
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    @movie.update_attributes(movie_params)
    flash[:notice] = "#{@movie.title} successfully updated"
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "#{@movie.title} has been deleted"
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end
end
