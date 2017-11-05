class AlterTableGoGamificationItemTypeAddKey < ActiveRecord::Migration[5.1]
  add_column :gamification_item_types, :key, :string
end
