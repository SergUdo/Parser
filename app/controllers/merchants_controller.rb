class MerchantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_merchant, only: %i[show edit update]

  def new
    @merchant = Merchant.new 
  end

  def show
  end

  def index
    @merchants = Merchants.paginate(index_params)
  end

  def create
    @merchant = Merchant.new(merchant_params)
    if @merchant.save 
      redirect_to @merchant
    end
  end

  def edit
  end

  def update
    if @merchant.update_attributes(merchant_params)
      flash[:success] = "Profile updated"
      redirect_to @merchant
    else
      render 'edit'
  end
end

  def destroy
  end

  protected

  def index_params
    params.permit(:page)
  end

  def set_merchant
    @merchant = Merchant.find(params[:id])
  end

  def merchant_params
    params.require(:merchant).permit(
                                      :name, :owner, :kind, :address,
                                      :city, :latitude, :longitude
                                      )
  end

end
