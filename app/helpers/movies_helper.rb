module MoviesHelper
  def movie_cancel_link(movie=nil)
    if movie
      link_to  'Cancel', movie_path
    else
      link_to  'Cancel', movies_path
    end
  end

  def sortable(column, title=nil)
    title ||= column.titleize
    direction = (column == sort_column && sort_direction == 'asc') ? 'desc': 'asc'
    css_class = column == sort_column ? "#current #{sort_direction}" : nil

    link_to title, { sort: column, direction: direction }, { :class => css_class }
  end
end
