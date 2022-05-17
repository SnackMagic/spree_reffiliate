Spree::PermittedAttributes.user_attributes.push :referral_code, :affiliate_code, :referral_credits, :referrer_benefit_enabled
Spree::PermittedAttributes.checkout_attributes.push :affiliate
config = Rails.application.config
config.after_initialize do
  config.spree.promotions.rules << Spree::Promotion::Rules::ReferredPromotionRule
  config.spree.promotions.rules << Spree::Promotion::Rules::AffiliatedPromotionRule
end
