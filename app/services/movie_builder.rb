  class MovieBuilder
    def initialize(tmdb_id:)
      @tmdb_id = tmdb_id
      @movie = Movie.find_or_initialize_by(tmdb_id: @tmdb_id)
      Tmdb::Api.key("3deceb9041e72a8856191ddeaf96a293")
    Tmdb::Api.language("en")
    end

    def build!
      return @movie unless @movie.new_record?

      @fetched_movie = Tmdb::Movie.detail(@tmdb_id)

      @movie.title = @fetched_movie.title
      @movie.plot = @fetched_movie.overview
      @movie.release_date = @fetched_movie.release_date
      @movie.released = true if (@fetched_movie.release_date[0...4].to_i <= Time.now.year)
      @movie.runtime = @fetched_movie.runtime
      @movie.popularity = @fetched_movie.popularity
      @movie.genre = @fetched_movie.genres.collect { |x| x[:name] }
      @fetched_movie.genres.each { |x| @movie.genre += (x.name + " ")}
      @movie.language = @fetched_movie.original_language
      @movie.budget = @fetched_movie.budget
      @movie.average_vote = @fetched_movie.vote_average
      @movie.vote_count = @fetched_movie.vote_count
      @movie.poster = @fetched_movie.poster_path
      @movie.homepage = @fetched_movie.homepage
      @movie.tmdb_id = @fetched_movie.id
      @movie.imdb_id = @fetched_movie.imdb_id

      @movie.save

      return @movie
    end
  end







  







  