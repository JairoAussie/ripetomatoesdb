class ReviewsController < ApplicationController
    def new
        @movie = Movie.find(params[:movie_id])
        @review = Review.new
    end
    def create
        movie = Movie.find(params[:movie_id])
        Review.create(message: review_params[:message], stars: review_params[:stars], movie: movie)
        redirect_to movie_path(movie.id)
    end

    def review_params
        params.require(:review).permit(:message, :stars)
    end
end
