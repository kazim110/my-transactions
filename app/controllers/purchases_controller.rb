class PurchasesController < ApplicationController
  layout 'application'
  before_action :authenticate_user!
  before_action :set_purchase, only: %i[show edit update destroy]
  before_action :set_categories, only: %i[new edit]

  def new
    @category = Category.find(params[:category_id])
    @purchase = @category.purchases.build
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def edit; end

  def update
    if @purchase.update(purchase_params)
      redirect_to purchase_path(@purchase), notice: 'Purchase was successfully updated.'
    else
      set_categories
      render :edit
    end
  end

  def create
    @user = current_user
    @category = @user.categories.find(params[:category_id])
    @purchase = @category.purchases.new(purchase_params.merge(author: @user))

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to category_path(@purchase.category), notice: 'Purchase was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @purchase.destroy
    redirect_to categories_url, notice: 'Category and all associated purchases were successfully destroyed.'
  end

  private

  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def set_categories
    @categories = current_user.categories
  end

  def purchase_params
    params.require(:purchase).permit(:name, :amount, :category_id)
  end
end
