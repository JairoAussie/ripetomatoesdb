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
        movie = Movie.create(title: movie_params[:title], genre: movie_params[:genre], year: movie_params[:year].to_i, length: movie_params[:length].to_i)

		redirect_to movie_path(movie.id)
    end

    def movie_params
		params.require(:movie).permit(:title, :genre, :year, :length)
	end
end
