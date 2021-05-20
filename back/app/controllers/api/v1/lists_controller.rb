class Api::V1::ListsController < ApplicationController
  def index
    render json: List.all
  end

  def create
    list = List.new(list_params)
    if list.save
      render json: list
    else
      render json: list.errors, status: 422
    end
  end

  def destroy
    List.destroy(params[id])
  end

  private

  def list_params
    # binding.pry
    params.require(:list).permit(:title)
  end
end
