class PortfoliosController < ApplicationController
	before_action :set_portfolio_item, only: [:edit, :update, :destroy, :show]
	layout 'portfolio'
	access all: [:show, :index, :angular, :ruby_on_rails], user: {except: [:destroy, :new, :create, :update, :edit, :sort ]}, site_admin: :all

	def index
		@portfolio_items = Portfolio.by_position
	end

	def angular
	  @portfolio_items = Portfolio.angular
	end

	def ruby_on_rails
	  @portfolio_items = Portfolio.ruby_on_rails
	end

	def new
		@portfolio_item = Portfolio.new
	end

	def sort
	  params[:order].each do |key, value|
			Portfolio.find(value[:id]).update(position: value[:position])
		end
		head :ok
	end

	def create
		@portfolio_item = Portfolio.new(portfolio_params)

		respond_to do |format|
			if @portfolio_item.save
				format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
				format.json { render :show, status: :created, location: @portfolio_item }
			else
				format.html { render :new, notice: 'Failed to create portfolio item' }
				format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update

		respond_to do |format|
			if @portfolio_item.update(portfolio_params)
				format.html { redirect_to portfolios_path, notice: 'Portfolio Item was successfully updated.' }
				format.json { render :show, status: :ok, location: @portfolio }
			else
				format.html { render :edit }
				format.json { render json: @portfolio.errors, status: :unprocessable_entity }
			end
		end
	end

	def show
	end

	def destroy
		#Find portfolio item via ID

		#Delete said portfolio item
		@portfolio_item.destroy

		#Redirct to Home after deletion
		respond_to do |format|
			format.html { redirect_to portfolios_url, notice: 'Portfolio Item was successfully destroyed.' }
			format.json { head :no_content }
		end

	end

	private
		def portfolio_params
		  params.require(:portfolio).permit(:title,
																	 :subtitle,
																	 :body,
																	 :main_image,
																	 :thumb_image,
																	 technologies_attributes: [:id, :name, :_destroy]
																 	)
		end

		def set_portfolio_item
			@portfolio_item = Portfolio.find(params[:id])
		end

end
