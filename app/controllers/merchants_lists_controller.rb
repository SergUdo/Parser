class MerchantsListsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  skip_before_action:verify_authenticity_token

  def index
    @merchants = Merchant.all
  end

  def new
  end

  def create
    MerchantsList.create(list_params)
    redirect_to merchants_lists_url
  end

  private

  def list_params
    params.require(:merchants_list).permit(:list_file, :ignore_header)
  end
end
