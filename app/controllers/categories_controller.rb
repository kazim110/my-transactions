class CategoriesController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @purchases = @category.purchases.order(created_at: :desc)
  end

  def new
    @user = current_user
    @category = current_user.categories.build
  end

  def edit
    @category = current_user.categories.build
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @category = current_user.categories.build(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to categories_path, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])

    @category.purchases.destroy_all

    @category.destroy
    redirect_to categories_url, notice: 'Category and all associated purchases were successfully destroyed.'
  end

  private

  def set_category
    @category = current_user.categories.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
