# frozen_string_literal: true

# class StocksController < ApplicationController
#   before_action :set_stock, only: [:show, :update, :destroy]
class StocksController < ProtectedController
  # ProtectedController
  before_action :set_stock, only: %i[show update destroy]

  # GET /stocks
  def index
    # @stocks = Stock.all
    @stocks = current_user.stocks.all

    render json: @stocks
  end

  # GET /stocks/1
  def show
    render json: @stock
    # render json: Stock.find(params[:id])
  end

  # POST /stocks
  def create
    # @stock = Stock.new(stock_params)
    @stock = current_user.stocks.build(stock_params)

    if @stock.save
      render json: @stock, status: :created, location: @stock
    else
      render json: @stock.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stocks/1
  def update
    if @stock.update(stock_params)
      render json: @stock
    else
      render json: @stock.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stocks/1
  def destroy
    @stock.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_stock
    @stock = current_user.stocks.find(params[:id])
    # @stock = Stock.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def stock_params
    params.require(:stock).permit(:name, :purchase_on, :start_price, :end_price, :user_id)
  end
end
