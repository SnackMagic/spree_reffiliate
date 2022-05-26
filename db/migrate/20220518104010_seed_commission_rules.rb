class SeedCommissionRules < ActiveRecord::Migration[5.1]
  def up
    Spree::CommissionRule.find_or_create_by(name: Spree::CommissionRule::ORDER_PLACEMENT, fixed_commission: false)
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
