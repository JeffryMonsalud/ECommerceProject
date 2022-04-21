class CheckoutController < ApplicationController
    def create
        # if @cart.pluck(:currency).uniq.length > 1
        #     redirect_to products_path, alert: "You can not select products with different currencies in one checkout"
        # else
        #     @session = Stripe::Checkout::Session.create({
        #       customer: current_user.stripe_customer_id,
        #       payment_method_types: ['card'],
        #       line_items: @cart.collect { |item| item.to_builder.attributes! },
        #       mode: 'payment',
        #       success_url: success_url + "?session_id={CHECKOUT_SESSION_ID}",
        #       cancel_url: cancel_url,
        #     })
        #     respond_to do |format|
        #         format.js
        # end
        super(resource)
    
        Stripe.api_key = "#{ENV['STRIPE_API_KEY']}"

        session = Stripe::Checkout::Session.create(
            success_url: "success_url",
            cancel_url: "cancel_url",
            payment_method_types: ['card'],
            mode: 'payment',
            line_items: [{
                quantity: 1,
                price: ENV['STRIPE_PRICE_ID']
            }],
            locale: "fr",
            customer_email: current_user.email
        )

        return session.url
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