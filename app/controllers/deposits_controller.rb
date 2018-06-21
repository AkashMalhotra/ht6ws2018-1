class DepositsController < ApplicationController
  def index
    @deposit = Deposit.order("id")
  end

  def show
    @deposit = Deposit.find(params[:id])
  end

  def new
    @deposit = Deposit.new
  end

  def create
    @deposit = Deposit.new(deposit_params)
    if @deposit.save
      redirect_to ("/accessed/currentdeposit")
    else
      render :new
    end
  end

  def edit
    @deposit = Product.find(params[:id])
  end

  def update
    @deposit = Product.find(params[:id])
    if @deposit.update_attributes(params[:deposit])
      redirect_to @deposit, notice: "Successfully created deposit."
    else
      render :edit
    end
  end

  def destroy
    @deposit = Product.find(params[:id])
    @deposit.destroy
    redirect_to products_url, notice: "Successfully destroyed deposit."
  end

  def deposit_params
    params.permit(:name, :waccount, :daccount,:dtype, :value)
  end
end
