class Movie < ActiveRecord::Base
  def self.ratings_list
    %w(G PG PG-13 R NC-17)
  end
end
