class SubscriptionsController < ApplicationController
  def create
    @subscription = Subscription.new(subscription_params)
  
    respond_to do |format|
        if @subscription.save
          format.turbo_stream { render turbo_stream: turbo_stream.replace('footer', partial: 'shared/footer') }
          format.html { redirect_to root_path, notice: "Thank you for subscribing!" }
        else
          format.turbo_stream { render turbo_stream: turbo_stream.replace('subscription_errors', partial: 'shared/subscription_errors', locals: { subscription: @subscription }) }
          format.html { render :new }
        end
      end
  end

  private

  def subscription_params
    params.permit(:email)
  end
end
