module MoviesHelper
  def avg_rate(movie)
    number_with_precision(movie.opinions.average(:rate), precision: 1)
  end

  def genres(movie)
    genres = movie.genre_ids.map do |id|
      Genre.find(id).name
    end
    genres.join(', ')
  end
end
