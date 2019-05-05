class MerchantsListsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def new

  end

  def create
   # MerchantsList.parse(file_path)
    MerchantsList.create(list_params)
    redirect_to merchants_lists_url
  end

  private

  def list_params
    params.require(:merchants_list).permit(:list_file)
  end

  def file_path
    params.dig(:merchants_list, :list_file)
  end
end
