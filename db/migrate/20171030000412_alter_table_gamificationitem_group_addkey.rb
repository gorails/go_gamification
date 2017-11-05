class AlterTableGamificationitemGroupAddkey < ActiveRecord::Migration[5.1]
  def change
    add_column :gamification_item_groups, :key, :string
  end
end
