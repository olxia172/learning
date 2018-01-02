module MoviesHelper
  def avg_rate(movie)
    number_with_precision(movie.opinions.average(:rate), precision: 1)
  end
end
