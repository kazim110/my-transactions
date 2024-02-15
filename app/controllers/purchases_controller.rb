class PurchasesController < ApplicationController
  layout 'application'
  before_action :authenticate_user!

  def new
    @category = Category.find(params[:category_id])
    @purchase = @category.purchases.build
  end

  def create
    @user = current_user
    @category = @user.categories.find(params[:category_id])
    @purchase = @category.purchases.new(purchase_params.merge(author: @user))

    respond_to do |format|
      if @purchase.save
        format.html { redirect_to categories_path(@category), notice: 'Purchase was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:name, :amount, :category_id)
  end
end
