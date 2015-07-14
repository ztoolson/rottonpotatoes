module MoviesHelper
  def movie_cancel_link(movie=nil)
    if movie
      link_to  'Cancel', movie_path
    else
      link_to  'Cancel', movies_path
    end
  end
end
