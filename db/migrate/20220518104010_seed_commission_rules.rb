class SeedCommissionRules < ActiveRecord::Migration[5.2]
  def up
    Spree::CommissionRule.find_or_create_by(name: Spree::CommissionRule::USER_REGISTRATION, fixed_commission: true)
    Spree::CommissionRule.find_or_create_by(name: Spree::CommissionRule::ORDER_PLACEMENT, fixed_commission: false)
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
