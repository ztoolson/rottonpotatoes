class Movie < ActiveRecord::Base
  validates :title, presence: true

  def self.ratings_list
    %w(G PG PG-13 R NC-17)
  end
end
