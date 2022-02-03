class MoviesController < ApplicationController

    def index
        @movies = Movie.all
    end

    def show
        @movie = Movie.find(params[:id])
    end
    def new
        @movie = Movie.new
    end
    def create
        # Movie.create(title: movie_params[:title], genre: movie_params[:genre], year: movie_params[:year], length: movie_params[:length])
        Movie.create(movie_params)
        redirect_to movies_path
    end

    def movie_params
        params.require(:movie).permit(:title, :genre, :year, :length)
    end
end
