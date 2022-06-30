class AddGiftOrdersCommissionableAndSelfOrdersCommissionableToAffiliate < ActiveRecord::Migration[5.1]
  def change
    add_column :spree_affiliates, :gift_orders_commissionable, :boolean, default: true
    add_column :spree_affiliates, :self_orders_commissionable, :boolean, default: true
  end
end
