class Movie
  attr_accessor :id, :title, :duration, :genre, :description, :actors

  def initialize(opts)
    @id = opts[:id]
    @title = opts[:title]
    @duration = opts[:duration]
    @genre = opts[:genre]
    @description = opts[:description]
    @actors = opts[:actors]
  end

  def self.find(id)
    movies_hash = Unirest.get("http://localhost:3000/api/v1/movies/#{id}", headers: { 'Authorization' => 'Token token=icecream', 'X-User-Email' => 'vanilla@gmail.com' }).body
    movie = Movie.new(
      id: movies_hash['id'],
      title: movies_hash['title'],
      duration: movies_hash['duration'],
      genre: movies_hash['genre'],
      description: movies_hash['description'],
      actors: movies_hash['actors']
      )
    return movie
  end

  def self.all
    movies_hash_array = Unirest.get('http://localhost:3000/api/v1/movies', headers: { 'Authorization' => 'Token token=icecream', 'X-User-Email' => 'vanilla@gmail.com' }).body
    movies = []
    movies_hash_array.each do |movies_hash|
      movies << Movie.new(
        id: movies_hash['id'],
        title: movies_hash['title'],
        duration: movies_hash['duration'],
        genre: movies_hash['genre'],
        description: movies_hash['description'],
        actors: movies_hash['actors']
        )
    end
    return movies
  end

  def self.create(opts)
    Unirest.post('http://localhost:3000/api/v1/movies', 
      headers: { "Accept" => "application/json", 'Authorization' => 'Token token=icecream', 'X-User-Email' => 'vanilla@gmail.com' },
      parameters: { 
        title: opts[:title], 
        duration: opts[:duration], 
        genre: opts[:genre], 
        description: opts[:description]}
      ).body
  end

  def update(opts)
    movie = Unirest.patch("http://localhost:3000/api/v1/movies/#{id}", 
      headers: { "Accept" => "application/json", 'Authorization' => 'Token token=icecream', 'X-User-Email' => 'vanilla@gmail.com' },
      parameters: { 
        title: opts[:title], 
        duration: opts[:duration], 
        genre: opts[:genre], 
        description: opts[:description]}
      )
  end

  def destroy
    Unirest.delete("http://localhost:3000/api/v1/movies/#{id}", headers: { 'Authorization' => 'Token token=icecream', 'X-User-Email' => 'vanilla@gmail.com' }).body
  end
end