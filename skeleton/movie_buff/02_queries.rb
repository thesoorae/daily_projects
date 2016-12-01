def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between 3 and 5 (inclusive).
  # Show the id, title, year, and score.
  Movie
    .select("id", "title", "yr", "score")
    .where("yr BETWEEN 1980 AND 1989 AND score BETWEEN 3 AND 5")
end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.
  Movie
    .where(
      "yr NOT IN (
        SELECT
          yr
        FROM
          movies
        WHERE
          score > 8
      )"
    )
    .group("yr")
    .pluck(:yr)

end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  Casting
    .select("actors.id", "actors.name")
    .joins(:actor)
    .joins(:movie)
    .where("movies.title = ?", title)
    .order("ord")

end

def vanity_projects
  # List the title of all movies in which the director also appeared as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.
  # Actor
  #   .select("movies.id", "movies.title", "actors.name")
  #   .joins(:directed_movies)
  #   .joins(:castings)
  #   .where("castings.actor_id = id AND castings.ord = 1")

  Movie
    .select("movies.id", "movies.title", "actors.name")
    .joins(:castings)
    .joins(:actors)
    .where("movies.director_id = actors.id AND castings.actor_id = actors.id AND castings.ord = 1 ")
end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.

  Actor
    .select("actors.id", "actors.name", "COUNT(castings.id) AS roles ")
    .joins(:castings)
    .where("castings.id NOT IN (
            SELECT
              id
            FROM
              castings
            WHERE
              ord = 1
          )")
    .group("actors.id")
    .order("roles DESC")
    .limit(2)
end
