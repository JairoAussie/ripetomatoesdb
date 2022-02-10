class OrdersController < ApplicationController
    before_action :find_movie, only: [:new, :create]
    before_action :authenticate_user! #, only: [:new, :create, :index]
    def index
        @orders = current_user.orders
    end
    
    def new
        @order = Order.new
    end
    def create
        @amount = (@movie.price*100).to_i

        customer = Stripe::Customer.create(
            email: params[:stripeEmail],
            source: params[:stripeToken]
        )
        puts customer
        charge = Stripe::Charge.create(
            customer: customer.id,
            amount: @amount,
            description: 'Rails Stripe customer',
            currency: 'aud'
        )

        puts charge
        
        @order = Order.create( movie: @movie, user: current_user, price: @movie.price, receipt_url: charge.receipt_url)
        rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to movie_path(@movie.id)
    end

    def find_movie
        @movie = Movie.find(params[:movie_id])
    end
    def review_params
        params.require(:review).permit(:message, :stars)
    end
end
