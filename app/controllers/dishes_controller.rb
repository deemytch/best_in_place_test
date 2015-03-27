class DishesController < ApplicationController
  before_action :set_dish, only: [:show, :edit, :update, :destroy]

  def index
    @cuisines = Cuisine.all.order(:name)
    @dish = Dish.new cuisine: @cuisines.first, available: false
  end

  def new
  end

  def create
  end

  def edit
    @dish.code ||= SecureRandom.random_number(10000000)
    render 'dish', layout: !request.xhr?
  end

  def update
  end

  private
  def set_dish
    @dish = Dish.find(params[:id])
  end
  def dish_params
    params.require(:dish).permit(:name, :available, :price, :descr, :code)
  end
end
