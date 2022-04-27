class ProductsController < InheritedResources::Base

  def index
    @products = Product.all.order(created_at: :desc).page(params[:page]).per(9)
  end

  def search
    @products = Product.where("name LIKE ? AND category_id = ?", "%" + params[:name] + "%", params[:category]).page(params[:page]).per(9)
    # @products = Product.where("name LIKE ?", "%" + params[:name] + "%").page(params[:page]).per(9)
  end

  def newest
    @products = Product.where("created_at > ?", 3.days.ago).page(params[:page]).per(9)
  end

  def add_to_cart
    id = params[:id].to_i
    quantity = params[:quantity].to_i
    session[:productquantity] << quantity
    session[:cart] << id unless session[:cart].include?(id)
    redirect_back(fallback_location: root_path)
  end

  def remove_from_cart
    id = params[:id].to_i
    session[:cart].delete(id)
    redirect_back(fallback_location: root_path)
  end

end