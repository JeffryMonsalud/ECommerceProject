class CheckoutController < ApplicationController
    def create
        product = Product.find(params[:id])

        # if @cart.pluck(:currency).uniq.length > 1
        #   redirect_to products_path, alert: "You can not select products with different currencies in one checkout"
        # else
          @session = Stripe::Checkout::Session.create({
            customer: current_user,
            payment_method_types: ['card'],
            line_items: [
              {
                name: product.name,
                description: product.description,
                amount: product.price,
                currency: "cad",
                quantity: 1 # We will hardcode one for this demo.
              }
              # ,
              #   {
              #   name: "GST",
              #   description: "Goods and Services Tax",
              #   amount: (product.price_cents * 0.05).to_i,
              #   currency: "cad",
              #   quantity: 1
              #   }
              ],
            allow_promotion_codes: true,
            mode: 'payment',
            success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
            cancel_url: cancel_url,
          })
          redirect_to @session.url
        # end
      end
  
    def success
        @session_with_expand = Stripe::Checkout::Session.retrieve({ id: params[:session_id], expand: ["line_items"]})
        @esssion_with_expand.line_items.data.each do |line_item|
            product = Product.find_by(stripe_product_id: line_item.price.product)
        end
    end
  
    def cancel
    end
  
  end