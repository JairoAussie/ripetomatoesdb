class OrdersController < ApplicationController
    before_action :find_movie
    before_action :authenticate_user! , only: [:new, :create]
    def new
        @order = Order.new
    end
    def create
        Order.create(movie: @movie, user: current_user, price: @movie.price)
        redirect_to movie_path(@movie.id)
    end

    def find_movie
        @movie = Movie.find(params[:movie_id])
    end
    def review_params
        params.require(:review).permit(:message, :stars)
    end
end
