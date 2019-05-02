class MerchantsListsController < ApplicationController
  def index
    @merchants = Merchant.all
  end

  def new

  end

  def create
    MerchantsList.parse(file_path)
  end

  private

  def file_path
    params.dig(:merchants_list, :list_file)
  end
end
