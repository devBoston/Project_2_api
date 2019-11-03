# frozen_string_literal: true

# class bondsController < ApplicationController
#   before_action :set_bond, only: [:show, :update, :destroy]
class BondsController < ProtectedController
  # ProtectedController
  before_action :set_bond, only: %i[show update destroy]

  # GET /bonds
  def index
    # @bonds = bond.all
    @bonds = current_user.bonds.all

    render json: @bonds
  end

  # GET /bonds/1
  def show
    render json: @bond
    # render json: bond.find(params[:id])
  end

  # POST /bonds
  def create
    # @bond = bond.new(bond_params)
    @bond = current_user.bonds.build(bond_params)

    if @bond.save
      render json: @bond, status: :created, location: @bond
    else
      render json: @bond.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /bonds/1
  def update
    if @bond.update(bond_params)
      render json: @bond
    else
      render json: @bond.errors, status: :unprocessable_entity
    end
  end

  # DELETE /bonds/1
  def destroy
    @bond.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_bond
    @bond = current_user.bonds.find(params[:id])
    # @bond = bond.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def bond_params
    params.require(:bond).permit(:name, :purchase_on, :start_price, :end_price, :user_id)
  end
end
