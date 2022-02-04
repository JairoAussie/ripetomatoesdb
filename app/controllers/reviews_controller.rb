class ReviewsController < ApplicationController
    before_action :find_movie
    before_action :authenticate_user! , only: [:new, :create]
    def new
        @review = Review.new
    end
    def create
        Review.create(message: review_params[:message], stars: review_params[:stars], movie: @movie, user: current_user)
        redirect_to movie_path(@movie.id)
    end

    def find_movie
        @movie = Movie.find(params[:movie_id])
    end
    def review_params
        params.require(:review).permit(:message, :stars)
    end
 
end
