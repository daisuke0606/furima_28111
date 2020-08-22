class RenameShippingDaysIColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shipping_days_i, :shipping_days_id
  end
end
