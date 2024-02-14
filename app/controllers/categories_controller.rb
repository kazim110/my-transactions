class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @user = current_user
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    current_user.categories << @category
    if @category.save
      redirect_to categories_path(@user, @category), notice: "Category was successfully created."
    else
      flash.now[:alert] = "Category wasn't created."
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
