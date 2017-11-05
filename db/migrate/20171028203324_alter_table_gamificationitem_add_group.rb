class AlterTableGamificationitemAddGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :gamification_items, :gamification_item_group_id, :integer
  end
end
