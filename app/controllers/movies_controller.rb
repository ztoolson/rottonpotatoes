class MoviesController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @ratings = Movie.ratings_list

    submitted_ratings = permitted_ratings_params || session[:ratings]

    if submitted_ratings
      update_ratings_in_session(submitted_ratings)
      @movies = Movie.where(:rating => submitted_ratings).order({sort_column => sort_direction})
    else
      save_all_ratings_in_session
      @movies = Movie.order({sort_column => sort_direction})
    end
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

  def search_tmdb
    redirect_to movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def permitted_ratings_params
    return unless params[:ratings]

    ratings = []
    params[:ratings].each do |rating, value| 
      ratings << rating if Movie.ratings_list.include?(rating)
    end

    ratings
  end

  def save_all_ratings_in_session
    session[:ratings] = Movie.ratings_list
  end

  def sort_column
    %w(title rating release_date).include?(params[:sort]) ? params[:sort] : 'title'
  end

  def sort_direction
    %w(asc desc).include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def update_ratings_in_session(ratings)
    session[:ratings] = ratings
  end
end
