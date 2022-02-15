class MoviesController < ApplicationController
    before_action :find_movie, only:[:show, :edit, :update, :destroy]
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
        movie = Movie.create(movie_params)
        redirect_to movies_path, notice: "#{movie.title} was created successfully"
        rescue StandardError => e
            puts e.message
            redirect_to movies_path, notice: "#{movie.title} wasn't created"
        end
    end
    def destroy
        title= @movie.title
        @movie.destroy
        #Movie.destroy(params[:id])
        redirect_to movies_path, notice: "#{title} was deleted successfully"
    end

    def edit

    end

    def update
        @movie.update(movie_params)
        redirect_to @movie, notice: "#{@movie.title} was updated successfully"
    end

    def find_movie
        begin
            @movie = Movie.find(params[:id])
        rescue StandardError => e
            puts e.message
            #flash[:error] = e.message
            redirect_to movies_path, alert: "This id #{params[:id]} doesn't exist in the DB"
        end

    end

    def movie_params
        params.require(:movie).permit(:title, :genre, :year, :length, :price, :picture)
    end
end
