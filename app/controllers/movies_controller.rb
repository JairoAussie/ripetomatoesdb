class MoviesController < ApplicationController
    before_action :find_movie, only:[:show, :update, :destroy]
    before_action :authenticate_user! , only: [:new, :create]
    def index
        @movies = Movie.all
    end

    def show
        
    end
    def new

        @movie = Movie.new
    end
    def create
        # Movie.create(title: movie_params[:title], genre: movie_params[:genre], year: movie_params[:year], length: movie_params[:length])
        Movie.create(movie_params)
        redirect_to movies_path
    end
    def find_movie
        @movie = Movie.find(params[:id])
    end

    def movie_params
        params.require(:movie).permit(:title, :genre, :year, :length, :price)
    end
end
