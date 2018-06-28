class PortfoliosController < ApplicationController
	def index
		@portfolio_items = Portfolio.all
	end

	def new
		@portfolio_item = Portfolio.new
	end

	def create
		@portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))

		respond_to do |format|
			if @portfolio_item.save
				format.html { redirect_to portfolios_path, notice: 'Your portfolio item is now live.' }
				format.json { render :show, status: :created, location: @portfolio_item }
			else
				format.html { render :new }
				format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
		@portfolio_item = Portfolio.find(params[:id])
	end

	def update
		@portfolio_item = Portfolio.find(params[:id])

		respond_to do |format|
			if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
				format.html { redirect_to portfolios_path, notice: 'Portfolio Item was successfully updated.' }
				format.json { render :show, status: :ok, location: @portfolio }
			else
				format.html { render :edit }
				format.json { render json: @portfolio.errors, status: :unprocessable_entity }
			end
		end
	end

	def show
		@portfolio_item = Portfolio.find(params[:id])
	end

	def destroy
		#Find portfolio item via ID
		@portfolio_item = Portfolio.find(params[:id])

		#Delete said portfolio item
		@portfolio_item.destroy

		#Redirct to Home after deletion
		respond_to do |format|
			format.html { redirect_to portfolios_url, notice: 'Portfolio Item was successfully destroyed.' }
			format.json { head :no_content }
		end

	end

end