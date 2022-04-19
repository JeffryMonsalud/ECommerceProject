class ProductsController < InheritedResources::Base

  def index
    @products = Product.all
  end

  def search
    @products = Product.where("name LIKE ?", "%" + params[:name] + "%")
  end

  def newest
    @today = Date.today
    @daterange = 3.days.ago
    @products = Product.all.where(:created_at => @today.beginning_of_day..@daterange.end_of_day)
  end

end