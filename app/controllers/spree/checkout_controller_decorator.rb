Spree::Api::V1::CheckoutsController.class_eval do
  before_action :set_affilate, only: :update
  after_action :clear_session, only: :update

  private
    def set_affilate
      if @order.payment? && permitted_checkout_attributes[:affiliate]
        @order.affiliate = Spree::Affiliate.find_by(path: permitted_checkout_attributes[:affiliate])
      end
    end

    def clear_session
      session[:affiliate] = nil if @order.completed?
    end
end
