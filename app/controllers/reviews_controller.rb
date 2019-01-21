class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    @product = Product.find(params["product_id"])
    @review = Review.new(review_params)
    @review.user_id = @current_user.id
    if @review.save
      redirect_to :back
    else
      if
      puts @review.errors.to_a
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to :back, notice: 'Product deleted!'
  end

  private
    def review_params
      params.require(:review).permit(:rating, :description, :product_id)
end