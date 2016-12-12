class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
  end

  def create
    movie = Movie.create(
      title: params[:title],
      duration: params[:duration], 
      genre: params[:genre], 
      description: params[:description]
      )
    redirect_to "/movies/#{movie["id"]}"
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    movie = Movie.find(params[:id])
    movie.update(
      title: params[:title], 
      duration: params[:duration], 
      genre: params[:genre], 
      description: params[:description]
      )
    redirect_to "/movies/#{movie.id}"
  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to "/movies"
  end
end
