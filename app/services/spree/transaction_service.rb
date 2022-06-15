module Spree
  class TransactionService

    attr_accessor :transaction, :affiliate, :affiliate_commission_rule, :amount

    def calculate_commission_amount
      if affiliate_commission_rule.present?
        rate = affiliate_commission_rule.rate
        if affiliate_commission_rule.fixed_commission?
          @amount = rate
        else
          @amount = (item_total * (rate))/100
        end
        @amount.to_f
      end
    end

    private

      def item_total
        commissionable = transaction.commissionable
        if commissionable.partner_delivery
          commissionable.adjustments.partner_delivery.sum(:amount)
        else
          commissionable.item_total
        end
      end

      def initialize(transaction)
        @transaction = transaction
        @affiliate = transaction.affiliate
        if @transaction.commissionable_type.eql? 'Spree::User'
          @affiliate_commission_rule = affiliate.affiliate_commission_rules.active.user_registration.first
        elsif @transaction.commissionable_type.eql? 'Spree::Order'
          @affiliate_commission_rule = affiliate.affiliate_commission_rules.active.order_placement.first
        end
      end
  end
end
