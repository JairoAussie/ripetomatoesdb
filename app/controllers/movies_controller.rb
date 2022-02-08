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
        begin
            Movie.create(movie_params)
            flash.now[:notice] = 'Message sent!'
            redirect_to movies_path
        rescue StandardError => e
            flash[:error] = "Couldn't create the movie"
            flash.now[:alert] = 'Error while creating the movie!'
            puts e.message
            alert = 'Danger!'
        end  
    end
    def find_movie
        begin
            @movie = Movie.find(params[:id])
        rescue StandardError => e
            flash[:error] = e.message
            flash.now[:alert] = 'Wrong id, try with a valid one'
            redirect_to movies_path, alert: 'wrong id!!'
        end
    end

    def movie_params
        params.require(:movie).permit(:title, :genre, :year, :length, :price)
    end
end
