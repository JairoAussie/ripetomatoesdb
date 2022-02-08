class OrdersController < ApplicationController
    before_action :find_movie
    before_action :authenticate_user! , only: [:new, :create]
    def new
        @order = Order.new
    end
    def create
        @amount = (@movie.price*100).to_i

        customer = Stripe::Customer.create(
            email: params[:stripeEmail],
            source: params[:stripeToken]
        )

        charge = Stripe::Charge.create(
            customer: customer.id,
            amount: @amount,
            description: 'Rails Stripe customer',
            currency: 'aud'
        )

        
        @order = Order.create( movie: @movie, user: current_user, price: @movie.price)
        #
        rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to movie_path(@movie.id)
            # redirect_to new_charge_path
    end

    def find_movie
        @movie = Movie.find(params[:movie_id])
    end
    # def review_params
    #     params.require(:review).permit(:message, :stars)
    # end
end
