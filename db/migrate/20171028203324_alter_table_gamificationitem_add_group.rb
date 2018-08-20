class AlterTableGamificationitemAddGroup < ActiveRecord::Migration[5.1]
  def change
    add_reference :gamification_items, :gamification_item_group,
      foreign_key: true
  end
end
