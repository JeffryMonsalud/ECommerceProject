class ProductsController < InheritedResources::Base

  # private

  #   def product_params
  #     params.require(:product).permit(:name, :description, :price, :quantity)
  #   end

  def index
    @products = Product.all
  end

  def search
    @products = Product.where("name LIKE ?", "%" + params[:name] + "%")
  end


end
