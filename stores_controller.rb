class StoresController < ApplicationController
  def index
    stores = Store.all
    render json: stores
  end

  def create
    store = Store.new(store_params)
    if store.save
      render json: { message: 'Store created successfully' }
    else
      render json: { errors: store.errors.full_messages }
    end
  end

  private

  def store_params
    params.require(:store).permit(:name, :email, :address)
  end
end
