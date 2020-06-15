module Gamification
  class Item < ApplicationRecord
    self.table_name = "gamification_items"
    belongs_to :item_type,class_name: 'Gamification::ItemType',foreign_key: :gamification_item_type_id
    belongs_to :item_group,class_name: 'Gamification::ItemGroup',foreign_key: :gamification_item_group_id
    belongs_to :user
    has_many :inventories,class_name: 'Gamification::Inventory',foreign_key: :gamification_item_id

    has_one_attached :image
    end
end
